<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --bg: #0f172a;
    --primary: #ffffff;
    --accent: #38bdf8;
    --card: rgba(255,255,255,0.08);
    --border: rgba(255,255,255,0.1);
}

body {
    margin:0;
    font-family: Inter;
    background: linear-gradient(135deg,#0f172a,#020617);
    color:white;
}

.container {
    max-width:1200px;
    margin:auto;
    padding:20px;
}

/* HEADER */
header {
    position:sticky;
    top:0;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(10px);
    border-bottom:1px solid var(--border);
}

.header-inner {
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.brand {
    font-size:22px;
    font-weight:700;
}

.brand span {
    color:var(--accent);
}

.search {
    display:flex;
    background:rgba(255,255,255,0.08);
    padding:8px 12px;
    border-radius:50px;
}

.search input {
    background:none;
    border:none;
    outline:none;
    color:white;
}

/* HERO */
.hero {
    text-align:center;
    padding:80px 20px;
    margin:20px;
    border-radius:20px;
    background:linear-gradient(135deg,rgba(56,189,248,0.3),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover;
}

.hero h1 {
    font-size:48px;
}

/* BUTTON */
.btn {
    padding:10px 20px;
    border:none;
    border-radius:50px;
    cursor:pointer;
}

.btn-primary {
    background:linear-gradient(135deg,#38bdf8,#0ea5e9);
}

/* GRID */
.grid {
    display:grid;
    gap:20px;
}

/* CATEGORY */
.categories {
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
}

.cat-card {
    padding:20px;
    text-align:center;
    background:var(--card);
    border:1px solid var(--border);
    border-radius:12px;
}

/* PRODUCTS */
.products {
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
}

.product {
    background:var(--card);
    border:1px solid var(--border);
    border-radius:12px;
    overflow:hidden;
}

.product img {
    width:100%;
    height:200px;
    object-fit:cover;
}

.product-body {
    padding:10px;
}

.price {
    color:var(--accent);
    font-weight:bold;
}

.add-btn {
    width:100%;
    padding:10px;
    background:#22c55e;
    border:none;
    cursor:pointer;
}

/* FOOTER */
footer {
    text-align:center;
    padding:20px;
    color:#94a3b8;
}
</style>
</head>

<body>

<header>
<div class="container header-inner">
<div class="brand">Nexus<span>Shop</span></div>

<div class="search">
<input type="text" id="searchInput" placeholder="Search...">
<button onclick="searchProducts()"><i class="fas fa-search"></i></button>
</div>

<div>
<i class="fas fa-shopping-cart"></i> <span id="cartCount">0</span>
</div>
</div>
</header>

<section class="hero">
<h1>Premium Shopping Experience</h1>
<p>Modern UI E-Commerce Demo</p>
<button class="btn btn-primary" onclick="scrollToProducts()">Shop Now</button>
</section>

<div class="container">

<h2>Categories</h2>
<div class="grid categories" id="categories"></div>

<h2 id="productsSection">Products</h2>
<div class="grid products" id="products"></div>

</div>

<footer>
© 2026 NexusShop
</footer>

<script>
const categories = ["Phones","Laptops","Clothing","Gadgets"];

const products = [
{id:1,name:"iPhone 14",price:999,cat:"Phones",img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb"},
{id:2,name:"MacBook",price:1999,cat:"Laptops",img:"https://images.unsplash.com/photo-1593642632823"},
{id:3,name:"Headphones",price:199,cat:"Gadgets",img:"https://images.unsplash.com/photo-1518441902110"},
{id:4,name:"Shoes",price:120,cat:"Clothing",img:"https://images.unsplash.com/photo-1542291026"}
];

let cart=0;

function renderCategories(){
const el=document.getElementById("categories");
categories.forEach(c=>{
el.innerHTML+=`<div class="cat-card">${c}</div>`;
});
}

function renderProducts(list){
const el=document.getElementById("products");
el.innerHTML="";
list.forEach(p=>{
el.innerHTML+=`
<div class="product">
<img src="${p.img}">
<div class="product-body">
<h4>${p.name}</h4>
<div class="price">$${p.price}</div>
<button class="add-btn" onclick="addToCart()">Add to Cart</button>
</div>
</div>`;
});
}

function addToCart(){
cart++;
document.getElementById("cartCount").innerText=cart;
}

function searchProducts(){
const q=document.getElementById("searchInput").value.toLowerCase();
const filtered=products.filter(p=>p.name.toLowerCase().includes(q));
renderProducts(filtered);
}

function scrollToProducts(){
document.getElementById("productsSection").scrollIntoView({behavior:"smooth"});
}

renderCategories();
renderProducts(products);
</script>

</body>
</html>
