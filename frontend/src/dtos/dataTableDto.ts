export interface Column {
  key: string
  label: string
}

export interface Entry {
  id: number
  [key: string]: any // eslint-disable-line @typescript-eslint/no-explicit-any
}

export interface Pagination {
  prevPage: boolean
  nextPage: boolean
}
