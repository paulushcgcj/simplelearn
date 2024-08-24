<template>
  <div>
    <header>
      <h1>{{ title }}</h1>
      <router-link :to="`${basePath}/add`">
        <button>Add New</button>
      </router-link>
    </header>
    <DataTable
      :columns
      :entries
      :basePath
      :pagination
      @nextPage="$emit('nextPage')"
      @firstPage="$emit('firstPage')"
      @prevPage="$emit('prevPage')"
      @lastPage="$emit('lastPage')"
      @delete="$emit('delete', $event)"
      @filter="$emit('filter', $event)"
      @sort="$emit('sort', $event)"
    />
  </div>
</template>

<script setup lang="ts">
// Importing components
import DataTable from '@/components/DataTable.vue'
// Importing types
import type { PageList } from '@/dtos/dataTableDto'

// Defining props and emits
defineProps<PageList>()
defineEmits<{
  (e: 'nextPage'): void
  (e: 'firstPage'): void
  (e: 'prevPage'): void
  (e: 'lastPage'): void
  (e: 'delete', id: number): void
  (e: 'filter', filter: string): void
  (e: 'sort', sort: string): void
}>()
</script>

<style scoped>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

h1 {
  margin: 0;
}

button {
  padding: 8px 12px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 4px;
}

button:hover {
  background-color: #0056b3;
}
</style>
