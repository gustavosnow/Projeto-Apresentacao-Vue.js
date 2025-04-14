<template>
  <div class="theme-toggle-container">
    <button class="theme-toggle-button animate-nav-button" @click="toggleDark()" :aria-pressed="isDark"
      aria-label="Alternar tema">
      <transition name="icon-fade" mode="out-in">
        <span class="theme-icon" :key="isDark ? 'dark' : 'light'">
          <svg v-if="isDark" viewBox="0 0 24 24" width="24" height="24">
            <path fill="currentColor"
              d="M12.1,22c-0.3,0-0.6,0-0.9,0c-5.5-0.5-9.5-5.4-9-10.9c0.4-4.8,4.2-8.6,9-9c0.4,0,0.8,0.2,1,0.5c0.2,0.3,0.2,0.8-0.1,1.1c-2,2.7-1.4,6.4,1.3,8.4c2.1,1.6,5.1,1.6,7.2,0c0.3-0.2,0.7-0.3,1.1-0.1c0.3,0.2,0.5,0.6,0.5,1c-0.2,2.7-1.5,5.1-3.6,6.8C16.6,21.2,14.4,22,12.1,22zM9.3,4.4c-2.9,1-5,3.6-5.4,6.8c-0.4,4.4,2.8,8.3,7.2,8.7c2.1,0.2,4.2-0.4,5.8-1.8c1.1-0.9,1.9-2.1,2.4-3.4c-2.5,0.9-5.3,0.5-7.5-1.1C9.2,11.4,8.1,7.7,9.3,4.4z" />
          </svg>
          <svg v-else viewBox="0 0 24 24" width="24" height="24">
            <path fill="currentColor"
              d="M12,18c-3.3,0-6-2.7-6-6s2.7-6,6-6s6,2.7,6,6S15.3,18,12,18zM12,8c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S14.2,8,12,8z" />
            <path fill="currentColor" d="M12,4c-0.6,0-1-0.4-1-1V1c0-0.6,0.4-1,1-1s1,0.4,1,1v2C13,3.6,12.6,4,12,4z" />
            <path fill="currentColor"
              d="M12,24c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1s1,0.4,1,1v2C13,23.6,12.6,24,12,24z" />
            <path fill="currentColor"
              d="M4.9,6.3c-0.2,0-0.5-0.1-0.7-0.3L2.3,4.1c-0.4-0.4-0.4-1,0-1.4s1-0.4,1.4,0l1.9,1.9c0.4,0.4,0.4,1,0,1.4C5.4,6.2,5.2,6.3,4.9,6.3z" />
            <path fill="currentColor"
              d="M21.7,19.9l-1.9-1.9c-0.4-0.4-0.4-1,0-1.4s1-0.4,1.4,0l1.9,1.9c0.4,0.4,0.4,1,0,1.4S22.1,19.9,21.7,19.9z" />
            <path fill="currentColor"
              d="M2.3,19.9c-0.4-0.4-0.4-1,0-1.4l1.9-1.9c0.4-0.4,1-0.4,1.4,0s0.4,1,0,1.4l-1.9,1.9C3.8,19.9,3.1,19.9,2.3,19.9z" />
            <path fill="currentColor"
              d="M19.1,6.3c-0.2,0-0.5-0.1-0.7-0.3c-0.4-0.4-0.4-1,0-1.4l1.9-1.9c0.4-0.4,1-0.4,1.4,0s0.4,1,0,1.4l-1.9,1.9C19.6,6.2,19.4,6.3,19.1,6.3z" />
          </svg>
        </span>
      </transition>
    </button>
  </div>
</template>

<script setup>
import { useDark, useToggle } from '@vueuse/core'

const isDark = useDark({
  selector: 'body',
  attribute: 'data-theme',
  valueDark: 'dark',
  valueLight: 'light',
})

const toggleDark = useToggle(isDark)
</script>

<style>
.theme-toggle-container {
  position: fixed;
  top: 20px;
  right: 20px;
  z-index: 1000;
}

.theme-toggle-button {
  width: 60px;
  height: 60px;
  background: #2a2a2a;
  border: none;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  padding: 0;
}

.theme-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 24px;
  height: 24px;
  color: #42b883;
}

.theme-toggle-button:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 6px 14px rgba(0, 0, 0, 0.5);
  background: #353535;
}

.theme-toggle-button:hover:not(:disabled) .theme-icon {
  color: #5dd39e;
}

.theme-toggle-button:active:not(:disabled) {
  transform: translateY(1px);
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
}

.theme-toggle-button:focus {
  outline: 2px solid #42b883;
  outline-offset: 2px;
}

/* Animação idêntica aos botões de navegação */
.animate-nav-button {
  opacity: 0;
  animation: fadeSlideUp 0.6s ease forwards;
  animation-delay: 1.4s;
}

/* Transição suave entre ícones */
.icon-fade-enter-active,
.icon-fade-leave-active {
  transition: all 0.3s ease;
}

.icon-fade-enter-from,
.icon-fade-leave-to {
  opacity: 0;
  transform: scale(0.8);
}

/* Mantendo os estilos originais do tema no body */
body[data-theme='dark'] {
  background-image: linear-gradient(320deg, rgb(0, 86, 0), darkgreen, rgb(37, 37, 37), black);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 200% 200%;
  animation: gradientShift 15s ease infinite;
  color: white;
}

body[data-theme='light'] {
  background-image: linear-gradient(320deg, rgb(1, 1, 68), Darkblue, Blue, gray, white);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 200% 200%;
  animation: gradientShift 15s ease infinite;
  color: white;
  .slide {
    background-color: #cee7f7;
    padding: 24px;
    border-radius: 12px;
    margin-bottom: 16px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    transition: all 0.3s ease;
    color: #151515;
  
    p{
      color: #151515;
    }
    h2{
      color: rgb(2, 99, 52);
    }
  }
  .header{
      background-color: #cee7f7;
      p{
        color: #151515;
      }
      h1{
        color: rgb(2, 99, 52);
      }
  }
  .text-block {
    background-color: #cee7f7;
}
}

@keyframes gradientShift {
  0% {
    background-position: 0% 50%;
  }

  50% {
    background-position: 100% 50%;
  }

  100% {
    background-position: 0% 50%;
  }
}
</style>