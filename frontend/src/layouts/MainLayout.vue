<script setup>
import { RouterView, RouterLink, useRouter } from 'vue-router'
import { useAuthStore } from '../stores/auth'

const router = useRouter()
const authStore = useAuthStore()

const handleLogout = () => {
  authStore.logout()
  router.push('/login')
}
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