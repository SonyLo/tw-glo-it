<script setup>
defineProps({
	user: {
		type: Object,
		required: true
	}
})

const emit = defineEmits(['click'])

const handleClick = () => {
	emit('click')
}
</script>

<template>
	<div class="user-card" @click="handleClick">
		<h3 class="user-card__name">{{ user.name }}</h3>
		<div class="user-card__contacts">
			<div class="user-card__contact">

				<svg width="14" height="24" viewBox="0 0 14 24" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" clip-rule="evenodd"
						d="M12 1H2C1.44775 1 1 1.44922 1 2V2.5H13V2C13 1.70312 12.8701 1.4375 12.6641 1.25391C12.4873 1.09375 12.2549 1 12 1ZM0 2.5V3.5V18.5V19.5V22C0 23.1055 0.895508 24 2 24H12C12.6602 24 13.2456 23.6797 13.6099 23.1875C13.855 22.8555 14 22.4453 14 22V19.5V18.5V3.5V3V2C14 0.894531 13.1045 0 12 0H2C1.5498 0 1.13428 0.148438 0.799805 0.398438C0.313965 0.761719 0 1.34375 0 2V2.5ZM1 3.5V18.5H13V3.5H1ZM1 22V19.5H13V22C13 22.5508 12.5522 23 12 23H2C1.69092 23 1.41455 22.8594 1.23145 22.6367C1.08691 22.4648 1 22.2422 1 22ZM8 21C8 21.5508 7.55225 22 7 22C6.44775 22 6 21.5508 6 21C6 20.4492 6.44775 20 7 20C7.55225 20 8 20.4492 8 21Z"
						fill="#432EAB" />
				</svg>



				<span class="user-card__text">{{ user.phone }}</span>
			</div>
			<div class="user-card__contact">
				<svg width="24" height="14" viewBox="0 0 24 14" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" clip-rule="evenodd"
						d="M23 2V12C23 12.5523 22.5523 13 22 13L2 13C1.44772 13 0.999999 12.5523 0.999999 12L1 2C1 1.89068 1.01754 1.78546 1.04996 1.687L10.4171 9.35103C11.338 10.1045 12.6624 10.1045 13.5833 9.35103L22.9501 1.68727C22.9825 1.78565 23 1.89078 23 2ZM22.1891 1.01786L12.9501 8.57707C12.3975 9.02916 11.6029 9.02916 11.0504 8.57707L1.81123 1.01779C1.87236 1.00611 1.93547 0.999999 2 0.999999L22 1C22.0647 1 22.1279 1.00614 22.1891 1.01786ZM22 0C23.1046 0 24 0.895431 24 2V12C24 13.1046 23.1046 14 22 14L2 14C0.895429 14 0 13.1046 0 12V2C0 0.895429 0.895432 0 2 0H22Z"
						fill="#432EAB" />
				</svg>
				<span class="user-card__text">{{ user.email }}</span>
			</div>
		</div>
	</div>
</template>

<style scoped>
.user-card {
	height: 314px;
	background: #FFFFFF;
	border-radius: 16px;
	padding: 24px;
	cursor: pointer;
	transition: transform 0.2s ease, box-shadow 0.2s ease;
	box-shadow: 0px 8px 24px rgba(0, 0, 0, 0.04);
}

.user-card:hover {
	transform: translateY(-2px);
	box-shadow: 0px 12px 32px rgba(0, 0, 0, 0.08);
}

.user-card__name {
	margin: 0 0 24px;
	font-family: 'Inter', sans-serif;
	font-weight: 700;
	font-size: 24px;
	line-height: 30px;
	letter-spacing: 0;
	color: #262C40;
	text-align: left;
}

.user-card__contacts {
	display: flex;
	flex-direction: column;
	gap: 16px;
}

.user-card__contact {
	display: flex;
	align-items: center;
}

.user-card__contact svg {
	margin-right: 12px;
}

.user-card__contact:first-child svg {
	margin-left: 5px;
	margin-right: 17px;
}

.user-card__text {
	font-family: 'Inter', sans-serif;
	font-weight: 400;
	font-size: 14px;
	line-height: 20px;
	letter-spacing: 0;
	color: #8189A3;
	vertical-align: middle;
}
</style>