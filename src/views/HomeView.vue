<script setup>
import { ref, onMounted } from 'vue'
import { useUserStore } from '@/stores/userStore'
import SearchInput from '@/components/SearchInput.vue'
import UserCard from '@/components/UserCard.vue'
import Modal from '@/components/Modal.vue'

const userStore = useUserStore()
const selectedUser = ref(null)
const isModalOpen = ref(false)

onMounted(() => {
  userStore.fetchUsers()
})

const handleUserClick = (user) => {
  selectedUser.value = user
  isModalOpen.value = true
}

const handleModalClose = () => {
  isModalOpen.value = false
  selectedUser.value = null
}
</script>

<template>
  <main class="home">
    <div class="container">
      <h1 class="title">Поиск пользователей</h1>

      <SearchInput />

      <div v-if="userStore.loading" class="loading">
        Загрузка...
      </div>

      <div v-else-if="userStore.error" class="error">
        {{ userStore.error }}
      </div>

      <div v-else class="users-grid">
        <UserCard v-for="user in userStore.users" :key="user.id" :user="user" @click="handleUserClick(user)" />
      </div>

      <Modal :is-open="isModalOpen" :user="selectedUser" @close="handleModalClose" />
    </div>
  </main>
</template>

<style scoped>
.home {
  min-height: 100vh;
  background: #f5f5f5;
  padding: 40px 20px;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
}

.title {
  text-align: center;
  color: #333;
  margin-bottom: 40px;
  font-size: 32px;
}

.loading,
.error {
  text-align: center;
  padding: 20px;
  color: #666;
}

.error {
  color: #f44336;
}

.users-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
  margin-top: 40px;
}
</style>
