<template>
  <section class="hero">
    <div class="hero__content">
      <h2 class="hero__title">Accelerator</h2>
      <p class="hero__subtitle">
        We help you with the boring parts, so you can grow faster
      </p>
      <div class="hero__action" role="button" tabindex="0">
        <span class="hero__actionText">Join</span>
      </div>
    </div>
    <div class="hero__image" id="hero__image"></div>
    <div class="hero__mask"></div>
  </section>
</template>
<script setup lang="ts"></script>
<style scoped>
.hero {
  color: white;
  margin: 0;
  width: 100%;
  height: 100vh;
  display: flex;
  overflow: hidden;
  justify-content: center;
}
.hero__content {
  margin: 40vh auto auto 10vw;
  width: 50%;
}
.hero__title {
  font-size: 3em;
  font-weight: 900;
  margin: 0;
  line-height: 1em;
  text-shadow: 0 0 1rem black;
}
.hero__subtitle {
  opacity: 0.85;
  margin-top: 0.5em;
  text-shadow: 0 0 8px black;
  font-size: 1.5em;
}
.hero__action {
  height: 2em;
  border-radius: 2em;
  background: #c49000;
  color: white;
  border: none;
  padding: 0.4em 2em;
  box-shadow: 0 0 8px black;
  position: relative;
  width: 7em;
  cursor: pointer;
}

.hero__action:hover {
  animation: callToAction 1500ms ease-in infinite;
}

.hero__actionText {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 2;
  font-family: 'Heebo', sans-serif;
  font-size: 1.1em;
  transform: translate(-50%, -50%);
  text-shadow: 0px 0px 6px rgba(255, 255, 255, 0.2);
}

.hero__image {
  display: inline-block;
  position: absolute;
  z-index: -10;
  height: 100vh;
  width: 100%;
  background-color: red;
  background-image: url('/img/pexels-pixabay-257636.jpg');
  background-position: center;
  background-size: cover;
}

.hero__mask {
  position: absolute;
  z-index: -8;
  height: 100%;
  width: 100%;
  background-image: linear-gradient(#180047, #060231 50%);
  mix-blend-mode: multiply;
  opacity: 0.5;
}

.hero__snowfall {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: -6;
  opacity: 0.75;
}

@media (max-height: 500px) {
  .hero__title {
    font-size: 2em;
  }

  .hero__subtitle {
    font-size: 1em;
  }

  .hero__action {
    height: 1.4em;
    border-radius: 1.4em;
    width: 4.5em;
  }

  .hero__actionText {
    font-size: 0.9em;
  }
}
@media (max-width: 700px) {
  .hero__content {
    width: 90%;
    margin: 40vh 2em auto 2em;
  }
}

@keyframes callToAction {
  0% {
    transform: scale(1);
  }
  40% {
    transform: scale(1.07);
  }
  50% {
    transform: scale(1.04);
  }
  60% {
    transform: scale(1.07);
  }

  100% {
    transform: scale(1);
  }
}
</style>
