<template>
  <div>
    <div class="filter-group">
      <input type="checkbox" id="filter-active" />
      <label for="filter-active" class="open-filter-button">
        <searchIcon class="svg" />
      </label>

      <div class="filter-container">
        <div>
          <label for="filter"><searchIcon class="svg" /></label>
          <input
            id="filter"
            v-if="filterEnabled"
            type="text"
            @input="$emit('filter', ($event.target as HTMLInputElement).value)"
            placeholder="Filter table"
          />
        </div>
      </div>
    </div>

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
import searchIcon from '@/assets/search.svg'

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
#filter-active {
  display: none;
}
label.open-filter-button {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  width: 1.5rem;
  height: 2.5rem;
  margin-right: 0.25rem;
}
label.open-filter-button svg {
  width: 1.5rem;
  height: 1.5rem;
  display: block;
  fill: var(--primary-color);
}
#filter-active:checked ~ .filter-container {
  visibility: visible;
  opacity: 1;
  max-height: 100px;
  transition:
    opacity 0.3s ease,
    max-height 0.3s ease;
  transition-delay: 0s, 0s;
}
.filter-group {
  display: flex;
  flex-direction: row-reverse;
  justify-content: flex-start;
  align-items: center;
}
.filter-container {
  visibility: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-grow: 1;
  opacity: 0;
  max-height: 0;
  transition:
    opacity 0.3s ease,
    max-height 0.3s ease,
    visibility 0s 0.3s;
}
div.filter-container div {
  display: flex;
  align-items: center;
  flex-grow: 1;
}
div.filter-container div label {
  flex-shrink: 0;
  height: 2.5rem;
  width: 2.5rem;
  background-color: var(--primary-color);
  fill: var(--tertiary-color);
  color: var(--tertiary-color);
  display: flex;
  justify-content: center;
  align-items: center;
  border: 2px solid var(--primary-color);
  border-right: none;
  transition: 150ms ease;
}
div.filter-container div input {
  box-sizing: border-box;
  flex-grow: 1;
  min-width: 0;
  height: 2.5rem;
  padding: 1em;
  border-radius: 0 0.55rem 0.55rem 0;
  border: 2px solid var(--primary-color);
  border-color: var(--primary-color, #ddd);
  border-left: none;
  transition: 150ms ease;
}
div.filter-container div input::placeholder {
  color: var(--secondary-color, #ddd);
  opacity: 1;
}
div.filter-container div input:hover {
  border-color: var(--supplementary-color, #ddd);
}
div.filter-container div input:focus {
  outline: none;
  border-color: var(--secondary-color, #007bff);
}
div.filter-container div:has(input:focus) > label {
  background-color: var(--secondary-color, #007bff);
  border-color: var(--secondary-color, #007bff);
  color: var(--secondary-color, #007bff);
}
div.filter-container div:has(input:hover) > label {
  background-color: var(--supplementary-color, #007bff);
  border-color: var(--supplementary-color, #ddd);
  color: var(--supplementary-color, #007bff);
}

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
