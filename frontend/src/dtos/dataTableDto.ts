/**
 * Represents the data structure for a column in a data table.
 */
export interface Column {
  key: string;
  label: string;
}

/**
 * Represents the data structure for an entry in a data table.
 */
export interface Entry {
  id: number;
  [key: string]: any; // eslint-disable-line @typescript-eslint/no-explicit-any
}

/**
 * Represents the data structure for pagination in a data table.
 */
export interface Pagination {
  prevPage: boolean;
  nextPage: boolean;
  currentPage: number;
  totalPages: number;
}

/**
 * Represents the data structure for a page list in a data table.
 */
export interface PageList {
  title: string;
  basePath: string;
  columns: Column[];
  entries: Entry[];
  pagination: Pagination;
}

/**
 * Represents the props for a data table component.
 */
export interface DataTableProps {
  columns: Column[];
  entries: Entry[];
  basePath: string;
  pagination?: Pagination;
  filterEnabled: boolean;
  sortable: boolean;
}