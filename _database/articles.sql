-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2022 at 10:34 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `articles`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Development'),
(2, 'desgin');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment_content`, `user_id`, `timestamp`, `post_id`) VALUES
(1, 'test', 200, '2022-07-27 21:26:59', 7);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) DEFAULT NULL,
  `name` varchar(70) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `posts_id`, `name`, `image`, `thumb`, `size`) VALUES
(190, NULL, '615d6e1073f8f1ef066c81dd_screenshot 1 copy 9-p-800.jpeg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658957064-838.jpeg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658957064-838IMAGE_THUMB_EXT.jpeg', 73414),
(191, NULL, '613c72b701ad817a73c05f8b_screenshot 1 copy 7-p-800.jpeg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658957196-5580.jpeg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658957196-5580IMAGE_THUMB_EXT.jpeg', 105275),
(192, NULL, '6187e9441192450d89e7ed11_screenshot 1 copy 7-p-800.jpeg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658957331-4925.jpeg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658957331-4925IMAGE_THUMB_EXT.jpeg', 178209),
(193, NULL, 'ezgif-2-c68161152c.jpg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658958742-9352.jpg', 'IMAGE_UPLOADS_PATH/2022/07/27/1658958742-9352IMAGE_THUMB_EXT.jpg', 40528);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `header` varchar(180) NOT NULL,
  `content` longtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `header`, `content`, `timestamp`, `user_id`, `file_id`, `category_id`) VALUES
(6, 'Adding the daily DevCard to your GitHub profile', '<h3><strong>In this article, we will cover two different ways of showing your reading interests through your GitHub profile: manually adding your DevCard by copying the code and automatically updating DevCard by leveraging GitHub actions.</strong></h3>\r\n<p>&nbsp;</p>\r\n<p><strong>A while ago, we launched dev cards! A fantastic concept where you can show off how many articles you read, your favorite publications, and show off your rank!</strong></p>\r\n<p><strong>Keen to generate your own dev card?</strong></p>\r\n<p><strong><a href=\"https://app.daily.dev/devcard\" target=\"_blank\" rel=\"noopener\">I want a DevCard</a></strong></p>\r\n<p><strong>However, this article takes your DevCard to the next level by adding it to your GitHub profile!</strong></p>\r\n<p><strong>For instance, like Ole-Martin!</strong></p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>&lt;img src=https://assets.website-files.com/5e0f1144930a8bc8aace526c/615d6b77d3ae56b084566d67_QCgob2z2J.png&gt;</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p><strong>He added this card to his profile. He created a GitHub action to pull the latest card automatically!</strong></p>\r\n<p><strong>And in this article, we&rsquo;ll show you how you can leverage his amazing GitHub action to showcase your DevCard on your GitHub profile as well.</strong></p>\r\n<h2 id=\"creating-a-github-profile-page\">Creating a GitHub profile page</h2>\r\n<p><strong>Perhaps you are still without a GitHub profile and not sure how you can create one yourself.</strong></p>\r\n<p><strong>The process of creating one is not too hard to follow.</strong></p>\r\n<p><strong>Head over to GitHub and create a new public repository.</strong><br /><strong>The name of this repository must be your username.</strong></p>\r\n<p><strong>For instance, my username on GitHub is rebelchris, so the repository must also be called rebelchris.</strong></p>\r\n<p><strong>You&rsquo;ll even be prompted that you found the secret hack to creating a GitHub profile.</strong></p>\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2022-07-27 21:24:24', 200, 190, 1),
(7, 'Building a Banking admin app using Blitzjs', '<p>In this post, we will build a banking admin app using the Blitz.js framework. This tutorial will help us understand the core concepts of the Blitz.js framework and learn how we can apply the concepts to build real-world applications.</p>\r\n<p>The banking admin app will be able to:</p>\r\n<ul role=\"list\">\r\n<li>Create accounts</li>\r\n<li>View transactions in an account</li>\r\n<li>Make credits</li>\r\n<li>Make debits</li>\r\n</ul>\r\n<p>Read on to see how all these can be done in a Blitz.js app.</p>\r\n<h2 id=\"blitzjs\">Blitz.js</h2>\r\n<p><a href=\"https://blitzjs.com/\" target=\"_blank\" rel=\"noopener\">Blitz.js</a> is a full-stack React framework built on Nextjs, it was inspired by Ruby on Rails.</p>\r\n<p>The incredible thing about Blitz is that it comes with the basic stuff we will need when building a web app. Blitz.js generates for you a default client-side implementation that you customize along with backend code to support it.</p>\r\n<p>Blitz.js uses <a href=\"https://www.prisma.io/\" target=\"_blank\" rel=\"noopener\">Prisma</a> ORM client for database connection, object modeling, and migrations.</p>\r\n<p>API endpoints in Blitz.js are written in mutation and query resolvers. These resolvers are functions called from components, they are where data are added or retrieve from the database using the Prisma client.</p>\r\n<p>With Blitz, all we have to do is scaffold the project and we are almost half-done.</p>\r\n<h2 id=\"requirements\">Requirements</h2>\r\n<p>We need to have the following tools installed in our machine:</p>\r\n<ul role=\"list\">\r\n<li><strong>Node.js</strong> - Blitz.js is based on Node.js, so we will need to have Node.js installed in our machine. Go to <a href=\"https://nodejs.org/download\" target=\"_blank\" rel=\"noopener\">https://nodejs.org/download</a> page to download the binary for your machine.</li>\r\n<li><strong>NPM</strong> This is Node packager manager for the Node.js, it comes bundled with Node.js.</li>\r\n<li><strong>Yarn</strong> This is another Node package manager, it is faster than NPM. If you decide to use it, install it by running the command npm i -g yarn.</li>\r\n<li><strong>blitz</strong> This is the Blitz.js CLI tool, we will need it to scaffold Blitz.js projects, generate files and folders, run Blitz.js servers, and lots more. To install the Blitz.js tool run the command yarn add global blitz.</li>\r\n</ul>\r\n<h2 id=\"building-the-bank-admin-app\">Building the bank admin app</h2>\r\n<p>First, we have to scaffold the Blitz.js project. Run the below command to do that:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nblitz <span class=\"hljs-keyword\">new</span> bank-admin\r\n</code></pre>\r\n</div>\r\n<p>The new sub-command tells Blitz that we want to create a new Blitz.js project. The bank-admin is the name of the folder where the project will reside. The Blitz tool will create the folder and create the files and folder of the project inside it.</p>\r\n<p>The above command at some point would request for a Form library to choose, just hit Enter to choose the recommended one.</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nâœ” Pick a form library (you can <span class=\"hljs-keyword\">switch</span> to something <span class=\"hljs-keyword\">else</span> later <span class=\"hljs-keyword\">if</span> you want) &middot; React Final Form\r\n</code></pre>\r\n</div>\r\n<p>After that it will generate the files:</p>\r\n<figure class=\"w-richtext-align-fullwidth w-richtext-figure-type-image\" style=\"max-width: 1022pxpx;\">\r\n<div><img src=\"https://assets.website-files.com/5e0f1144930a8bc8aace526c/60f4269165889ae8f278bd40_1.png\" alt=\"Log of generated files\" /></div>\r\n<figcaption>Log of generated files</figcaption>\r\n</figure>\r\n<figure class=\"w-richtext-align-fullwidth w-richtext-figure-type-image\" style=\"max-width: 1022pxpx;\">\r\n<div><img src=\"https://assets.website-files.com/5e0f1144930a8bc8aace526c/60f426b2fb4c39e01f6b95f2_2.png\" alt=\"Log of generated files\" /></div>\r\n<figcaption>Log of generated files</figcaption>\r\n</figure>\r\n<p>Then it will install the dependencies:</p>\r\n<figure class=\"w-richtext-align-fullwidth w-richtext-figure-type-image\" style=\"max-width: 1022pxpx;\">\r\n<div><img src=\"https://assets.website-files.com/5e0f1144930a8bc8aace526c/60f426d7af4e5d902d06ffa7_3.png\" alt=\"Dependencies installed\" /></div>\r\n<figcaption>Dependencies installed</figcaption>\r\n</figure>\r\n<p>and exit.</p>\r\n<p>Move into the bank-admin folder: cd bank-admin.</p>\r\n<p>We are set. Let\'s look at the routes our app will have.</p>\r\n<p>Our bank admin app will have the below routes:</p>\r\n<p><strong>Routes:</strong></p>\r\n<p>/accounts: List all the accounts in the system. /accounts/:id: View an account. /accounts/new: This page is where new accounts are added to the system.</p>\r\n<p>/transactions: This page is where all transactions carried out are listed. /transactions/:id: This page displays a specific transaction.</p>\r\n<p>/transactions/new: This page is where a transaction is carried out.</p>\r\n<p>Let\'s create the accounts pages:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nblitz g all account\r\n</code></pre>\r\n</div>\r\n<p>This command creates the files:</p>\r\n<ul role=\"list\">\r\n<li>app/pages/accounts/[accountId].tsx</li>\r\n<li>app/pages/accounts/[accountId]/edit.tsx</li>\r\n<li>app/pages/accounts/index.tsx</li>\r\n<li>app/pages/accounts/new.tsx</li>\r\n<li>app/accounts/components/AccountForm.tsx</li>\r\n<li>app/accounts/queries/getAccount.ts</li>\r\n<li>app/accounts/queries/getAccounts.ts</li>\r\n<li>app/accounts/mutations/createAccount.ts</li>\r\n<li>app/accounts/mutations/deleteAccount.ts</li>\r\n<li>app/accounts/mutations/updateAccount.ts</li>\r\n</ul>\r\n<p>The command will create an Account model in the schema.prisma. The command will run migrations on the newly added model and it will prompt for a name for the migration, type added_account and hit Enter.</p>\r\n<figure class=\"w-richtext-align-fullwidth w-richtext-figure-type-image\" style=\"max-width: 1158pxpx;\">\r\n<div><img src=\"https://assets.website-files.com/5e0f1144930a8bc8aace526c/60f4271924496c83df8518b8_4.png\" alt=\"Creating Account model and running migrations\" /></div>\r\n<figcaption>Creating Account model and running migrations</figcaption>\r\n</figure>\r\n<p>Let\'s go through the files:</p>\r\n<ul role=\"list\">\r\n<li>app/pages/accounts/[accountId].tsx: This file will display the details of an account based on its accountId id.</li>\r\n<li>app/pages/accounts/[accountId]/edit.tsx: This file is where we edit an account.</li>\r\n<li>app/pages/accounts/index.tsx: This file is where all accounts in the system are displayed.</li>\r\n<li>app/pages/accounts/new.tsx</li>\r\n<li>app/accounts/components/AccountForm.tsx: We will remove this, we do not need it.</li>\r\n<li>app/accounts/queries/getAccount.ts: This is a query resolver file. This file gets an account from the database.</li>\r\n<li>app/accounts/queries/getAccounts.ts: This file is a query resolver file too, it returns all the accounts from the database.</li>\r\n<li>app/accounts/mutations/createAccount.ts: This file is a mutation resolver, it is where new accounts are created in the database.</li>\r\n<li>app/accounts/mutations/deleteAccount.ts: This is a mutation resolver, it is here that accounts are deleted from the database.</li>\r\n<li>app/accounts/mutations/updateAccount.ts: This is a mutation resolver, it is here accounts are edited in the database.</li>\r\n</ul>\r\n<p>Now Let\'s create the transaction model. Run the below command:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nblitz g all transaction\r\n</code></pre>\r\n</div>\r\n<p>This will create pages, models, mutations, and queries for the transaction model.</p>\r\n<figure class=\"w-richtext-align-fullwidth w-richtext-figure-type-image\" style=\"max-width: 1158pxpx;\">\r\n<div><img src=\"https://assets.website-files.com/5e0f1144930a8bc8aace526c/60f4275326e0db52fd80ba56_5.png\" alt=\"Generate all files for the Transaction model\" /></div>\r\n<figcaption>Generate all files for the Transaction model</figcaption>\r\n</figure>\r\n<p>Let\'s go through the files:</p>\r\n<ul role=\"list\">\r\n<li>app/pages/transactions/[transactionId].tsx: This is where a transaction in the system is displayed.</li>\r\n<li>app/pages/transactions/[transactionId]/edit.tsx: We will not need this file, so we will remove. It should have been where we edit a transaction but in a banking system transactions are not edited so we do away with this.</li>\r\n<li>app/pages/transactions/index.tsx: This file displays the list of transactions that has been carried out in our system.</li>\r\n<li>app/pages/transactions/new.tsx: This file is where a new transaction is carried out.</li>\r\n<li>app/transactions/components/TransactionForm.tsx: We don\'t need this, so we will remove it.</li>\r\n<li>app/transactions/queries/getTransaction.ts: This is a query resolver that returns a transaction from the database.</li>\r\n<li>app/transactions/queries/getTransactions.ts: This is a query resolver file that returns all the transactions in the database.</li>\r\n<li>app/transactions/mutations/createTransaction.ts: This is a mutation resolver that creates a new transaction in the database.</li>\r\n<li>app/transactions/mutations/deleteTransaction.ts: This is a mutation resolver file, it deletes a transaction from the database. We won\'t need it because we can\'t delete transactions from the system.</li>\r\n<li>app/transactions/mutations/updateTransaction.ts: This is a mutation resolver file that modifies a transaction in the database. We won\'t need this file too because we can modify a transaction.</li>\r\n</ul>\r\n<p>&nbsp;</p>', '2022-07-27 21:26:36', 200, 191, 1),
(8, 'Building a news app using RedwoodJS', '<h2 id=\"what-is-redwoodjs\">What is RedwoodJS</h2>\r\n<p><a href=\"https://redwoodjs.com/\" target=\"_blank\" rel=\"noopener\">RedwoodJS</a> is a full-stack React framework used to build modern web applications. This framework was started by Tom Preston-Werner, the cofounder of GitHub.</p>\r\n<p>RedwoodJS uses so many technologies:</p>\r\n<ul role=\"list\">\r\n<li><a href=\"https://prisma.io/\" target=\"_blank\" rel=\"noopener\">Prisma</a></li>\r\n<li><a href=\"https://graphql.com/\" target=\"_blank\" rel=\"noopener\">GraphQL</a></li>\r\n<li><a href=\"https://gist.github.com/philipszdavido/reactjs.org\" target=\"_blank\" rel=\"noopener\">Reactjs</a></li>\r\n<li><a href=\"https://jest.io/\" target=\"_blank\" rel=\"noopener\">Jest</a></li>\r\n</ul>\r\n<p>RedwoodJS is so helpful that a basic Redwood application contains both the frontend code, backend, and database readily set up for us. Its CLI code generators generate codes for any component or GraphQL services we create.</p>\r\n<p>With RedwoodJS you are way-half done in your project. We need to have some software and tools installed in your machine before we can use RedwoodJS, let\'s see them below.</p>\r\n<h2 id=\"strongrequirementsstrong\"><strong>Requirements</strong></h2>\r\n<ul role=\"list\">\r\n<li><strong>Node.js</strong>: Both Strapi and Reactjs are Node.js-based tools and frameworks respectively. To download Nodejs binary, get it from <a href=\"https://nodejs.org/\" target=\"_blank\" rel=\"noopener\">here</a>.</li>\r\n<li><strong>NPM</strong>: This is a Node.js package manager. This comes bundled with the Node.js binary. Run the command npm --version to confirm.</li>\r\n<li><strong>VS Code</strong>: A web editor from Microsoft. You can use other editors but VS Code is quite amazing and has a worldwide adoption by devs. So VS Code is recommended for this tutorial. You can download it from <a href=\"https://code.visualstudio.com/download\" target=\"_blank\" rel=\"noopener\">here</a>.</li>\r\n</ul>\r\n<p>We don\'t have to install any database because RedwoodJS by default uses SQLite.</p>\r\n<p>So we start with the creation of the News app. The first thing we need to scaffold a RedwoodJS project, let\'s see that is done below.</p>\r\n<h2 id=\"strongscaffolding-a-redwoodjs-projectstrong\"><strong>Scaffolding a RedwoodJS project</strong></h2>\r\n<p>A RedwoodJS project is scaffolded via command-line using either Yarn, NPM, or NPX. Run the below command to create a RedwoodJS project:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nyarn create redwood-app newsapp-redwood\r\n# OR\r\nnpx create-redwood-app newsapp-redwood\r\n</code></pre>\r\n</div>\r\n<p>The above commands will create a RedwoodJS in a newsapp-redwood folder.</p>\r\n<p>Using yarn tool, the create sub-command tells yarn that we want to create a project. The redwood-app sub-command tells it that we want to create a Redwoojs project. The newsapp-redwood is the folder we want the RedwoodJS project to be created in.</p>\r\n<p>The npx is similar to yarn, the difference is that the create and redwood-app are conjoined.</p>\r\n<p>Move into the newsapp-redwood folder: cd newsapp-redwood.</p>\r\n<p>To start a Redwood app, we run the command:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nyarn rw dev\r\n</code></pre>\r\n</div>\r\n<p>The rw is Redwood, it tells Yarn that we are trying to run a Redwood command. The Redwood command is dev, this command starts the Redwood server in a Redwood application. Open the URL localhost:8910 in a browser, RedwoodJS does it for you automatically though. You will see the page open:</p>\r\n<figure class=\"w-richtext-align-fullwidth w-richtext-figure-type-image\" style=\"max-width: 1600pxpx;\">\r\n<div><img src=\"https://assets.website-files.com/5e0f1144930a8bc8aace526c/6117c632101a572024db6aee_1.png\" alt=\"RedwoodJS initial page\" /></div>\r\n<figcaption>RedwoodJS initial page</figcaption>\r\n</figure>\r\n<h2 id=\"strongbuilding-news-modelstrong\"><strong>Building News model</strong></h2>\r\n<p>We are building a news website, a single news item will have this model:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nnewsItem {\r\n    title\r\n    body\r\n    writtenBy\r\n    imageUrl\r\n}\r\n</code></pre>\r\n</div>\r\n<ul role=\"list\">\r\n<li>The title is the title of the news.</li>\r\n<li>The body is the content of the news.</li>\r\n<li>The writtenBy is the author of the news.</li>\r\n<li>The imageUrl is the head image of the news.</li>\r\n</ul>\r\n<p>Now, we translate this pseudo-model to Prisma\'s model. Open the db/schema.prisma and paste the below code:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nmodel NewsItem {\r\n  id    Int     @id @<span class=\"hljs-keyword\">default</span>(autoincrement())\r\n  title <span class=\"hljs-built_in\">String</span>\r\n  body <span class=\"hljs-built_in\">String</span>\r\n  writtenBy <span class=\"hljs-built_in\">String</span>\r\n  imageUrl <span class=\"hljs-built_in\">String</span>\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Next, we run migrations. To do that run the below command:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nyarn rw prisma migrate dev\r\n</code></pre>\r\n</div>\r\n<p>The above command will prompt you to give this migration a name, the name does not matter it is just to describe what the migration does.</p>\r\n<p>I typed \"added_NewsItem\". After the command completes, a migrations folder will be created under api/db. A folder also will be created under the api/db/migrations, the folder\'s name will be a timestamp, this same folder will contain a migrations.sql. This migrations.sql file contains SQL commands that are used to bring the database up-to-date to what is in the schema.prisma file. Like this, the api/db/migrations contains trace of the changes that took place to get to the current state.</p>\r\n<h2 id=\"strongbuilding-graphql-resolvers-and-schema-definitionsstrong\"><strong>Building GraphQL resolvers and schema definitions</strong></h2>\r\n<p>RedwoodJS API is powered by GraphQL. We will create the GraphQL resolvers and definitions in the api folder.</p>\r\n<p>In RedwoodJS GraphQL definitions are defined in a .sdl.js file, and the GraphQL resolvers are services that reside in the services folder. We generate a GraphQL schema and service object using the RedwoodJS CLI generator.</p>\r\n<p>Now, we will create GraphQL definitions and services for our NewsItem model. Run the below command:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nyarn rw g sdl NewsItem --crud\r\n</code></pre>\r\n</div>\r\n<p>The above command will generate GraphQL schema definitions, mutations, queries from the NewsItem model in our schema.prisma file.</p>\r\n<p>The files created are:</p>\r\n<ul role=\"list\">\r\n<li>api/src/graphql/newsItems.sdl.js</li>\r\n<li>api/src/services/newsItems/newsItems.js</li>\r\n</ul>\r\n<p><strong>api/src/graphql/newsItems.sdl.js</strong> see the contents below:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> schema = gql<span class=\"hljs-string\">`\r\n  type NewsItem {\r\n    id: Int!\r\n    title: String!\r\n    body: String!\r\n    writtenBy: String!\r\n    imageUrl: String!\r\n  }\r\n\r\n  type Query {\r\n    newsItems: [NewsItem!]!\r\n    newsItem(id: Int!): NewsItem\r\n  }\r\n\r\n  input CreateNewsItemInput {\r\n    title: String!\r\n    body: String!\r\n    writtenBy: String!\r\n    imageUrl: String!\r\n  }\r\n\r\n  input UpdateNewsItemInput {\r\n    title: String\r\n    body: String\r\n    writtenBy: String\r\n    imageUrl: String\r\n  }\r\n\r\n  type Mutation {\r\n    createNewsItem(input: CreateNewsItemInput!): NewsItem!\r\n    updateNewsItem(id: Int!, input: UpdateNewsItemInput!): NewsItem!\r\n    deleteNewsItem(id: Int!): NewsItem!\r\n  }\r\n`</span>;\r\n</code></pre>\r\n</div>\r\n<p>We see that it contains a GraphQL schema. The NewsItem is a data type for a single news item, the inputs holds the data type of the arguments to the resolvers. The Query and Mutation are the queries and mutations in our app. In the Query, we have newsItems query that will return all news items in the database and newsItem(id: Int!) to return a news item. The Mutation has createNewsItem(input: CreateNewsItemInput!) mutation to create a new news item, updateNewsItem(id: Int!, input: UpdateNewsItemInput!) to modify a news item, and deleteNewsItem(id: Int!) to delete a news item.</p>\r\n<p><strong>api/src/services/newsItems/newsItems.js</strong> contains the resolvers for the type definitions above.</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\n<span class=\"hljs-keyword\">import</span> { db } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"src/lib/db\"</span>;\r\n\r\n<span class=\"hljs-comment\">// Used when the environment variable REDWOOD_SECURE_SERVICES=1</span>\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> newsItems = <span class=\"hljs-function\">() =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> db.newsItem.findMany();\r\n};\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> newsItem = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ id }</span>) =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> db.newsItem.findUnique({\r\n    <span class=\"hljs-attr\">where</span>: { id },\r\n  });\r\n};\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> createNewsItem = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ input }</span>) =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> db.newsItem.create({\r\n    <span class=\"hljs-attr\">data</span>: input,\r\n  });\r\n};\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> updateNewsItem = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ id, input }</span>) =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> db.newsItem.update({\r\n    <span class=\"hljs-attr\">data</span>: input,\r\n    <span class=\"hljs-attr\">where</span>: { id },\r\n  });\r\n};\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> deleteNewsItem = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ id }</span>) =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> db.newsItem.delete({\r\n    <span class=\"hljs-attr\">where</span>: { id },\r\n  });\r\n};\r\n</code></pre>\r\n</div>\r\n<p>The resolvers, returns all news items, a specific news item, creates a new news item, updates a news item, and deletes a news item.</p>\r\n<p>See that we used the db.newsItem in performing the CRUD actions in the news item table. The db is an instance of PrismaClient from the Prisma tool. This PrismaClient instance contains objects of models in the schema.prisma file, they appear whenever the migrations are run. These objects have methods that we can use to perform CRUD actions on the object\'s table in the database.</p>\r\n<p>The methods here are:</p>\r\n<ul role=\"list\">\r\n<li>db.newItems.findMany: Returns all news items in the newsItems table.</li>\r\n<li>db.newItems.findUnique: Returns a news item from the tabel.</li>\r\n<li>db.newItems.create: Creates a new news item on the newsItem table.</li>\r\n<li>db.newItems.update: Modifies a news item on the newsItem table.</li>\r\n<li>db.newItems.delete: Deletes a news item in the newsItem table.</li>\r\n</ul>\r\n<p>Now, we are done with our backend let\'s build the frontend.</p>\r\n<h2 id=\"strongbuilding-the-frontendstrong\"><strong>Building the frontend</strong></h2>\r\n<p>Our frontend will have two pages:</p>\r\n<ul role=\"list\">\r\n<li>NewsItemsPage</li>\r\n<li>NewsItemPage</li>\r\n</ul>\r\n<p><strong>NewsItemsPage</strong> This page will display all the news in the database. The URL path to this page will be /news.</p>\r\n<p><strong>NewsItemPage</strong> This page displays a single news item. This page\'s URL path is /news/{id}.</p>\r\n<p>We will generate Cell files. A Cell in RedwoodJS is used to fetch data from our backend. We will have two Cell components: NewsItemsCell and NewsItemCell.</p>\r\n<p><strong>NewsItemsCell</strong> This will fetch and render all the news in the database.</p>\r\n<p><strong>NewsItemCell</strong> This is will fetch and render a news item.</p>\r\n<p>So we generate the cells:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nyarn rw g cell NewsItems\r\nyarn rw g cell NewsItem\r\n</code></pre>\r\n</div>\r\n<p>The first command will generate src/components/NewsItems.js file. Open it and re-edit the code to below:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\n<span class=\"hljs-keyword\">import</span> NewsCard <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"src/components/NewsCard\"</span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> QUERY = gql<span class=\"hljs-string\">`\r\n  query NewsItemsQuery {\r\n    newsItems {\r\n      id\r\n      title\r\n      body\r\n      writtenBy\r\n      imageUrl\r\n    }\r\n  }\r\n`</span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Loading = <span class=\"hljs-function\">() =&gt;</span> <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>Loading...<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Empty = <span class=\"hljs-function\">() =&gt;</span> <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>Empty<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Failure = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ error }</span>) =&gt;</span> (\r\n  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span> <span class=\"hljs-attr\">style</span>=<span class=\"hljs-string\">{{</span> <span class=\"hljs-attr\">color:</span> \"<span class=\"hljs-attr\">red</span>\" }}&gt;</span>Error: {error.message}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>\r\n);\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Success = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ newsItems }</span>) =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> (\r\n    <span class=\"xml\"><span class=\"hljs-tag\">&lt;&gt;</span>\r\n      {newsItems.map((item) =&gt; {\r\n        return <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">NewsCard</span> <span class=\"hljs-attr\">key</span>=<span class=\"hljs-string\">{item.id}</span> <span class=\"hljs-attr\">newsItem</span>=<span class=\"hljs-string\">{item}</span> /&gt;</span>;\r\n      })}\r\n    <span class=\"hljs-tag\">&lt;/&gt;</span></span>\r\n  );\r\n};\r\n</code></pre>\r\n</div>\r\n<p>We have a query in QUERY that fetches all news items in the database. See that we have four functions: Loading, Empty, Failure and Success.</p>\r\n<p><strong>Loading</strong> This function is run by RedwoodJS when data is being actively fetched over the network.</p>\r\n<p><strong>Empty</strong> This function is run to display Empty when no data is returned from the data fetching.</p>\r\n<p><strong>Failure</strong> This function is run by RedwoodJS when the data fetching fails or the server returns an error.</p>\r\n<p><strong>Success</strong> This function is run when the data fetching is successful.</p>\r\n<p>So we see that the functions are rendered when certain states are triggered when fetching data over the network.</p>\r\n<p>We touched the Success function to include how we want to display our news items. We passed each news item to a NewsCard component to render.</p>\r\n<p>Let\'s see the second command: yarn rw g cell NewsItem. This creates a src/components/NewsItemCell/NewsItemCell.js file. Let\'s see the contents:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\n<span class=\"hljs-keyword\">import</span> NewsItem <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\"src/components/NewsItem\"</span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> QUERY = gql<span class=\"hljs-string\">`\r\n  query FindNewsItemQuery($id: Int!) {\r\n    newsItem: newsItem(id: $id) {\r\n      id\r\n      title\r\n      body\r\n      writtenBy\r\n      imageUrl\r\n    }\r\n  }\r\n`</span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Loading = <span class=\"hljs-function\">() =&gt;</span> <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>Loading...<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Empty = <span class=\"hljs-function\">() =&gt;</span> <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>Empty<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>;\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Failure = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ error }</span>) =&gt;</span> (\r\n  <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span> <span class=\"hljs-attr\">style</span>=<span class=\"hljs-string\">{{</span> <span class=\"hljs-attr\">color:</span> \"<span class=\"hljs-attr\">red</span>\" }}&gt;</span>Error: {error.message}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>\r\n);\r\n\r\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> Success = <span class=\"hljs-function\">(<span class=\"hljs-params\">{ newsItem }</span>) =&gt;</span> {\r\n  <span class=\"hljs-keyword\">return</span> <span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">NewsItem</span> <span class=\"hljs-attr\">news</span>=<span class=\"hljs-string\">{newsItem}</span> /&gt;</span></span>;\r\n};\r\n</code></pre>\r\n</div>\r\n<p>This Cell component returns a specific news item. See the query in the QUERY variable, it uses the $id to query for a single news item. All Cell components have the same structure, the return element of the Success was altered to return a NewsItem component, this NewsItem component will render the news.</p>\r\n<p>Let\'s generate the pages, run the below command:</p>\r\n<div class=\"w-embed\">\r\n<pre><code class=\"javascript hljs\">\r\nyarn rw g page NewsItems /news\r\nyarn rw g page NewsItem /news/{id}\r\n</code></pre>\r\n</div>\r\n<p>&nbsp;</p>', '2022-07-27 21:28:51', 200, 192, 2),
(9, 'Improve your product notifications with Digest, Separate Feeds, and Notification Action Buttons', '<h2>Product Notification - What are those?</h2>\r\n<p>Product Notifications are everywhere - Emails, SMSs, Push notifications, Direct providers such as Slack , and In-app(known as Notification Center). Basically, product notifications are any way through which products communicate key messages to end-users.</p>\r\n<div class=\"ff-container ff-ready ff-active\">&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<div class=\"ff-container ff-ready ff-active\"><img id=\"animated-0\" class=\"ff-image\" src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--B9yMjq9x--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/7j873x6qe9xa6kdg9896.gif\" alt=\"Notifications\" width=\"880\" height=\"482\" data-animated=\"true\" /></div>\r\n<p>&nbsp;</p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<h2><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#scale-when-things-get-complicated\" name=\"scale-when-things-get-complicated\"> </a> Scale - when things get complicated</h2>\r\n<p>When companies grow, tens or hundreds of emails and other notifications are sent - one-time password emails, weekly digests, product updates, product-led growth (PLG) emails, member invites, and so on. Once you have more than three types of emails to manage, another layer with the complexities of managing multiple notifications templates comes up. Furthermore, as companies grow, you\'ll have users in different channels, all requiring custom notifications daily.</p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<h2><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#manage-notifications-complexity-and-create-a-better-user-experience\" name=\"manage-notifications-complexity-and-create-a-better-user-experience\"> </a> Manage notifications complexity and create a better user experience</h2>\r\n<h3><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#digest\" name=\"digest\"> </a> Digest</h3>\r\n<p>Imagine your company has an app where users interact with each other\'s content. Whenever you post content, users get a notification for each and every like or comment &ndash; how tedious would that be? No user will keep your app\'s notifications on if that\'s the experience they\'ll get.</p>\r\n<p>Digest (sometimes called \"batches\") is a way to aggregate individual notifications into a \"super\" notification at a predefined time. You can also define parameters that determine the intervals in which users get notifications. So notifications are &ldquo;digested&rdquo; or &ldquo;batched&rdquo; into one message and sent at the end of the day or the interval you define.</p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--Clxhodxr--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/wspcp390chnmlp9drf96.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--Clxhodxr--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/wspcp390chnmlp9drf96.png\" alt=\"![Digest]\" width=\"880\" height=\"558\" /></a></p>\r\n<h3><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#call-to-action-buttons\" name=\"call-to-action-buttons\"> </a> Call to action buttons</h3>\r\n<p>When you get a friend request over Facebook, you can usually see that the notification has a call-to-action inside.<br />Confirm or Cancel - This is the simplest form of two-way communication, which is essential for any product to have.</p>\r\n<p>With Novu, you can customize those buttons, and to have as many as needed so your end-users are called to action.</p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--YPV6S9hM--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2pqt50vnl3boeqzhrygr.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--YPV6S9hM--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2pqt50vnl3boeqzhrygr.png\" alt=\"Call to action\" width=\"880\" height=\"263\" /></a></p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<h3><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#different-feeds-of-notifications\" name=\"different-feeds-of-notifications\"> </a> Different feeds of notifications</h3>\r\n<p>Notification Feeds are the tabs-like feeds seen in the notification center for different kinds of notifications.<br />It can be:<br />One for likes, one for comments (like Reddit).<br />One for Inbox, one for following (like Notion)<br />One for all, One for unread (like Facebook)</p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--PGuOP_QV--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/wqf0is6yqk4alp9zed32.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--PGuOP_QV--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/wqf0is6yqk4alp9zed32.png\" alt=\"Feeds\" width=\"880\" height=\"388\" /></a></p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<h2><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#what-happens-next\" name=\"what-happens-next\"> </a> What happens next?</h2>\r\n<p>Companies add notifications incrementally as they grow, and notifications management becomes a nightmare. Another possibility is that companies choose to build a notifications product in-house from scratch. As I see it, neither option makes sense; 99% of startups die, and building a notifications product from scratch gets you closer to becoming part of this statistic.</p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--3NQvf_Ds--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/xony89ciq6p3bck4m70l.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--3NQvf_Ds--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/xony89ciq6p3bck4m70l.png\" alt=\"Novu\" width=\"400\" height=\"126\" /></a></p>\r\n<p>Novu is the first open-source notifications infrastructure built by developers for developers. It\'s a one-stop shop for all things notifications, just like Stripe for payments.</p>\r\n<p>Developers worldwide can quickly implement our infrastructure without the hassle of building a notifications system from scratch so they can focus on what matters to their company.<br /><a href=\"https://github.com/novuhq/novu\">https://github.com/novuhq/novu</a></p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<h1><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#%EF%B8%8F%EF%B8%8F-i-am-happy-to-announce-novu-new-version-060-%EF%B8%8F%EF%B8%8F\" name=\"ï¸ï¸-i-am-happy-to-announce-novu-new-version-060-ï¸ï¸\"> </a> â­ï¸â­ï¸ I am happy to announce Novu new version 0.6.0!!! â­ï¸â­ï¸</h1>\r\n<p>Now you can:</p>\r\n<ul>\r\n<li>Create your own user journey using the drag-and-drop workflow editor.</li>\r\n<li>Put notifications into digest (batch).</li>\r\n<li>Create different feeds of notifications.</li>\r\n<li>Add buttons (action items) inside your notifications.</li>\r\n</ul>\r\n<p>I want to thank all our amazing contributors, we couldn\'t do it without you!<br />See the full list of contributors here:<br /><a href=\"https://github.com/novuhq/novu/releases/tag/v0.6.0\">https://github.com/novuhq/novu/releases/tag/v0.6.0</a></p>\r\n<p><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--MxG7yd2w--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zei41ayzzfy82cj55kom.png\" alt=\"Image description\" width=\"200\" height=\"50\" /></a></p>\r\n<h1><a href=\"https://dev.to/novu/improve-your-product-notifications-with-digest-separate-feeds-and-feeds-action-buttons-1l6k#novu-is-looking-for-new-contributors\" name=\"novu-is-looking-for-new-contributors\"> </a> Novu is looking for new contributors!</h1>\r\n<p>Come help us out to build the best open-source notification infrastructure, get recognized by the community, and become a Community Hero here:<br /><a href=\"https://novu.co/contributors/\">https://novu.co/contributors/</a><br /><a class=\"article-body-image-wrapper\" href=\"https://res.cloudinary.com/practicaldev/image/fetch/s--pt7Tamgw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/hrf5ra8oy9dcaw48ek0n.png\"><img src=\"https://res.cloudinary.com/practicaldev/image/fetch/s--pt7Tamgw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/hrf5ra8oy9dcaw48ek0n.png\" alt=\"Image description\" width=\"880\" height=\"375\" /></a></p>\r\n<p>We are always looking for your inputs so we can build together the best notifications user experience. Any new ideas? Write me in the comments below ðŸ‘‡ðŸ‘‡ðŸ‘‡ðŸ‘‡</p>\r\n<p>&nbsp;</p>', '2022-07-27 21:52:22', 199, 193, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_attempts` int(11) DEFAULT NULL,
  `permission_id` tinyint(1) NOT NULL DEFAULT '2',
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `login_attempts`, `permission_id`, `file_id`) VALUES
(1, 'ahmed', 'samir', 'a.samirsherif@gmail.com', '$2y$10$nI2NE38Z01oZDj3SBXw5PueXO3mrIWMpuWcnWvW.0K7XvRnsufqJ.', 0, 1, NULL),
(199, 'editor', 'demo', 'editor@demo.com', '$2y$10$RJ.uymoYhD5NUNanbuChHOAN14wrdlsXcsvwtHVFoTuq2JbEKXwzi', 0, 2, NULL),
(200, 'admin', 'demo', 'admin@demo.com', '$2y$10$QB60/EelZqkDOICZ3K2hheHkIcGYj6qjJrae6Sa64SVebMiUO3v6u', 0, 1, 0),
(201, 'guest', 'demo', 'guest@demo.com', '$2y$10$VD24MQNgpyxCU8NPeetXYeaaybeIaJ/rjPds/tev.GLNuHddsR0qK', 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `id` int(11) NOT NULL,
  `permission` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_permission`
--

INSERT INTO `user_permission` (`id`, `permission`) VALUES
(1, 'Admin'),
(2, 'Editor'),
(3, 'Guest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_id` (`posts_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `user_permission`
--
ALTER TABLE `user_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `posts_id` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
