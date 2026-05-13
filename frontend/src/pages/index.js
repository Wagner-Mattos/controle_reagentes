import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '../stores/auth'
import Login from '../pages/auth/Login.vue'
import Dashboard from '../pages/Dashboard.vue'

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { guestOnly: true } // Apenas visitantes podem acessar
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { requiresAuth: true } // Apenas usuários logados
  },
  {
    path: '/:pathMatch(.*)*',
    redirect: '/dashboard' // Redireciona rotas inexistentes
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// Guardião de Rotas (Navigation Guard)
router.beforeEach((to, from, next) => {
  const authStore = useAuthStore()
  const isAuthenticated = authStore.isAuthenticated

  if (to.meta.requiresAuth && !isAuthenticated) {
    next({ name: 'Login' }) // Vai tentar acessar área restrita, manda pro Login
  } else if (to.meta.guestOnly && isAuthenticated) {
    next({ name: 'Dashboard' }) // Logado tentando acessar Login, manda pro Dashboard
  } else {
    next() // Tudo certo, prossegue com a navegação
  }
})

export default router