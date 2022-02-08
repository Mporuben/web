<script setup>
import HelloWorld from './components/HelloWorld.vue'
import TheWelcome from './components/TheWelcome.vue'
</script>

<template>
  <div>
    <h1>Products</h1>
    <div class="item" v-for="product of products" :key="product.name">
      <h3>{{product.name}}</h3>
      <div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
        <span>{{product.price}} €</span>
        <br/>
        <button class="buyButton">buy</button>
      </div>
    </div>
  </div>
</template>

<script>
import {defineComponent, ref} from 'vue'

import axios from 'axios'

export default defineComponent({

  data() {return {
    products: []
  }},

  mounted() {
    this.fetchProducts()
  },

  methods: {
    async fetchProducts() {
      try {
        const resp = await axios.get('http://localhost:3000');
        this.products = resp.data
      } catch (err) {
        console.error(err)
      }
    }
  }

})
</script>

<style>
@import './assets/base.css';

#app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  font-weight: normal;
  display: flex;
  align-items: center;
  justify-content: center;
}

header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

a,
.green {
  text-decoration: none;
  color: hsla(160, 100%, 37%, 1);
  transition: 0.4s;
}

.item {
  width: 500px;
  background: #333333;
  border-radius: 10px;
  display: flex;
  justify-content: space-between;
  padding: 50px;
  align-items: center;
  margin: 10px
}
.buyButton {
  background: lime;
  color: black;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-weight: bold;
}
</style>
