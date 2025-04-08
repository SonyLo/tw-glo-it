<script setup>
import { ref, watch } from 'vue'
import { useUserStore } from '@/stores/userStore'

const props = defineProps({
	placeholder: {
		type: String,
		default: 'Поиск...'
	}
})

const searchTerm = ref('')
const userStore = useUserStore()

// Debounce функция
let timeout
const debounce = (fn, delay) => {
	clearTimeout(timeout)
	timeout = setTimeout(fn, delay)
}

watch(searchTerm, (newValue) => {
	debounce(() => {
		userStore.fetchUsers(newValue)
	}, 300)
})
</script>

<template>
	<div class="search-input">
		<input type="text" v-model="searchTerm" :placeholder="placeholder" class="search-input__field" />
		<svg class="search-input__icon" width="20" height="20" viewBox="0 0 20 20" fill="none"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" clip-rule="evenodd"
				d="M13.8033 13.8033C10.8744 16.7322 6.12563 16.7322 3.1967 13.8033C0.267767 10.8744 0.267767 6.12563 3.1967 3.1967C6.12563 0.267767 10.8744 0.267767 13.8033 3.1967C16.7322 6.12563 16.7322 10.8744 13.8033 13.8033ZM14.1457 14.8545C10.8078 17.8256 5.69007 17.7109 2.48959 14.5104C-0.829864 11.191 -0.829864 5.80905 2.48959 2.48959C5.80905 -0.829864 11.191 -0.829864 14.5104 2.48959C17.7115 5.69065 17.8256 10.8097 14.8529 14.1475L19.4605 18.7551C19.6558 18.9504 19.6558 19.267 19.4605 19.4622C19.2653 19.6575 18.9487 19.6575 18.7534 19.4622L14.1457 14.8545Z"
				fill="#432EAB" />
		</svg>

		<!-- <svg class="search-input__icon" width="24" height="24" viewBox="0 0 24 24" fill="none"
			xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" clip-rule="evenodd"
				d="M16.4697 16.4697C16.7626 16.1768 17.2374 16.1768 17.5303 16.4697L22.2803 21.2197C22.5732 21.5126 22.5732 21.9874 22.2803 22.2803C21.9874 22.5732 21.5126 22.5732 21.2197 22.2803L16.4697 17.5303C16.1768 17.2374 16.1768 16.7626 16.4697 16.4697Z"
				fill="#432EAB" />
			<path fill-rule="evenodd" clip-rule="evenodd"
				d="M10 2C5.58172 2 2 5.58172 2 10C2 14.4183 5.58172 18 10 18C14.4183 18 18 14.4183 18 10C18 5.58172 14.4183 2 10 2ZM0 10C0 4.47715 4.47715 0 10 0C15.5228 0 20 4.47715 20 10C20 15.5228 15.5228 20 10 20C4.47715 20 0 15.5228 0 10Z"
				fill="#432EAB" />
		</svg> -->
	</div>
</template>

<style scoped>
.search-input {
	position: relative;
	width: 100%;
	/* max-width: 892px; */
	margin: 0 auto;
}

.search-input__field {
	width: 100%;
	height: 48px;
	padding: 14px 48px 14px 16px;
	background: #FFFFFF;
	border: 1px solid #E2E8F0;
	border-radius: 24px;
	font-size: 14px;
	line-height: 20px;
	color: #262C40;
	outline: none;
	transition: border-color 0.2s ease;
}

.search-input__field::placeholder {
	color: #8189A3;
}

.search-input__field:focus {
	border-color: #432EAB;
}

.search-input__icon {
	position: absolute;
	right: 16px;
	top: 50%;
	transform: translateY(-50%);
	pointer-events: none;
}
</style>