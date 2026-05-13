<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from './stores/auth'
import pb from './services/pocketbase'
import { toast } from 'vue3-toastify'

const authStore = useAuthStore()
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
    <router-view />
  </main>
</template>