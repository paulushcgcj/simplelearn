import { createWebHistory, createRouter } from 'vue-router'
import type { RouteRecordRaw /*, RouteLocationNormalized*/ } from 'vue-router'

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
    name: 'product-list',
    path: '/products',
    component: () => import('@/views/products/ProductsListPage.vue')
  }
  /*{
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
    path: '/companies/details/:id',
    component: () => import('@/views/CompanyDetailPage.vue'),
    props: (route: RouteLocationNormalized) => ({
      id: route.params.id
    })
  },
  {
    name: 'companyCreate',
    path: '/companies/new',
    component: () => import('@/views/CompanyAddPage.vue')
  },
  {
    name: 'companyEdit',
    path: '/companies/edit/:id',
    component: () => import('@/views/CompanyEditPage.vue'),
    props: (route: RouteLocationNormalized) => ({
      id: route.params.id
    })
  }*/
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
