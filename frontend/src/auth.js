import { defineStore } from 'pinia'
import pb from '../services/pocketbase'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    // Inicializa o estado com os dados já presentes no PocketBase (útil ao recarregar a página)
    user: pb.authStore.record,
    token: pb.authStore.token,
  }),
  getters: {
    isAuthenticated: (state) => !!state.token,
  },
  actions: {
    async login(email, password) {
      const authData = await pb.collection('users').authWithPassword(email, password)
      this.user = authData.record
      this.token = authData.token
    },
    logout() {
      pb.authStore.clear()
      this.user = null
      this.token = ''
    }
  }
})