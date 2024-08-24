<template>
  <div>
    <input
      v-if="filterEnabled"
      type="text"
      @input="onFilter($event)"
      placeholder="Filter..."
    />

    <table>
      <thead>
        <tr>
          <th
            v-for="column in columns"
            :key="column.key"
            @click="onSort(column.key)"
          >
            {{ column.label }}
            <span v-if="sortable">{{ sortOrderIcon(column.key) }}</span>
          </th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="entry in entries" :key="entry.id">
          <td v-for="column in columns" :key="column.key">
            {{ entry[column.key] }}
          </td>
          <td>
            <router-link :to="`${basePath}/${entry.id}`">
              <button>View</button>
            </router-link>
            <router-link :to="`${basePath}/edit/${entry.id}`">
              <button>Edit</button>
            </router-link>
            <button @click="deleteEntry(entry.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>

    <div v-if="pagination">
      <button @click="prevPage" :disabled="!pagination.prevPage">
        Previous
      </button>
      <button @click="nextPage" :disabled="!pagination.nextPage">Next</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { PropType } from 'vue'
import type { Column, Entry, Pagination } from '@/dtos/dataTableDto'

defineProps({
  columns: {
    type: Array as PropType<Column[]>,
    required: true
  },
  entries: {
    type: Array as PropType<Entry[]>,
    required: true
  },
  basePath: {
    type: String,
    required: true
  },
  pagination: {
    type: Object as PropType<Pagination>,
    required: false
  },
  filterEnabled: {
    type: Boolean,
    default: true
  },
  sortable: {
    type: Boolean,
    default: true
  }
})

const emit = defineEmits(['delete', 'nextPage', 'prevPage', 'filter', 'sort'])

const deleteEntry = (id: number) => {
  emit('delete', id)
}
const nextPage = () => {
  emit('nextPage')
}

const prevPage = () => {
  emit('prevPage')
}

const onFilter = (event: Event) => {
  emit('filter', (event.target as HTMLInputElement).value)
}

const onSort = (columnKey: string) => {
  emit('sort', columnKey)
}

const sortOrderIcon = (columnKey: string) => {
  console.log(columnKey)
  // Implement a method to show sort icons, based on current state
  return '>' // Placeholder for sort direction
}
</script>

<style scoped>
table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 12px;
  border: 1px solid #ddd;
  text-align: left;
}

th {
  background-color: #f4f4f4;
}

button {
  margin-right: 8px;
  padding: 6px 12px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 4px;
}

button:hover {
  background-color: #0056b3;
}

div {
  margin-top: 20px;
}
</style>
