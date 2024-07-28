<template>
  <nav class="pagination">
    <button :disabled="currentPage === 1" @click="prevPage">Previous</button>
    <span>Page {{ currentPage }} / {{ totalPages }}</span>
    <button :disabled="currentPage === totalPages" @click="nextPage">
      Next
    </button>
  </nav>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  currentPage: number
  totalEntries: number
  pageSize: number
}>()

const emits = defineEmits(['updatePage'])

const totalPages = computed(() =>
  Math.ceil(props.totalEntries / props.pageSize)
)

const prevPage = () => {
  if (props.currentPage > 1) {
    emits('updatePage', props.currentPage - 1)
  }
}

const nextPage = () => {
  if (props.currentPage < totalPages.value) {
    emits('updatePage', props.currentPage + 1)
  }
}
</script>

<style scoped>
.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 1rem;
  margin-top: 1rem;
}

button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
</style>
