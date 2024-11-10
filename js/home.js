let slideIndex = 0;
        const slides = document.getElementsByClassName("mySlides");
        const dots = document.getElementsByClassName("dot");
        const totalSlides = slides.length;

        function showSlides() {
            const offset = -slideIndex * 100;
            document.querySelector('.w3-content').style.transform = `translateX(${offset}%)`;


            for (let i = 0; i < totalSlides; i++) {
                dots[i].className = dots[i].className.replace(" active", ""); // Xóa lớp active
            }
            dots[slideIndex].className += " active";
        }

        function plusDivs(n) {
            slideIndex += n;

            if (slideIndex < 0) {
                slideIndex = totalSlides - 1;
            } else if (slideIndex >= totalSlides) {
                slideIndex = 0;
            }

            showSlides();
        }

        function currentSlide(n) {
            slideIndex = n;
            showSlides();
        }

        setInterval(() => {
            slideIndex++;
            if (slideIndex >= totalSlides) {
                slideIndex = 0;
            }
            showSlides();
        }, 3000);

        showSlides();