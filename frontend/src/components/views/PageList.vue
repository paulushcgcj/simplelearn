<template>
  <div>
    <header>
      <h1>{{ title }}</h1>
      <router-link :to="`${basePath}/add`">
        <button>Add New</button>
      </router-link>
    </header>
    <DataTable
      :columns="columns"
      :entries="entries"
      :basePath="basePath"
      :pagination="pagination"
      @nextPage="$emit('nextPage')"
      @prevPage="$emit('prevPage')"
      @delete="$emit('delete', $event)"
      @filter="$emit('filter', $event)"
      @sort="$emit('sort', $event)"
    />
  </div>
</template>

<script setup lang="ts">
import { PropType } from 'vue'
import DataTable from '@/components/DataTable.vue'
import type { Column, Entry, Pagination } from '@/dtos/dataTableDto'

defineProps({
  title: {
    type: String,
    required: true
  },
  basePath: {
    type: String,
    required: true
  },
  columns: {
    type: Array as PropType<Column[]>,
    required: true
  },
  entries: {
    type: Array as PropType<Entry[]>,
    required: true
  },
  pagination: {
    type: Object as PropType<Pagination>,
    required: false
  }
})

defineEmits(['nextPage', 'prevPage', 'delete', 'filter', 'sort'])
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
