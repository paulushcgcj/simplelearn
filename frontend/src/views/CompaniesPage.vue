<template>
  <div class="company-list-page container">
    <h1 class="text-center">Company List</h1>
    <div class="actions">
      <router-link to="/companies/new" class="add">Add Company</router-link>
    </div>
    <ul class="company-list">
      <li v-for="company in companies" :key="company.id" class="company-item">
        <router-link :to="`companies/${company.id}`" class="company-link">
          <h2>{{ company.name }}</h2>
        </router-link>
        <p>{{ company.description }}</p>
        <div class="buttons">
          <router-link :to="`/companies/${company.id}/edit`" class="edit">
            Edit
          </router-link>
          <button @click="deleteCompany(company.id)" class="delete">
            Delete
          </button>
        </div>
      </li>
    </ul>
    <PaginationComponent
      :current-page="page"
      :total-entries="totalEntries"
      :page-size="size"
      @updatePage="handlePageUpdate"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import { useRouter } from 'vue-router'

import type { Company, Page } from '@/dtos/Company'
import { getCompanies, removeCompany } from '@/services/companyService'
import PaginationComponent from '@/components/AppPaginator.vue'

const props = defineProps<{
  page: number
  size: number
}>()

const companies = ref<Company[]>([])
const totalEntries = ref<number>(0)
const router = useRouter()

const loadCompanies = () => {
  const pageResult: Page<Company> = getCompanies(props.page, props.size)
  companies.value = pageResult.content
  totalEntries.value = pageResult.total
}

const handlePageUpdate = (page: number) => {
  router.push({ name: 'companies', query: { page, size: props.size } })
}

const deleteCompany = (id: number) => {
  removeCompany(id)
  loadCompanies()
}

onMounted(() => loadCompanies())

watch(
  () => props.page,
  () => {
    loadCompanies()
  }
)
</script>

<style scoped>
.company-list-page {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.company-list {
  width: 100%;
  list-style: none;
  padding: 0;
}

.company-item {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding: 1rem;
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-bottom: 1rem;
  background-color: #fff;
  transition: box-shadow 0.3s;
}

.company-item:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.company-link {
  text-decoration: none;
  color: inherit;
  width: 100%;
}

.company-item h2 {
  margin: 0 0 0.5rem 0;
}

.company-item p {
  margin: 0;
  font-size: 1rem;
  color: #555;
}

.actions {
  display: flex;
  justify-content: flex-end;
  width: 100%;
  margin-bottom: 1rem;
}

.add {
  padding: 0.75rem 1.5rem;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
  text-decoration: none;
}

.add:hover {
  background-color: #0056b3;
}

.buttons {
  display: flex;
  gap: 0.5rem;
}

.delete {
  padding: 0.5rem 1rem;
  background-color: #ff4d4d;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.delete:hover {
  background-color: #cc0000;
}

.edit {
  padding: 0.5rem 1rem;
  background-color: #ffc107;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.edit:hover {
  background-color: #e0a800;
}
</style>
