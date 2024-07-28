import { createWebHistory, createRouter } from 'vue-router'
import type { RouteRecordRaw, RouteLocationNormalized } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
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
    props: (route: RouteLocationNormalized) => ({
      page: parseInt((route.query.page as string) || '1'),
      size: parseInt((route.query.size as string) || '10')
    })
  },
  {
    name: 'companyDetails',
    path: '/companies/:id(\\d+)',
    component: () => import('@/views/CompanyDetailPage.vue'),
    props: (route: RouteLocationNormalized) => ({
      id: parseInt(route.params.id as string)
    })
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
    props: (route: RouteLocationNormalized) => ({
      id: parseInt(route.params.id as string)
    })
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
