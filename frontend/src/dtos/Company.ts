export interface Company {
  id: number
  name: string
  description: string
}

export interface Page<T> {
  content: T[]
  total: number
  size: number
  page: number
}
