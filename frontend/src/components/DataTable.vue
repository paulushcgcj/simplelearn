<template>
  <div>
    <input
      v-if="filterEnabled"
      type="text"
      @input="$emit('filter', ($event.target as HTMLInputElement).value)"
      placeholder="Filter..."
    />

    <table>
      <thead>
        <tr>
          <th
            v-for="column in columns"
            :key="column.key"
            @click="$emit('sort', column.key)"
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
            <div class="action-buttons">
              <router-link
                :to="`${basePath}/${entry.id}`"
                custom
                v-slot="{ navigate }"
              >
                <button @click="navigate" role="link">View</button>
              </router-link>
              <router-link
                :to="`${basePath}/edit/${entry.id}`"
                custom
                v-slot="{ navigate }"
              >
                <button @click="navigate" role="link">Edit</button>
              </router-link>
              <button @click="emit('delete', entry.id)">Delete</button>
            </div>
          </td>
        </tr>
        <tr v-if="pagination">
          <td colspan="100%">
            <div class="pagination-controls">
              <div class="action-buttons">
                <button
                  @click="$emit('firstPage')"
                  :disabled="!pagination.prevPage"
                >
                  First
                </button>
                <button
                  @click="$emit('prevPage')"
                  :disabled="!pagination.prevPage"
                >
                  Previous
                </button>
              </div>
              <span class="page-info">
                Page {{ currentPage }} of {{ totalPages }}
              </span>
              <div class="action-buttons">
                <button
                  @click="$emit('nextPage')"
                  :disabled="!pagination.nextPage"
                >
                  Next
                </button>
                <button
                  @click="$emit('lastPage')"
                  :disabled="!pagination.nextPage"
                >
                  Last
                </button>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import type { DataTableProps } from '@/dtos/dataTableDto'

const props = withDefaults(defineProps<DataTableProps>(), {
  filterEnabled: true,
  sortable: true
})

const emit = defineEmits<{
  (e: 'nextPage'): void
  (e: 'firstPage'): void
  (e: 'prevPage'): void
  (e: 'lastPage'): void
  (e: 'delete', id: number): void
  (e: 'filter', filter: string): void
  (e: 'sort', sort: string): void
}>()

const sortOrderIcon = (columnKey: string) => {
  console.log(columnKey)
  return '>' // Placeholder for sort direction
}

// Computed properties for current page and total pages
const currentPage = computed(() => props.pagination?.currentPage ?? 1)
const totalPages = computed(() => props.pagination?.totalPages ?? 1)
</script>

<style scoped>
table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 1rem;
  border: 1px solid var(--tertiary-color, #ddd);
  text-align: left;
}

th {
  background-color: var(--tertiary-color, #f4f4f4);
}

button {
  margin-right: 0.5rem;
  padding: 0.33rem 0.75rem;
  background-color: var(--secondary-colo, #007bff);
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 4px;
}

button:hover {
  background-color: var(--suplementary-color, #0056b3);
}

div {
  margin-top: 20px;
}

input[type='text'] {
  margin-bottom: 10px;
  padding: 8px;
  border: 1px solid var(--tertiary-color, #ddd);
  border-radius: 4px;
}
.pagination-controls {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 0px;
  padding: 0px;
}
.page-info {
  font-weight: bold;
}
.action-buttons {
  display: flex;
}
.action-buttons button {
  margin: 0;
  border-radius: 0;
}
.action-buttons button:first-child {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}

.action-buttons button:last-child {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}

.action-buttons button:not(:last-child) {
  border-right: 1px solid var(--tertiary-color, #ddd);
}
</style>
