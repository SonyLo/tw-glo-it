import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useUserStore = defineStore('users', () => {
	const users = ref([])
	const loading = ref(false)
	const error = ref(null)

	const fetchUsers = async (searchTerm = '') => {
		loading.value = true
		error.value = null

		try {
			const url = searchTerm
				? `http://127.0.0.1:3000?term=${encodeURIComponent(searchTerm)}`
				: 'http://127.0.0.1:3000'

			const response = await fetch(url)
			if (!response.ok) throw new Error('Ошибка при загрузке данных')

			users.value = await response.json()
		} catch (e) {
			error.value = e.message
		} finally {
			loading.value = false
		}
	}

	return {
		users,
		loading,
		error,
		fetchUsers
	}
}) 