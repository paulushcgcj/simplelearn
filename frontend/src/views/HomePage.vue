<template>
  <AppHero />

  <section class="two-section">
    <div>
      <h1>Who we are</h1>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
        malesuada, nunc non lacinia eleifend, nunc nisi fermentum augue, nec
        ultricies nunc felis nec erat.
      </p>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
        malesuada, nunc non lacinia eleifend, nunc nisi fermentum augue, nec
        ultricies nunc felis nec erat.
      </p>
    </div>

    <hr />

    <div>
      <h1>What we do</h1>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
        malesuada, nunc non lacinia eleifend, nunc nisi fermentum augue, nec
        ultricies nunc felis nec erat.
      </p>
    </div>
  </section>

  <div>companies carrousel</div>

  <section class="three-section">
    <div>
      <h1>Our Mission</h1>
      <p>
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Illo excepturi
        magni explicabo maiores temporibus cum soluta, exercitationem atque
        dolor, harum quasi aliquid quam veniam quos. Non sunt libero illo
        repellat.
      </p>
    </div>

    <hr />

    <div>
      <h1>Our History</h1>
      <p>
        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Provident
        facilis laboriosam sapiente blanditiis sit praesentium, minus voluptate
        ea sunt nesciunt suscipit odit eaque aspernatur recusandae magni aperiam
        hic similique numquam!
      </p>
    </div>
    <hr />
    <div>
      <h1>Our Future</h1>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum in vitae
        esse perferendis minus quisquam reprehenderit at earum impedit dolores,
        eum, suscipit magnam facilis delectus necessitatibus. Nam id pariatur
        debitis?
      </p>
    </div>
  </section>
</template>

<script setup lang="ts">
import AppHero from '@/components/AppHero.vue'
</script>

<style scoped>
section {
  display: flex;
  justify-content: space-around;
  margin: 2em 0;
  padding: 0 2em;
  gap: 2em;
}
section div {
  width: 45%;
}
section hr {
  border-right: 1px dotted var(--supplementary-color);
}
section h1 {
  font-size: 2em;
  margin-bottom: 0.5em;
}
section p {
  margin-bottom: 1em;
  text-align: justify;
}
</style>
