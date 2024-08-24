export interface Product {
  supplier_ids: string
  id: number
  product_code: string
  product_name: string
  description: string | null
  standard_cost: number
  list_price: number
  reorder_level: number
  target_level: number
  quantity_per_unit: string | null
  discontinued: number
  minimum_reorder_quantity: number | null
  category: string
  attachments: string
  create_user: string
}
