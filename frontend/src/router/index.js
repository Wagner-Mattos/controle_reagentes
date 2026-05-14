import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '../stores/auth'
import Login from '../pages/auth/Login.vue'
import Dashboard from '../pages/Dashboard.vue'
import Reagentes from '../pages/Reagentes.vue'
import Perfil from '../pages/Perfil.vue'
import MainLayout from '../layouts/MainLayout.vue'

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { guestOnly: true } // Apenas visitantes podem acessar
  },
  {
    path: '/',
    component: MainLayout,
    redirect: '/dashboard', // Redireciona visitas na raiz (/) para o dashboard
    meta: { requiresAuth: true }, // Protege o layout inteiro e todos os filhos
    children: [
      {
        path: 'dashboard',
        name: 'Dashboard',
        component: Dashboard,
      },
      {
        path: 'reagentes',
        name: 'Reagentes',
        component: Reagentes,
      },
      {
        path: 'perfil',
        name: 'Perfil',
        component: Perfil,
      },
      // Novas páginas como "Reagentes" entrarão aqui futuramente
    ]
  },
  {
    path: '/:pathMatch(.*)*',
    redirect: '/dashboard' // Redireciona rotas inexistentes
  }
]

const router = createRouter({
  history: createWebHistory('/gestao/'),
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