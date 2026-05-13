<script setup>
import { onMounted } from 'vue'
import pb from './services/pocketbase'

onMounted(async () => {
  try {
    const health = await pb.health.check()

    console.log('PocketBase OK:', health)

  } catch (err) {
    console.error('Erro conexão:', err)
  }
})
</script>

<template>
  <div>
    <h1>Teste PocketBase</h1>
    <p>Verifique o console do navegador.</p>
  </div>
</template>