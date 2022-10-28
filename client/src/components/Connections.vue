<template>
  <h1>URL JUMPER</h1>
  <input type="text" v-model="input" placeholder="Search your link..." />
  <div class="item fruit" v-for="(conn,index) in items" :key="index">
    <p>{{ conn.short_link }} = {{ conn.long_link }}</p>
  </div>
  <div class="item error" v-if="input&&!filteredList().length">
      <p>No results found!</p>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "Connections",
  data() {
    return {
      input:'',
      items: [],
    };
  },
  async created() {
    try {
      const res = await axios.get('http://127.0.0.1:8000/redirector/connections/');
      this.items = res.data;
    } catch (error) {
      console.log(error);
    }
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Montserrat&display=swap");

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: "Montserrat", sans-serif;
}

body {
  padding: 20px;
  min-height: 100vh;
  background-color: rgb(234, 242, 255);
}

input {
  display: block;
  width: 350px;
  margin: 20px auto;
  padding: 10px 45px;
  background: white no-repeat 15px center;
  background-size: 15px 15px;
  font-size: 16px;
  border: none;
  border-radius: 5px;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px,
    rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
}

.item {
  width: 350px;
  margin: 0 auto 10px auto;
  padding: 10px 20px;
  color: white;
  border-radius: 5px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 3px 0px,
    rgba(0, 0, 0, 0.06) 0px 1px 2px 0px;
}

.fruit {
  background-color: rgb(97, 62, 252);
  cursor: pointer;
}

.error {
  background-color: tomato;
}
</style>