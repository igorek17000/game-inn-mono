<template>
  <div>
    <div class="contact-icons  contact-icons--vertical">
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
    <div id="overlay"></div>
    <!--=====MOBILE FIX BOTTOM MENU ========-->
    <div class="fix-mobile-menu">
      <div class="fix-menu-toggle active" id="open-fixMenu">Меню раздела</div>
      <div class="fix-menu-toggle" id="close-fixMenu"></div>
      <div class="fix-menu-list">
        <ul>
          <li>
            <a href="#!">Задачи</a>
          </li>
          <li>
            <a href="#!">Аккаунты</a>
          </li>
          <li>
            <a href="#!">Календарь</a>
          </li>
          <li>
            <a href="#!">Обучение</a>
          </li>
        </ul>
      </div>
    </div>
    <!--=====BLUE LEFT SIDEBAR ========-->
    <div class="aside-panel">
      <nuxt-link class="logo" to="/invest">
        <svg class="logo-svg" width="37" height="48">
          <use xlink:href="../assets/img/svg-sprite.svg#asideLogo"></use>
        </svg>
      </nuxt-link>
      <div class="aside-panel__menu"
        v-gsap.from="{
        opacity: 0,
        y: '100%',
        duration: 1.5,
      }">
        <button>
        <span>
          <div class="label">
            <span>1</span>
          </div>
          <svg class="play-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu1"></use>
          </svg>
        </span>
          <span>Игры</span>
        </button>
        <button>
        <span>
          <svg class="job-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu2"></use>
          </svg>
        </span>
          <span>Работа</span>
        </button>
        <button>
        <span>
          <div class="label">
            <span>1</span>
          </div>
          <svg class="pull-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu3"></use>
          </svg>
        </span>
          <span>Добыча</span>
        </button>
        <button>
        <span>
          <svg class="ntf-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu4"></use>
          </svg>
        </span>
          <span>NFT</span>
        </button>
        <button>
        <span>
          <svg class="market-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu5"></use>
          </svg>
        </span>
          <span>Маркет</span>
        </button>
        <button class="news-menu-item">
        <span>
          <svg class="news-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu6"></use>
          </svg>
        </span>
          <span>Новости</span>
        </button>
        <button class="news-menu-item">
        <span>
          <svg class="news-svg">
            <use xlink:href="~~/assets/img/svg-sprite.svg#menu6"></use>
          </svg>
        </span>
          <span>Помощь</span>
        </button>
        <!--=========кнопка Работа(с иконкой меч), Добыча и Курсы-->
        <!-- //=====Работа===-->
        <!-- button-->
        <!-- 	span-->
        <!-- 		svg.job2-svg-->
        <!-- 			use(xlink:href="~~/assets/img/svg-sprite.svg#iconBatl")-->
        <!-- 	span Работа-->
        <!-- //=====Добыча===-->
        <!-- button-->
        <!-- 	span-->
        <!-- 		svg.resourse-svg-->
        <!-- 			use(xlink:href="~~/assets/img/svg-sprite.svg#iconResourse")-->
        <!-- 	span Добыча-->
        <!-- //=====Курсы===-->
        <!-- button-->
        <!-- 	span-->
        <!-- 		svg.edu-svg-->
        <!-- 			use(xlink:href="~~/assets/img/svg-sprite.svg#iconEdu")-->
        <!-- 	span Курсы-->
      </div>
    </div>
    <!--===========DESKTOP HEADER========-->
    <header class="header header--desk"
      v-gsap.from="{
      opacity: 0,
      y: -100,
      duration: 1.5,
    }">
      <div class="header-content d-flex">
        <div class="header-left">
          <div class="mobile-logo">
            <a href="#!">
              <svg width="42" height="24">
                <use xlink:href="~~/assets/img/svg-sprite.svg#footer-logo"></use>
              </svg>
            </a>
          </div>
          <div class="custom-select custom-select--lang">
            <div class="select-icon"></div>
            <div class="select-field">
              <input type="text" value="Ru" readonly="readonly" />
            </div>
            <div class="select-list">
              <ul>
                <li class="current" data-role="Ru">Ru</li>
                <li data-role="En">En</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="header-center">
          <div class="header-menu">
            <ul>
              <li class="active">
                <a href="#!">Купить GINN</a>
              </li>
              <li>
                <nuxt-link to="/farm">Farming</nuxt-link>
              </li>
              <li>
                <a href="#">Launchpad</a>
              </li>
              <li>
                <a href="#">История операций</a>
              </li>
            </ul>
          </div>
        </div>
        <!--====LOGIN=====-->
        <div class="header-right">
          <div class="profile-panel">
            <div class="profile-icon">
              <div class="icon-notify">
                <p class="label">
                  <span>2</span>
                </p>
              </div>
            </div>
            <div class="header-icon">
              <div class="icon-diamond"></div>
              <p>15 500</p>
            </div>
            <div class="header-icon">
              <div class="coin-icon"></div>
              <p>2 500</p>
            </div>
            <div class="profile-persone">
              <div class="profile-persone__img">
                <img src="~~/assets/img/ava.png" width="38" alt="ava" />
              </div>
              <div class="profile-persone__arrow" id="profile-arrow">
                <svg width="10" height="6">
                  <use xlink:href="~~/assets/img/svg-sprite.svg#iconArr"></use>
                </svg>
              </div>
              <div class="profile-persone__row">
                <p>0x...263a</p>
              </div>
            </div>
            <div class="header-icon header-icon--plus">
              <div class="plus-icon2"></div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!--===========MOBILE HEADER========-->
    <header class="header header--mob">
      <div class="header-content d-flex">
        <div class="header-left">
          <div class="page-frame__header-text">
            <nuxt-link to="/" class="close-frame"></nuxt-link>
            <nuxt-link to="/farm" class="close-frame">
              <div class="text-24">Фарминг</div>
            </nuxt-link>
          </div>
        </div>
        <!--====LOGIN=====-->
        <div class="header-right">
          <div class="profile-panel">
            <div class="header-icon">
              <div class="coin-icon"></div>
              <p>2 500</p>
            </div>
            <div class="profile-persone">
              <div class="profile-persone__img">
                <img src="~~/assets/img/ava.png" width="38" alt="ava" />
              </div>
              <div class="profile-persone__arrow" id="profile-arrow">
                <svg width="10" height="6">
                  <use xlink:href="~~/assets/img/svg-sprite.svg#iconArr"></use>
                </svg>
              </div>
              <div class="profile-persone__row">
                <p>0x...263a</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  </div>
</template>

<script>
export default {
  name: "Header",
  // buildModules: ['nuxt-gsap-module'],
  // gsap: {
  //   extraPlugins: {
  //     scrollTo: true,
  //     scrollTrigger: true
  //   },
  // }
}
</script>

<style scoped lang="scss">
.aside-panel {
  background: #fff;
  padding-top: 0;
  overflow: hidden;
  .logo {
    background: center / contain no-repeat url("~~/assets/img/logo-bg.png");
    margin: 0;
    display: flex;
    width: 100%;
    align-items: center;
    justify-content: center;
    padding-top: 10px;
    padding-bottom: 15px;
    position: relative;
  }
  &__menu {
    span {
      color: #3B4E6A;
      z-index: 6;
    }

    svg {
      fill: #9BADCA;
    }
  }
}
</style>
