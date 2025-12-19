<div class="footer">
    {* <div class="call-desktop"><img src="/images/icons/call.svg" alt="call"  width="30" height="30"><span style="margin-left: 15px; font-size: 30px">{$rsSettings['0']['value']}</span></div>
    <a class="call-mobile" href="tel:{$rsSettings['0']['value']}">
        <img src="/images/icons/call.svg" alt="call"  width="30" height="30"><span style="margin-left: 15px; font-size: 30px">CALL US</span>
    </a> *}
    <div class="follow_us">
        <p>FOLLOW US</p>
        <div class="follow_links">
            <a href="{$rsSettings['1']['value']}">
                <img src="/images/icons/facebook.svg" alt="facebook"  width="50" height="50">
            </a>
            <a href="{$rsSettings['2']['value']}">
                <img src="/images/icons/instagram.svg" alt="instagram"  width="50" height="50">
            </a>

        </div>
    </div>
    <div class="copyright">
        <p>©</p>&nbsp<p id="year"></p>&nbsp<p>NXFAB®</p>
    </div>
    <script type="text/javascript">
        let el = document.getElementById("year");
        let year = new Date().getFullYear();
        el.innerText = " " + year + " ";

        const itemsToShow = 6;
        let visibleCount = itemsToShow;

        const cards = Array.from(document.querySelectorAll('.product_card'));
        const btn = document.getElementById('load_more');

        function updateView() {
            cards.forEach((card, index) => {
                card.style.display = index < visibleCount ? 'flex' : 'none';
            });

            if (visibleCount >= cards.length) {
                btn.style.display = 'none';
            }
        }

        btn.addEventListener('click', () => {
            console.log("load more pressed")
            visibleCount += itemsToShow;
            updateView();
        });

        updateView();
    </script>
</div>
{*<a id="up" href="#up_anchor">UP</a>*}
<div id="up">UP</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const btn = document.getElementById('up');

        window.addEventListener('scroll', function () {
            if (window.scrollY > 300) { // появится после 300px
                btn.classList.add('show');
            } else {
                btn.classList.remove('show');
            }
        });

        btn.addEventListener('click', function () {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    });
</script>
</body>
</html>