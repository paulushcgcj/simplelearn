<template>
  <PageView
    title="Products"
    :basePath="'/products'"
    :columns="columns"
    :entries="entries"
    :pagination="pagination"
    @nextPage="loadNextPage"
    @firstPage="loadData(1)"
    @prevPage="loadPrevPage"
    @lastPage="loadData(pagination.totalPages)"
    @filter="handleFilter"
    @sort="handleSort"
    @delete="handleDelete"
  />
</template>

<script setup lang="ts">
// default vue
import { ref, onMounted } from 'vue'
// custom components
import PageView from '@/components/views/PageList.vue'
// types
import type { Product } from '@/dtos'
// data
import productsMock from '@/mock/products.json'

const entries = ref<Product[]>([])
const page = ref(1)
const columns = ref([
  { key: 'product_name', label: 'Product Name' },
  { key: 'product_code', label: 'Code' },
  { key: 'standard_cost', label: 'Cost' },
  { key: 'category', label: 'Category' }
])
const pagination = ref({
  prevPage: false,
  nextPage: true,
  currentPage: 1,
  totalPages: 1
})

const loadNextPage = async () => {
  await loadData(++page.value)
}

const loadPrevPage = async () => {
  await loadData(--page.value)
}

const handleDelete = async (id: number) => {
  console.log('Delete entry with id:', id)
}

const handleFilter = async (filter: string) => {
  console.log('Filter:', filter)
  //await loadData(1, filter)
}

const handleSort = async (sort: string) => {
  console.log('Sort:', sort)
  //await loadData(1, '', sort)
}

const loadData = async (page = 1, filter = '', sort = '') => {
  console.log('Load data:', page, filter, sort)
  const mockData: Product[] = productsMock as unknown as Product[]
  const currentPage = page
  const startIndex =
    (currentPage - 1) * 5 > mockData.length
      ? mockData.length
      : (currentPage - 1) * 5
  const endIndex =
    currentPage * 5 > mockData.length ? mockData.length : currentPage * 5
  entries.value = mockData.slice(startIndex, endIndex)
  pagination.value = {
    prevPage: currentPage > 1,
    nextPage: currentPage * 5 < mockData.length,
    currentPage: currentPage,
    totalPages: Math.ceil(mockData.length / 5)
  }
}

onMounted(async () => {
  await loadData() // Initial data load
})
</script>
