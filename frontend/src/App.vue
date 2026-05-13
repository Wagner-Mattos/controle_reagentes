<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from './stores/auth'
import { useUiStore } from './stores/ui'
import pb from './services/pocketbase'
import { toast } from 'vue3-toastify'

const authStore = useAuthStore()
const uiStore = useUiStore()
const router = useRouter()

onMounted(() => {
  // 1. Verifica no carregamento da página se há um token antigo já expirado
  if (authStore.token && !pb.authStore.isValid) {
    authStore.logout()
    toast.info('Sua sessão expirou. Por favor, faça login novamente.')
  }

  // 2. Escuta mudanças na autenticação em tempo real (ex: logout feito em outra aba)
  pb.authStore.onChange((token, model) => {
    authStore.token = token
    authStore.user = model

    // Se perder a autenticação e estiver numa página protegida, manda pro login
    if (!token && router.currentRoute.value.meta.requiresAuth) {
      router.push('/login')
    }
  })
})
</script>

<template>
  <main style="margin: 0; padding: 0;">
    <!-- Spinner Global -->
    <div v-if="uiStore.isLoading" class="global-spinner-overlay">
      <div class="spinner"></div>
      <p v-if="uiStore.loadingMessage" class="spinner-message">{{ uiStore.loadingMessage }}</p>
    </div>

    <router-view />
  </main>
</template>

<style>
.global-spinner-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(255, 255, 255, 0.8);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  backdrop-filter: blur(2px);
}
.spinner {
  border: 4px solid #f3f3f3;
  border-top: 4px solid #3b82f6;
  border-radius: 50%;
  width: 48px;
  height: 48px;
  animation: spin 1s linear infinite;
}
.spinner-message {
  margin-top: 1rem;
  color: #1f2937;
  font-weight: 500;
}
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>