import { createWebHistory, createRouter } from 'vue-router'

const routes = [
  {
    name: 'home',
    path: '/',
    component: () => import('@/views/HomePage.vue')
  },
  {
    name: 'about',
    path: '/about',
    component: () => import('@/views/AboutPage.vue')
  },
  {
    name: 'companies',
    path: '/companies',
    component: () => import('@/views/CompaniesPage.vue'),
    props: (route: any) => ({ page: parseInt(route.query.page || '1'), size: parseInt(route.query.size || '10') })
  },
  {
    name: 'companyDetails',
    path: '/companies/:id(\\d+)',
    component: () => import('@/views/CompanyDetailPage.vue'),
    props: (route: any) => ({ id: parseInt(route.params.id) })
  },
  {
    name: 'companyCreate',
    path: '/companies/new',
    component: () => import('@/views/CompanyAddPage.vue')
  },
  {
    name: 'companyEdit',
    path: '/companies/:id(\\d+)/edit',
    component: () => import('@/views/CompanyEditPage.vue'),
    props: (route: any) => ({ id: parseInt(route.params.id) })
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
