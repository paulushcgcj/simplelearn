<template>
  <div class="company-detail-page container">
    <div v-if="company" class="company-info">
      <h1>{{ company.name }}</h1>
      <p>{{ company.description }}</p>
    </div>
    <div v-else class="flex justify-center">
      <p>Company not found.</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { Company } from '@/dtos/Company'
import { getCompanyById } from '@/services/companyService'

const props = defineProps<{
  id: number
}>()

const company = ref<Company | null>(null)

onMounted(() => {
  company.value = getCompanyById(props.id)
})
</script>

<style scoped>
.company-detail-page {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
}

.company-info {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.company-info h1 {
  margin-bottom: 1rem;
}

.company-info p {
  font-size: 1.2rem;
  color: #555;
  max-width: 600px;
}
</style>
