<script setup>
import { useAuthStore } from '../stores/auth'
import { useRouter } from 'vue-router'

const authStore = useAuthStore()
const router = useRouter()

const handleLogout = () => {
  authStore.logout()
  router.push('/login')
}
</script>

<template>
  <div class="dashboard">
    <h1>Painel de Controle</h1>
    <p>Bem-vindo, <strong>{{ authStore.user?.email }}</strong>!</p>
    
    <button @click="handleLogout">Sair</button>
  </div>
</template>

<style scoped>
.dashboard {
  padding: 2rem;
  font-family: sans-serif;
}
</style>