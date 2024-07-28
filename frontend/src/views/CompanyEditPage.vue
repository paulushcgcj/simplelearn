<template>
  <div class="edit-company-page container">
    <h1>Edit Company</h1>
    <form @submit.prevent="submitForm">
      <div class="form-group">
        <label for="name">Company Name</label>
        <input v-model="company.name" type="text" id="name" required />
      </div>
      <div class="form-group">
        <label for="description">Description</label>
        <textarea
          v-model="company.description"
          id="description"
          required
        ></textarea>
      </div>
      <button type="submit" class="submit-button">Update Company</button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { Company } from '@/dtos/Company'
import { getCompanyById, updateCompany } from '@/services/companyService'

const props = defineProps<{
  id: number
}>()

const company = ref<Company>({ id: 0, name: '', description: '' })
const router = useRouter()

onMounted(() => {
  company.value = getCompanyById(props.id)
  if (!company.value) {
    router.push('/companies') // Redirect to list if company not found
  }
})

const submitForm = () => {
  updateCompany(company.value)
  router.push('/companies')
}
</script>

<style scoped>
.edit-company-page {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 1rem;
  width: 100%;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

input,
textarea {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.submit-button {
  padding: 0.75rem 1.5rem;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-button:hover {
  background-color: #0056b3;
}
</style>
