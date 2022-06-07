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
              <use xlink:href="../assets/img/svg-sprite.svg#footer-logo"></use>
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
                  <use xlink:href="../assets/img/svg-sprite.svg#twitIcon"></use>
                </svg>
              </a>
              <a class="contact-icons__item" href="">
                <svg class="fb-svg">
                  <use xlink:href="../assets/img/svg-sprite.svg#fbIcon"></use>
                </svg>
              </a>
              <a class="contact-icons__item" href="">
                <svg class="tg-svg">
                  <use xlink:href="../assets/img/svg-sprite.svg#tgIcon"></use>
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!--================= АВТОРИЗАЦИЯ ШАГ 1/2=====================-->
    <div class="page-modal mm-modal" data-modal="mm-wallet">
      <div class="page-modal__header">
        <h3 class="text-16">Подключите свой Metamask</h3>
        <button class="close-btn" data-close="data-close"></button>
      </div>
      <div class="page-modal__body">
        <div class="page-modal__img">
          <svg width="112" height="112">
            <use xlink:href="../assets/img/svg-sprite.svg#metam2Icon"></use>
          </svg>
        </div>
        <a class="button button--color button--flex" href="#!">
          <span>Купить $Hotel Button</span>
          <svg width="16" height="16">
            <use xlink:href="../assets/img/svg-sprite.svg#arrRight"></use>
          </svg>
        </a>
      </div>
      <div class="page-modal__footer">
        <p class="text-13">Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.</p>
      </div>
    </div>
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
