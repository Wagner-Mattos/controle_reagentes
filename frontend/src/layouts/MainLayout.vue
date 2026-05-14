<script setup>
import { computed } from 'vue'
import { RouterView, RouterLink, useRouter } from 'vue-router'
import { useAuthStore } from '../stores/auth'
import pb from '../services/pocketbase'

const router = useRouter()
const authStore = useAuthStore()

const handleLogout = () => {
  authStore.logout()
  router.push('/login')
}

// Computa a URL do avatar. Atualiza automaticamente se o authStore mudar!
const avatarUrl = computed(() => {
  if (authStore.user && authStore.user.avatar) {
    return pb.files.getUrl(authStore.user, authStore.user.avatar)
  }
  return ''
})

// Computa o cargo (role) traduzido para exibir na barra lateral
const roleDisplay = computed(() => {
  const role = authStore.user?.role
  const rolesMap = {
    admin: 'Administrador',
    supervisor: 'Supervisor',
    technician: 'Técnico',
    viewer: 'Visualizador'
  }
  return rolesMap[role] || 'Não definido'
})
</script>

<template>
  <div class="main-layout">
    <header class="topbar">
      <h1>Sistema de Controle de Reagentes</h1>
    </header>
    <div class="body-container">
      <aside class="sidebar">
        <nav>
          <ul>
            <li><RouterLink to="/dashboard">Dashboard</RouterLink></li>
            <li><RouterLink to="/reagentes">Reagentes</RouterLink></li>
            <!-- Mais links podem ser adicionados aqui futuramente -->
          </ul>
        </nav>
        <div class="sidebar-footer">
          <div class="user-profile">
            <img v-if="avatarUrl" :src="avatarUrl" alt="Avatar do usuário" class="avatar-img" />
            <div v-else class="avatar-placeholder">
              {{ authStore.user?.name?.charAt(0).toUpperCase() || authStore.user?.username?.charAt(0).toUpperCase() || 'U' }}
            </div>
            <div class="user-details">
              <span class="user-name">{{ authStore.user?.name || authStore.user?.username || 'Usuário' }}</span>
              <span class="user-role">{{ roleDisplay }}</span>
            </div>
          </div>
          
          <RouterLink to="/perfil" class="profile-link">Minha Conta</RouterLink>
          <button @click="handleLogout" class="logout-btn">Sair</button>
        </div>
      </aside>
      <main class="content">
        <!-- Aqui as rotas filhas (como o Dashboard) serão renderizadas -->
        <RouterView />
      </main>
    </div>
  </div>
</template>

<style scoped>
.main-layout {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
.topbar {
  background-color: #1f2937;
  color: white;
  padding: 1rem;
}
.body-container {
  display: flex;
  flex: 1;
}
.sidebar {
  width: 220px;
  background-color: #f3f4f6;
  border-right: 1px solid #e5e7eb;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.sidebar ul {
  list-style: none;
  padding: 0;
  margin: 0;
}
.sidebar li {
  margin-bottom: 0.5rem;
}
.sidebar a {
  text-decoration: none;
  color: #374151;
  display: block;
  padding: 0.5rem;
  border-radius: 4px;
  transition: background-color 0.2s;
}
.sidebar a:hover, .sidebar a.router-link-active {
  background-color: #e5e7eb;
  font-weight: 500;
}
.user-profile {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 1rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #d1d5db;
}
.avatar-img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px solid #d1d5db;
}
.avatar-placeholder {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: #3b82f6;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 1.2rem;
}
.user-name {
  font-size: 0.875rem;
  font-weight: 600;
  color: #374151;
  line-height: 1.2;
}
.user-role {
  display: block;
  font-size: 0.75rem;
  color: #6b7280;
  margin-top: 0.125rem;
}
.profile-link {
  display: block;
  text-align: center;
  padding: 0.5rem;
  margin-bottom: 0.5rem;
  background-color: white;
  border: 1px solid #d1d5db;
  color: #374151;
  border-radius: 4px;
  text-decoration: none;
  transition: background-color 0.2s;
}
.profile-link:hover {
  background-color: #f9fafb;
}
.logout-btn {
  width: 100%;
  padding: 0.5rem;
  background-color: #ef4444;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-align: center;
  font-weight: 500;
  transition: background-color 0.2s;
}
.logout-btn:hover {
  background-color: #dc2626;
}
.content {
  flex: 1;
  padding: 1rem;
}
</style>