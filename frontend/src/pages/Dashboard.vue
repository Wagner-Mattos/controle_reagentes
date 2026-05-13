<script setup>
import { useAuthStore } from '../stores/auth'

const authStore = useAuthStore()
</script>

<template>
  <div class="dashboard">
    <h1>Painel de Controle</h1>
    <p class="welcome-text">Bem-vindo ao sistema de controle de reagentes.</p>
    
    <div class="user-card">
      <h3>Seus Dados</h3>
      <ul>
        <li><strong>ID:</strong> {{ authStore.user?.id }}</li>
        <li><strong>Nome:</strong> {{ authStore.user?.name || '-' }}</li>
        <li><strong>Usuário:</strong> {{ authStore.user?.username }}</li>
        <li><strong>E-mail:</strong> {{ authStore.user?.email }}</li>
      </ul>
    </div>
  </div>
</template>

<style scoped>
.dashboard {
  max-width: 800px;
}
h1 {
  margin-top: 0;
  color: #1f2937;
}
.user-card {
  background-color: white;
  padding: 1.5rem;
  border-radius: 8px;
  margin-top: 2rem;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
.user-card h3 {
  margin-top: 0;
  color: #1f2937;
}
.user-card ul {
  list-style: none;
  padding: 0;
}
.user-card li {
  margin-bottom: 0.5rem;
  color: #374151;
}
.welcome-text {
  color: #6b7280;
}
</style>