<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '../../stores/auth'
import { toast } from 'vue3-toastify'

const authStore = useAuthStore()
const router = useRouter()
const email = ref('')
const password = ref('')
const isLoading = ref(false)

const handleLogin = async () => {
  isLoading.value = true
  
  try {
    // Tenta autenticar o usuário através da store do Pinia
    await authStore.login(email.value, password.value)
    toast.success('Login realizado com sucesso!')
    
    router.push('/dashboard')
    
  } catch (err) {
    console.error('Erro de autenticação:', err)
    toast.error('Falha ao entrar. Verifique seu e-mail e senha e tente novamente.')
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <div class="login-container">
    <div class="login-box">
      <h2>Controle de Reagentes</h2>
      <p class="subtitle">Faça login para continuar</p>
      
      <form @submit.prevent="handleLogin">
        <div class="form-group">
          <label for="email">E-mail</label>
          <input
            id="email"
            v-model="email"
            type="email"
            required
            placeholder="admin@exemplo.com"
          />
        </div>
        
        <div class="form-group">
          <label for="password">Senha</label>
          <input
            id="password"
            v-model="password"
            type="password"
            required
            placeholder="Sua senha"
          />
        </div>
        
        <button type="submit" :disabled="isLoading">
          {{ isLoading ? 'Entrando...' : 'Entrar' }}
        </button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f3f4f6;
  font-family: sans-serif;
}
.login-box {
  background: white;
  padding: 2.5rem;
  border-radius: 8px;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}
h2 {
  text-align: center;
  color: #1f2937;
  margin-bottom: 0.5rem;
  margin-top: 0;
}
.subtitle {
  text-align: center;
  color: #6b7280;
  margin-bottom: 2rem;
  font-size: 0.875rem;
}
.form-group {
  margin-bottom: 1.25rem;
}
label {
  display: block;
  margin-bottom: 0.5rem;
  color: #374151;
  font-size: 0.875rem;
  font-weight: 500;
}
input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 1rem;
  box-sizing: border-box;
  outline: none;
  transition: border-color 0.2s;
}
input:focus {
  border-color: #3b82f6;
}
button {
  width: 100%;
  padding: 0.75rem;
  background-color: #3b82f6;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.2s;
}
button:hover:not(:disabled) {
  background-color: #2563eb;
}
button:disabled {
  background-color: #93c5fd;
  cursor: not-allowed;
}
</style>