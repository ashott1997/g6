import 'swiper/css';
import './prodSlider.js'

// burger menu

const openBurger = document.querySelector('.burger')
const burgerMenu = document.querySelector('.burger-menu')
const html = document.querySelector('body')
openBurger.addEventListener('click', () => {
    burgerMenu.classList.add('active-burger-menu')
    html.style.overflowY = 'hidden'
})

const closeBurger = document.querySelector('.burger-menu .close svg')
closeBurger.addEventListener('click', () =>  {
    burgerMenu.classList.remove('active-burger-menu')
    html.style.overflowY = 'unset'
})

const headerNav = document.querySelector('#header')
const homeBanner = document.querySelector('#home_banner')

const showScrollTop = () =>{
    let distanceToTop =  homeBanner.getBoundingClientRect().top
    if ( distanceToTop < -600 ){
        headerNav.classList.add('header-fixed')
    }
    console.log(distanceToTop)
    if(distanceToTop > -600){
        headerNav.classList.remove('header-fixed')
    }
}

html.addEventListener('scroll', showScrollTop)