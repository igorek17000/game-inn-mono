import Vue from 'vue';

Vue.mixin({
  mounted() {
    this.animationFromRight('.animation-from-right');
    this.animationFromLeft('.animation-from-left');
  },
  methods: {
    animationFromRight: function (id) {
      this.$gsap.from(id, {
        x: 500,
        opacity: 0,
        duration: 1.5,
        delay: 0.5,
        scrollTrigger: {
          trigger: id,
          start: "top 80%",
        }
      });
    },
    animationFromLeft: function (id) {
      this.$gsap.from(id, {
        x: -500,
        opacity: 0,
        duration: 1.5,
        scrollTrigger: {
          trigger: id,
          start: "top 80%",
        }
      });
    },
  }
});
