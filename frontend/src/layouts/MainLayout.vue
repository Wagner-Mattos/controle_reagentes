<script setup>
import { RouterView } from 'vue-router'
</script>

<template>
  <div class="main-layout">
    <header class="topbar">
      <h1>Sistema de Controle de Reagentes</h1>
    </header>
    <main class="content">
      <!-- Aqui as rotas filhas (como o Dashboard) serão renderizadas -->
      <RouterView />
    </main>
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
.content {
  flex: 1;
  padding: 1rem;
}
</style>