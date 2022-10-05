import Swiper from 'swiper';

const sliders = document.querySelectorAll('.swiper')

sliders.forEach(slider => {
    let swiperSelector = '.' + slider.getAttribute('data-slide')
    const swiper = new Swiper(swiperSelector, {
        loop: true,
        slidesPerView: 1,
        // spaceBetween: 10,
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 1,
                spaceBetween: 0
            },
            // when window width is >= 480px
            600: {
                slidesPerView: 2,
                spaceBetween: 30
            },
            // when window width is >= 640px
            960: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1300: {
                slidesPerView: 4,
                spaceBetween: 30
            },
        }
    })
})