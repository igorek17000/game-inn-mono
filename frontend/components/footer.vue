<template>
  <div>
    <!--===========FOOTER=========-->
    <footer class="footer">
      <div class="container">
        <div class="footer-content footer-content--desk">
          <div class="footer-left">
            <p>GAME-HOTEL.IO. All rights reserved.</p>
          </div>
          <div class="footer-logo">
            <svg width="42" height="24">
              <use xlink:href="~~/assets/img/svg-sprite.svg#footer-logo"></use>
            </svg>
          </div>
          <div class="footer-rignt">
            <p>Copyright&copy; 2021</p>
          </div>
        </div>
        <div class="footer-content footer-content--mob">
          <div class="footer-left">
            <p>GAME-HOTEL.IO</p>
            <p>All rights reserved © 2021</p>
          </div>
          <div class="footer-rignt">
            <div class="contact-icons">
              <a class="contact-icons__item" href="">
                <svg class="twit-svg">
                  <use xlink:href="~~/assets/img/svg-sprite.svg#twitIcon"></use>
                </svg>
              </a>
              <a class="contact-icons__item" href="">
                <svg class="fb-svg">
                  <use xlink:href="~~/assets/img/svg-sprite.svg#fbIcon"></use>
                </svg>
              </a>
              <a class="contact-icons__item" href="">
                <svg class="tg-svg">
                  <use xlink:href="~~/assets/img/svg-sprite.svg#tgIcon"></use>
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <a class="backTop" href="#top" id="backTop">Up</a>
  </div>
</template>

<script>
export default {
  name: "Footer"
}
</script>

<style scoped>

</style>
