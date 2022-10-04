import Swiper from 'swiper';

const sliders = document.querySelectorAll('.swiper')

sliders.forEach(slider => {
    let swiperSelector = '.' + slider.getAttribute('data-slide')
    const swiper = new Swiper(swiperSelector, {
        loop: true,
        slidesPerView: 4,
        spaceBetween: 10,
    })
})