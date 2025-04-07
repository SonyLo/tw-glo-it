<script setup>
defineProps({
	isOpen: {
		type: Boolean,
		required: true
	},
	user: {
		type: Object,
		default: () => ({})
	}
})

const emit = defineEmits(['close'])

const handleClose = () => {
	emit('close')
}
</script>

<template>
	<Teleport to="body">
		<div v-if="isOpen" class="modal-overlay" @click="handleClose">
			<div class="modal-content" @click.stop>
				<button class="modal-close" @click="handleClose">
					<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path
							d="M15.8334 5.34166L14.6584 4.16666L10 8.82499L5.34169 4.16666L4.16669 5.34166L8.82502 9.99999L4.16669 14.6583L5.34169 15.8333L10 11.175L14.6584 15.8333L15.8334 14.6583L11.175 9.99999L15.8334 5.34166Z"
							fill="#262C40" />
					</svg>
				</button>
				<h2 class="modal-title">{{ user.name }}</h2>
				<div class="modal-info">
					<div class="modal-info-row">
						<span class="modal-label">Телефон:</span>
						<span class="modal-value">{{ user.phone }}</span>
					</div>
					<div class="modal-info-row">
						<span class="modal-label">Почта:</span>
						<span class="modal-value">{{ user.email }}</span>
					</div>
					<div class="modal-info-row">
						<span class="modal-label">Дата приема:</span>
						<span class="modal-value">{{ user.hire_date }}</span>
					</div>
					<div class="modal-info-row">
						<span class="modal-label">Должность:</span>
						<span class="modal-value">{{ user.position_name }}</span>
					</div>
					<div class="modal-info-row">
						<span class="modal-label">Подразделение:</span>
						<span class="modal-value">{{ user.department }}</span>
					</div>
				</div>
				<div class="modal-additional">
					<div class="modal-additional-title">Дополнительная информация:</div>
					<p class="modal-additional-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Beatae
						esse quas asperiores placeat velit unde repudiandae explicabo, vero laborum atque est et
						provident voluptatum? Odio rerum laborum incidunt iste voluptatibus.</p>
				</div>
			</div>
		</div>
	</Teleport>
</template>

<style scoped>
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1000;
}

.modal-content {
	background: white;
	border-radius: 16px;
	padding: 24px;
	width: 500px;
	position: relative;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.08);
}

.modal-close {
	position: absolute;
	top: 24px;
	right: 24px;
	background: none;
	border: none;
	cursor: pointer;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-title {
	font-size: 24px;
	line-height: 30px;
	color: #262C40;
	margin: 0 0 24px;
	font-weight: 700;
}

.modal-info {
	display: flex;
	flex-direction: column;
	gap: 12px;
	margin-bottom: 24px;
}

.modal-info-row {
	display: flex;
	align-items: flex-start;
}

.modal-label {
	width: 140px;
	color: #262C40;
	font-size: 14px;
	line-height: 20px;
}

.modal-value {
	flex: 1;
	color: #8189A3;
	font-size: 14px;
	line-height: 20px;
}

.modal-additional-title {
	color: #262C40;
	font-size: 14px;
	line-height: 20px;
	margin-bottom: 8px;
}

.modal-additional-text {
	color: #8189A3;
	font-size: 14px;
	line-height: 20px;
	margin: 0;
}
</style>