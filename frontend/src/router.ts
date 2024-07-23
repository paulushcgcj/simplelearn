import { createMemoryHistory, createRouter } from 'vue-router'

const routes = [
  { 
    name: 'home',
    path: '/',
    component: () => import('./pages/HomeView.vue') 
  },
  { 
    name: 'about',
    path: '/about',
    component: () => import('./pages/AboutView.vue') 
  },
  { 
    name: 'profile',
    path: '/profile',
    component: () => import('./pages/ProfileView.vue'),
    props: route => ({ msg: `Hello from router! ${route.query.name} | ${route.params.msg}` }),
  },
]

const router = createRouter({
  history: createMemoryHistory(),
  routes,
});

export default router;