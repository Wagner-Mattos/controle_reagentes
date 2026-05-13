<script setup>
import { ref, onMounted } from 'vue'
import { useAuthStore } from '../stores/auth'
import pb from '../services/pocketbase'
import { toast } from 'vue3-toastify'

const authStore = useAuthStore()

const name = ref('')
const username = ref('')
const email = ref('')
const oldPassword = ref('')
const newPassword = ref('')
const newPasswordConfirm = ref('')
const isLoading = ref(false)
const avatarFile = ref(null)
const avatarPreview = ref('')

onMounted(() => {
  // Carrega os dados iniciais do usuário logado
  if (authStore.user) {
    name.value = authStore.user.name || ''
    username.value = authStore.user.username || ''
    email.value = authStore.user.email || ''
    
    if (authStore.user.avatar) {
      avatarPreview.value = pb.files.getUrl(authStore.user, authStore.user.avatar)
    }
  }
})

const handleAvatarChange = (event) => {
  const file = event.target.files[0]
  if (file) {
    avatarFile.value = file
    avatarPreview.value = URL.createObjectURL(file)
  }
}

const handleSave = async () => {
  isLoading.value = true
  try {
    // Validação de senha local
    if (newPassword.value || oldPassword.value) {
      if (newPassword.value !== newPasswordConfirm.value) {
        toast.error('As novas senhas não coincidem.')
        isLoading.value = false
        return
      }
      if (!oldPassword.value) {
        toast.error('A senha atual é obrigatória para alterar a senha.')
        isLoading.value = false
        return
      }
    }

    // Usamos FormData em vez de JSON para suportar upload de arquivos
    const formData = new FormData()
    formData.append('name', name.value)
    formData.append('username', username.value)
    
    // Se o usuário preencheu a nova senha, adiciona os campos necessários para o PocketBase
    if (newPassword.value) {
      formData.append('oldPassword', oldPassword.value)
      formData.append('password', newPassword.value)
      formData.append('passwordConfirm', newPasswordConfirm.value)
    }
    
    if (avatarFile.value) {
      formData.append('avatar', avatarFile.value)
    }
    
    // Atualiza os dados no PocketBase
    const updatedUser = await pb.collection('users').update(authStore.user.id, formData)
    
    // Atualiza o estado local do Pinia com os novos dados
    authStore.user = updatedUser 
    
    // Limpa os campos de senha após salvar com sucesso
    oldPassword.value = ''
    newPassword.value = ''
    newPasswordConfirm.value = ''
    
    toast.success('Perfil atualizado com sucesso!')
  } catch (err) {
    console.error('Erro ao atualizar perfil:', err)
    toast.error('Erro ao salvar as alterações.')
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <div class="perfil-page">
    <header class="page-header">
      <h2>Minha Conta</h2>
    </header>
    
    <div class="content-area">
      <form @submit.prevent="handleSave" class="form-perfil">
        <div class="avatar-section">
          <div class="avatar-preview">
            <img v-if="avatarPreview" :src="avatarPreview" alt="Avatar" />
            <div v-else class="avatar-placeholder">Sem Foto</div>
          </div>
          <div class="form-group avatar-input">
            <label for="avatar">Foto de Perfil</label>
            <input id="avatar" type="file" accept="image/*" @change="handleAvatarChange" />
          </div>
        </div>

        <div class="form-group">
          <label for="email">E-mail</label>
          <input id="email" type="email" v-model="email" disabled title="A alteração de e-mail deve ser feita em área específica" />
        </div>
        
        <div class="form-group">
          <label for="username">Nome de Usuário</label>
          <input id="username" type="text" v-model="username" required />
        </div>
        
        <div class="form-group">
          <label for="name">Nome Completo</label>
          <input id="name" type="text" v-model="name" />
        </div>
        
        <hr class="divider" />
        <h3>Alterar Senha</h3>
        
        <div class="form-group">
          <label for="oldPassword">Senha Atual</label>
          <input id="oldPassword" type="password" v-model="oldPassword" placeholder="Preencha apenas se for alterar a senha" />
        </div>
        
        <div class="form-group">
          <label for="newPassword">Nova Senha</label>
          <input id="newPassword" type="password" v-model="newPassword" />
        </div>
        
        <div class="form-group">
          <label for="newPasswordConfirm">Confirmar Nova Senha</label>
          <input id="newPasswordConfirm" type="password" v-model="newPasswordConfirm" />
        </div>
        
        <button type="submit" class="btn-primary" :disabled="isLoading">
          {{ isLoading ? 'Salvando...' : 'Salvar Alterações' }}
        </button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.page-header {
  margin-bottom: 2rem;
}
.page-header h2 {
  margin: 0;
  color: #1f2937;
}
.content-area {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  max-width: 500px;
}
.form-group {
  margin-bottom: 1.25rem;
}
label {
  display: block;
  margin-bottom: 0.5rem;
  color: #374151;
  font-weight: 500;
}
input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 1rem;
  box-sizing: border-box;
}
input:disabled {
  background-color: #f3f4f6;
  color: #9ca3af;
  cursor: not-allowed;
}
.btn-primary {
  background-color: #3b82f6;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 500;
  width: 100%;
  transition: background-color 0.2s;
}
.btn-primary:hover:not(:disabled) {
  background-color: #2563eb;
}
.btn-primary:disabled {
  background-color: #93c5fd;
  cursor: not-allowed;
}
.divider {
  border: 0;
  border-top: 1px solid #e5e7eb;
  margin: 2rem 0;
}
h3 {
  margin-top: 0;
  margin-bottom: 1.25rem;
  color: #374151;
  font-size: 1.125rem;
}
.avatar-section {
  display: flex;
  align-items: center;
  gap: 1.5rem;
  margin-bottom: 2rem;
}
.avatar-preview {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  overflow: hidden;
  background-color: #e5e7eb;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid #d1d5db;
}
.avatar-preview img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.avatar-placeholder {
  color: #9ca3af;
  font-size: 0.75rem;
  text-align: center;
}
.avatar-input {
  margin-bottom: 0;
}
.avatar-input input {
  padding: 0.5rem;
}
</style>