--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.procurement_orders DROP CONSTRAINT IF EXISTS fkthjya06tx4ktno1tw72q1vogf;
ALTER TABLE IF EXISTS ONLY public.support_messages DROP CONSTRAINT IF EXISTS fkt3x5f2qc7d89medr0xxslx982;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS fksjfs85qf6vmcurlx43cnc16gy;
ALTER TABLE IF EXISTS ONLY public.stock_movements DROP CONSTRAINT IF EXISTS fksf8xqne4s20910sgk48jvyx4u;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS fksaok720gsu4u2wrgbk10b5n8d;
ALTER TABLE IF EXISTS ONLY public.shipments DROP CONSTRAINT IF EXISTS fkrnt4wht95lxxplspltrg9681s;
ALTER TABLE IF EXISTS ONLY public.satisfaction_surveys DROP CONSTRAINT IF EXISTS fkrivxx8qmqpjxdli4nwquxol58;
ALTER TABLE IF EXISTS ONLY public.wishlist_items DROP CONSTRAINT IF EXISTS fkqxj7lncd242b59fb78rqegyxj;
ALTER TABLE IF EXISTS ONLY public.customer_addresses DROP CONSTRAINT IF EXISTS fkqptcrpu3x8qle4pawfritva6o;
ALTER TABLE IF EXISTS ONLY public.product_images DROP CONSTRAINT IF EXISTS fkqnq71xsohugpqwf3c9gxmsuy;
ALTER TABLE IF EXISTS ONLY public.customer_metrics DROP CONSTRAINT IF EXISTS fkqj2ewu7pf91h6a56jvd05l6s;
ALTER TABLE IF EXISTS ONLY public.order_tracking_events DROP CONSTRAINT IF EXISTS fkpiysrnkv9a30xirabwtyd0poj;
ALTER TABLE IF EXISTS ONLY public.cart_items DROP CONSTRAINT IF EXISTS fkpcttvuq4mxppo8sxggjtn5i2c;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS fkog2rp4qthbtt2lfyhfo32lsw9;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS fkocimc7dtr037rh4ls4l95nlfi;
ALTER TABLE IF EXISTS ONLY public.support_tickets DROP CONSTRAINT IF EXISTS fko9o82krkf7cg9ic4r5froc83v;
ALTER TABLE IF EXISTS ONLY public.payment_transactions DROP CONSTRAINT IF EXISTS fknsous9qyrjv5ss8que6o6617;
ALTER TABLE IF EXISTS ONLY public.wishlist_items DROP CONSTRAINT IF EXISTS fkmmj2k1i459yu449k3h1vx5abp;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS fkmb88e3a35geg9rxiefr1qma88;
ALTER TABLE IF EXISTS ONLY public.mfa_otps DROP CONSTRAINT IF EXISTS fkm4pfhtf6c4ov8if1v97yfrpy;
ALTER TABLE IF EXISTS ONLY public.fulfillment_orders DROP CONSTRAINT IF EXISTS fklqmme8l6wu2wdx6m5pdg5kvc6;
ALTER TABLE IF EXISTS ONLY public.sectors DROP CONSTRAINT IF EXISTS fklj3sbd4y976qcn545xkiptog6;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS fkk3ndxg5xp6v7wd4gjyusp15gq;
ALTER TABLE IF EXISTS ONLY public.user_roles DROP CONSTRAINT IF EXISTS fkhfh9dx7w3ubf1co1vdev94g3f;
ALTER TABLE IF EXISTS ONLY public.user_roles DROP CONSTRAINT IF EXISTS fkh8ciramu9cc9q3qcqiv4ue8a6;
ALTER TABLE IF EXISTS ONLY public.communication_logs DROP CONSTRAINT IF EXISTS fkgk9474pf5rnu0c37mekk9gap9;
ALTER TABLE IF EXISTS ONLY public.chat_messages DROP CONSTRAINT IF EXISTS fkgiqeap8ays4lf684x7m0r2729;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS fkg3485uyc54ym22haggn1lwumx;
ALTER TABLE IF EXISTS ONLY public.support_messages DROP CONSTRAINT IF EXISTS fkejv4umpsfsqv4amvnjrmni3xi;
ALTER TABLE IF EXISTS ONLY public.procurement_orders DROP CONSTRAINT IF EXISTS fke1ykrunqgqpagtdqorh0ea8l;
ALTER TABLE IF EXISTS ONLY public.procurement_orders DROP CONSTRAINT IF EXISTS fkbvdwa0a0j4xip16ocu2twj4bk;
ALTER TABLE IF EXISTS ONLY public.return_requests DROP CONSTRAINT IF EXISTS fkbski88d6kewx0cbj5pk7nes01;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS fkbioxgbv59vetrxe0ejfubep1w;
ALTER TABLE IF EXISTS ONLY public.carts DROP CONSTRAINT IF EXISTS fkb5o626f86h46m4s7ms6ginnop;
ALTER TABLE IF EXISTS ONLY public.chat_sessions DROP CONSTRAINT IF EXISTS fkao4yreakip07aurht94h7lo6r;
ALTER TABLE IF EXISTS ONLY public.villages DROP CONSTRAINT IF EXISTS fkancrfdwvkb9r5d743uydn9ocf;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS fk9y21adhxn0ayjhfocscqox7bh;
ALTER TABLE IF EXISTS ONLY public.customer_profiles DROP CONSTRAINT IF EXISTS fk9u9qbkn57pxecpxjstd68deti;
ALTER TABLE IF EXISTS ONLY public.fulfillment_orders DROP CONSTRAINT IF EXISTS fk9r0ufkesaxvhurv9q8fch75ka;
ALTER TABLE IF EXISTS ONLY public.customer_profiles DROP CONSTRAINT IF EXISTS fk9b8jyctrw1rowxsyiwmvh3gae;
ALTER TABLE IF EXISTS ONLY public.feedbacks DROP CONSTRAINT IF EXISTS fk8kw5agn6ypgg4lkjrbc54wk0c;
ALTER TABLE IF EXISTS ONLY public.districts DROP CONSTRAINT IF EXISTS fk82doq1t64jhly7a546lpvnu2c;
ALTER TABLE IF EXISTS ONLY public.communication_logs DROP CONSTRAINT IF EXISTS fk81wbm56ml5kl04lda12gxhrxs;
ALTER TABLE IF EXISTS ONLY public.chat_sessions DROP CONSTRAINT IF EXISTS fk6acn2awn3clx0yvpn8htd70be;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS fk5u9vbactm63h16y9fj00t798f;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS fk5cyj7v7fvm60i2ubciqfo2wxm;
ALTER TABLE IF EXISTS ONLY public.product_reviews DROP CONSTRAINT IF EXISTS fk58i39bhws2hss3tbcvdmrm60f;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS fk4b4af0ov0jw6r9xtq3tabt5a;
ALTER TABLE IF EXISTS ONLY public.cells DROP CONSTRAINT IF EXISTS fk3dykl3bvacycgrefqn0kwl7kx;
ALTER TABLE IF EXISTS ONLY public.chat_messages DROP CONSTRAINT IF EXISTS fk3cpkdtwdxndrjhrx3gt9q5ux9;
ALTER TABLE IF EXISTS ONLY public.product_reviews DROP CONSTRAINT IF EXISTS fk35kxxqe2g9r4mww80w9e3tnw9;
ALTER TABLE IF EXISTS ONLY public.support_tickets DROP CONSTRAINT IF EXISTS fk1tmbsselat6ceyejefrvdeis9;
ALTER TABLE IF EXISTS ONLY public.cart_items DROP CONSTRAINT IF EXISTS fk1re40cjegsfvw58xrkdp6bac6;
ALTER TABLE IF EXISTS ONLY public.refresh_tokens DROP CONSTRAINT IF EXISTS fk1lih5y2npsf8u5o3vhdb9y0os;
DROP INDEX IF EXISTS public.idx_village_name;
DROP INDEX IF EXISTS public.idx_village_cell;
DROP INDEX IF EXISTS public.idx_sector_name;
DROP INDEX IF EXISTS public.idx_sector_district;
DROP INDEX IF EXISTS public.idx_province_name;
DROP INDEX IF EXISTS public.idx_district_province;
DROP INDEX IF EXISTS public.idx_district_name;
DROP INDEX IF EXISTS public.idx_cell_sector;
DROP INDEX IF EXISTS public.idx_cell_name;
ALTER TABLE IF EXISTS ONLY public.wishlist_items DROP CONSTRAINT IF EXISTS wishlist_items_pkey;
ALTER TABLE IF EXISTS ONLY public.villages DROP CONSTRAINT IF EXISTS villages_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.user_roles DROP CONSTRAINT IF EXISTS user_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS ukt8o6pivur7nn124jehx7cygw5;
ALTER TABLE IF EXISTS ONLY public.fulfillment_orders DROP CONSTRAINT IF EXISTS ukrkhys3qm94etm6t863ifw77t0;
ALTER TABLE IF EXISTS ONLY public.satisfaction_surveys DROP CONSTRAINT IF EXISTS ukpv41e93d5s8qmc9eq8ws0hawj;
ALTER TABLE IF EXISTS ONLY public.inventory_items DROP CONSTRAINT IF EXISTS ukp0mih1lkha7t38jh46r3uu0eg;
ALTER TABLE IF EXISTS ONLY public.roles DROP CONSTRAINT IF EXISTS ukofx66keruapi6vyqpv6f2or37;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS uknthkiu7pgmnqnu86i2jyoe2v7;
ALTER TABLE IF EXISTS ONLY public.fulfillment_orders DROP CONSTRAINT IF EXISTS ukng3qc69pwbil0dalh7vkmueod;
ALTER TABLE IF EXISTS ONLY public.return_requests DROP CONSTRAINT IF EXISTS ukmlyu5yxuty6xy4bndr5rrnfr0;
ALTER TABLE IF EXISTS ONLY public.provinces DROP CONSTRAINT IF EXISTS ukl256wnwfdobq071mcq7rckr9y;
ALTER TABLE IF EXISTS ONLY public.customer_profiles DROP CONSTRAINT IF EXISTS ukjoftwv6r96fq3bdnu7q00hq1w;
ALTER TABLE IF EXISTS ONLY public.mfa_otps DROP CONSTRAINT IF EXISTS ukicfpxf4f0hvk8up1epwolbe29;
ALTER TABLE IF EXISTS ONLY public.customer_metrics DROP CONSTRAINT IF EXISTS ukhuf800pbo311daueruwtpgd4w;
ALTER TABLE IF EXISTS ONLY public.shipments DROP CONSTRAINT IF EXISTS ukhrhy2yghr8dampg1jtecuekvp;
ALTER TABLE IF EXISTS ONLY public.refresh_tokens DROP CONSTRAINT IF EXISTS ukghpmfn23vmxfu3spu3lfg4r2d;
ALTER TABLE IF EXISTS ONLY public.coupons DROP CONSTRAINT IF EXISTS ukeplt0kkm9yf2of2lnx6c1oy9b;
ALTER TABLE IF EXISTS ONLY public.villages DROP CONSTRAINT IF EXISTS uk_village_cell_name;
ALTER TABLE IF EXISTS ONLY public.sectors DROP CONSTRAINT IF EXISTS uk_sector_district_name;
ALTER TABLE IF EXISTS ONLY public.districts DROP CONSTRAINT IF EXISTS uk_district_province_name;
ALTER TABLE IF EXISTS ONLY public.cells DROP CONSTRAINT IF EXISTS uk_cell_sector_name;
ALTER TABLE IF EXISTS ONLY public.customer_segments DROP CONSTRAINT IF EXISTS uk9v933bm211015c3i1vh4qg1iq;
ALTER TABLE IF EXISTS ONLY public.tax_rates DROP CONSTRAINT IF EXISTS uk88nhapcsosjsuypf5wedngqgk;
ALTER TABLE IF EXISTS ONLY public.system_configurations DROP CONSTRAINT IF EXISTS uk867jsfttn43kaegq3c6c24b7r;
ALTER TABLE IF EXISTS ONLY public.refresh_tokens DROP CONSTRAINT IF EXISTS uk7tdcd6ab5wsgoudnvj7xf1b7l;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS uk71lqwbwtklmljk3qlsugr1mig;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS uk6dotkott2kjsp8vw4d0m25fb7;
ALTER TABLE IF EXISTS ONLY public.carts DROP CONSTRAINT IF EXISTS uk64t7ox312pqal3p7fg9o503c2;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS uk61hq67yr3nuuwvx80rbr95r4s;
ALTER TABLE IF EXISTS ONLY public.tax_records DROP CONSTRAINT IF EXISTS tax_records_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_rates DROP CONSTRAINT IF EXISTS tax_rates_pkey;
ALTER TABLE IF EXISTS ONLY public.system_configurations DROP CONSTRAINT IF EXISTS system_configurations_pkey;
ALTER TABLE IF EXISTS ONLY public.system_backups DROP CONSTRAINT IF EXISTS system_backups_pkey;
ALTER TABLE IF EXISTS ONLY public.support_tickets DROP CONSTRAINT IF EXISTS support_tickets_pkey;
ALTER TABLE IF EXISTS ONLY public.support_messages DROP CONSTRAINT IF EXISTS support_messages_pkey;
ALTER TABLE IF EXISTS ONLY public.suppliers DROP CONSTRAINT IF EXISTS suppliers_pkey;
ALTER TABLE IF EXISTS ONLY public.stock_movements DROP CONSTRAINT IF EXISTS stock_movements_pkey;
ALTER TABLE IF EXISTS ONLY public.shipments DROP CONSTRAINT IF EXISTS shipments_pkey;
ALTER TABLE IF EXISTS ONLY public.security_settings DROP CONSTRAINT IF EXISTS security_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.sectors DROP CONSTRAINT IF EXISTS sectors_pkey;
ALTER TABLE IF EXISTS ONLY public.satisfaction_surveys DROP CONSTRAINT IF EXISTS satisfaction_surveys_pkey;
ALTER TABLE IF EXISTS ONLY public.sales_reports DROP CONSTRAINT IF EXISTS sales_reports_pkey;
ALTER TABLE IF EXISTS ONLY public.roles DROP CONSTRAINT IF EXISTS roles_pkey;
ALTER TABLE IF EXISTS ONLY public.revenues DROP CONSTRAINT IF EXISTS revenues_pkey;
ALTER TABLE IF EXISTS ONLY public.return_requests DROP CONSTRAINT IF EXISTS return_requests_pkey;
ALTER TABLE IF EXISTS ONLY public.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.provinces DROP CONSTRAINT IF EXISTS provinces_pkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.product_reviews DROP CONSTRAINT IF EXISTS product_reviews_pkey;
ALTER TABLE IF EXISTS ONLY public.product_images DROP CONSTRAINT IF EXISTS product_images_pkey;
ALTER TABLE IF EXISTS ONLY public.procurement_orders DROP CONSTRAINT IF EXISTS procurement_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_transactions DROP CONSTRAINT IF EXISTS payment_transactions_pkey;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS password_reset_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.order_tracking_events DROP CONSTRAINT IF EXISTS order_tracking_events_pkey;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS order_items_pkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.mfa_otps DROP CONSTRAINT IF EXISTS mfa_otps_pkey;
ALTER TABLE IF EXISTS ONLY public.login_attempts DROP CONSTRAINT IF EXISTS login_attempts_pkey;
ALTER TABLE IF EXISTS ONLY public.kpi_records DROP CONSTRAINT IF EXISTS kpi_records_pkey;
ALTER TABLE IF EXISTS ONLY public.inventory_items DROP CONSTRAINT IF EXISTS inventory_items_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_orders DROP CONSTRAINT IF EXISTS fulfillment_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.financial_reports DROP CONSTRAINT IF EXISTS financial_reports_pkey;
ALTER TABLE IF EXISTS ONLY public.feedbacks DROP CONSTRAINT IF EXISTS feedbacks_pkey;
ALTER TABLE IF EXISTS ONLY public.faq_articles DROP CONSTRAINT IF EXISTS faq_articles_pkey;
ALTER TABLE IF EXISTS ONLY public.expenses DROP CONSTRAINT IF EXISTS expenses_pkey;
ALTER TABLE IF EXISTS ONLY public.districts DROP CONSTRAINT IF EXISTS districts_pkey;
ALTER TABLE IF EXISTS ONLY public.discounts DROP CONSTRAINT IF EXISTS discounts_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_segments DROP CONSTRAINT IF EXISTS customer_segments_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_profiles DROP CONSTRAINT IF EXISTS customer_profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_metrics DROP CONSTRAINT IF EXISTS customer_metrics_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_addresses DROP CONSTRAINT IF EXISTS customer_addresses_pkey;
ALTER TABLE IF EXISTS ONLY public.coupons DROP CONSTRAINT IF EXISTS coupons_pkey;
ALTER TABLE IF EXISTS ONLY public.communication_logs DROP CONSTRAINT IF EXISTS communication_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.chat_sessions DROP CONSTRAINT IF EXISTS chat_sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.chat_messages DROP CONSTRAINT IF EXISTS chat_messages_pkey;
ALTER TABLE IF EXISTS ONLY public.cells DROP CONSTRAINT IF EXISTS cells_pkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_pkey;
ALTER TABLE IF EXISTS ONLY public.carts DROP CONSTRAINT IF EXISTS carts_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_items DROP CONSTRAINT IF EXISTS cart_items_pkey;
ALTER TABLE IF EXISTS ONLY public.banners DROP CONSTRAINT IF EXISTS banners_pkey;
ALTER TABLE IF EXISTS ONLY public.audit_logs DROP CONSTRAINT IF EXISTS audit_logs_pkey;
DROP TABLE IF EXISTS public.wishlist_items;
DROP TABLE IF EXISTS public.villages;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.user_roles;
DROP TABLE IF EXISTS public.tax_records;
DROP TABLE IF EXISTS public.tax_rates;
DROP TABLE IF EXISTS public.system_configurations;
DROP TABLE IF EXISTS public.system_backups;
DROP TABLE IF EXISTS public.support_tickets;
DROP TABLE IF EXISTS public.support_messages;
DROP TABLE IF EXISTS public.suppliers;
DROP TABLE IF EXISTS public.stock_movements;
DROP TABLE IF EXISTS public.shipments;
DROP TABLE IF EXISTS public.security_settings;
DROP TABLE IF EXISTS public.sectors;
DROP TABLE IF EXISTS public.satisfaction_surveys;
DROP TABLE IF EXISTS public.sales_reports;
DROP TABLE IF EXISTS public.roles;
DROP TABLE IF EXISTS public.revenues;
DROP TABLE IF EXISTS public.return_requests;
DROP TABLE IF EXISTS public.refresh_tokens;
DROP TABLE IF EXISTS public.provinces;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.product_reviews;
DROP TABLE IF EXISTS public.product_images;
DROP TABLE IF EXISTS public.procurement_orders;
DROP TABLE IF EXISTS public.payment_transactions;
DROP TABLE IF EXISTS public.password_reset_tokens;
DROP TABLE IF EXISTS public.orders;
DROP TABLE IF EXISTS public.order_tracking_events;
DROP TABLE IF EXISTS public.order_items;
DROP TABLE IF EXISTS public.notifications;
DROP TABLE IF EXISTS public.mfa_otps;
DROP TABLE IF EXISTS public.login_attempts;
DROP TABLE IF EXISTS public.kpi_records;
DROP TABLE IF EXISTS public.inventory_items;
DROP TABLE IF EXISTS public.fulfillment_orders;
DROP TABLE IF EXISTS public.financial_reports;
DROP TABLE IF EXISTS public.feedbacks;
DROP TABLE IF EXISTS public.faq_articles;
DROP TABLE IF EXISTS public.expenses;
DROP TABLE IF EXISTS public.districts;
DROP TABLE IF EXISTS public.discounts;
DROP TABLE IF EXISTS public.customer_segments;
DROP TABLE IF EXISTS public.customer_profiles;
DROP TABLE IF EXISTS public.customer_metrics;
DROP TABLE IF EXISTS public.customer_addresses;
DROP TABLE IF EXISTS public.coupons;
DROP TABLE IF EXISTS public.communication_logs;
DROP TABLE IF EXISTS public.chat_sessions;
DROP TABLE IF EXISTS public.chat_messages;
DROP TABLE IF EXISTS public.cells;
DROP TABLE IF EXISTS public.categories;
DROP TABLE IF EXISTS public.carts;
DROP TABLE IF EXISTS public.cart_items;
DROP TABLE IF EXISTS public.banners;
DROP TABLE IF EXISTS public.audit_logs;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    action character varying(255) NOT NULL,
    details character varying(255),
    ip_address character varying(255) NOT NULL,
    resource character varying(255) NOT NULL,
    status character varying(255),
    "timestamp" timestamp(6) without time zone,
    user_email character varying(255)
);


--
-- Name: banners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banners (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    active boolean NOT NULL,
    button_text character varying(255),
    display_order integer,
    image_url character varying(255),
    link_url character varying(255),
    product_id uuid,
    subtitle text,
    tag_label character varying(255),
    title character varying(255) NOT NULL
);


--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_items (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    quantity integer NOT NULL,
    cart_id uuid NOT NULL,
    product_id uuid NOT NULL
);


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    user_id uuid NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    description character varying(255),
    name character varying(255) NOT NULL,
    parent_id uuid
);


--
-- Name: cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cells (
    id uuid NOT NULL,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
    sector_id uuid NOT NULL
);


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_messages (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    message text NOT NULL,
    sender_id uuid NOT NULL,
    session_id uuid NOT NULL
);


--
-- Name: chat_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_sessions (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    status character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    agent_id uuid,
    customer_id uuid NOT NULL
);


--
-- Name: communication_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.communication_logs (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    channel character varying(255) NOT NULL,
    notes text,
    outcome character varying(255),
    reference_id character varying(255),
    reference_type character varying(255),
    subject character varying(255) NOT NULL,
    customer_id uuid NOT NULL,
    handled_by_id uuid
);


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupons (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    active boolean NOT NULL,
    amount numeric(38,2) NOT NULL,
    code character varying(255) NOT NULL,
    current_usage integer,
    expiry_date timestamp(6) without time zone,
    minimum_order_amount numeric(38,2),
    type character varying(255) NOT NULL,
    usage_limit integer
);


--
-- Name: customer_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_addresses (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    cell character varying(255) NOT NULL,
    default_address boolean NOT NULL,
    delivery_instructions character varying(1000),
    delivery_phone_number character varying(255),
    district character varying(255) NOT NULL,
    label character varying(255),
    province character varying(255) NOT NULL,
    sector character varying(255) NOT NULL,
    village character varying(255) NOT NULL,
    customer_id uuid NOT NULL
);


--
-- Name: customer_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_metrics (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    average_order_value numeric(38,2),
    engagement_score integer,
    return_rate_percentage integer,
    customer_id uuid NOT NULL
);


--
-- Name: customer_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_profiles (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    last_purchase_date date,
    total_purchases integer,
    total_spent numeric(38,2),
    customer_id uuid NOT NULL,
    segment_id uuid
);


--
-- Name: customer_segments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_segments (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    description character varying(255),
    name character varying(255) NOT NULL
);


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discounts (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    active boolean NOT NULL,
    description character varying(255) NOT NULL,
    discount_percentage numeric(38,2) NOT NULL,
    end_date timestamp(6) without time zone,
    name character varying(255) NOT NULL,
    start_date timestamp(6) without time zone
);


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    id uuid NOT NULL,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
    province_id uuid NOT NULL
);


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expenses (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    amount numeric(38,2) NOT NULL,
    category character varying(255) NOT NULL,
    description character varying(255),
    expense_date date NOT NULL,
    status character varying(255) NOT NULL
);


--
-- Name: faq_articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faq_articles (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    answer text NOT NULL,
    category character varying(255) NOT NULL,
    published boolean NOT NULL,
    question character varying(255) NOT NULL
);


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedbacks (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    category character varying(255),
    comments text,
    rating integer NOT NULL,
    reference_id character varying(255),
    customer_id uuid NOT NULL
);


--
-- Name: financial_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.financial_reports (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    generated_date date,
    net_profit numeric(38,2) NOT NULL,
    report_period character varying(255) NOT NULL,
    total_expenses numeric(38,2) NOT NULL,
    total_revenue numeric(38,2) NOT NULL
);


--
-- Name: fulfillment_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment_orders (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    completed_at timestamp(6) without time zone,
    dispatched_at timestamp(6) without time zone,
    packed_at timestamp(6) without time zone,
    picked_at timestamp(6) without time zone,
    status character varying(255) NOT NULL,
    order_id uuid NOT NULL,
    shipment_id uuid
);


--
-- Name: inventory_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_items (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    location character varying(255) NOT NULL,
    low_stock_threshold integer NOT NULL,
    product_name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    sku character varying(255) NOT NULL,
    unit_cost numeric(38,2)
);


--
-- Name: kpi_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kpi_records (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    description character varying(255),
    metric_name character varying(255) NOT NULL,
    metric_value numeric(38,2) NOT NULL,
    record_date date NOT NULL
);


--
-- Name: login_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_attempts (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    email character varying(255) NOT NULL,
    failure_reason character varying(255),
    ip_address character varying(255) NOT NULL,
    success boolean NOT NULL
);


--
-- Name: mfa_otps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mfa_otps (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    code_hash character varying(255) NOT NULL,
    expiry_date timestamp(6) with time zone NOT NULL,
    mfa_token character varying(255) NOT NULL,
    used boolean NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    message text NOT NULL,
    read boolean NOT NULL,
    related_id character varying(255),
    title character varying(255) NOT NULL,
    type character varying(255),
    user_id uuid NOT NULL
);


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    applied_tax_code character varying(255),
    applied_tax_name character varying(255),
    applied_tax_rate numeric(38,2),
    line_cost numeric(38,2),
    line_tax_amount numeric(38,2),
    line_total_including_tax numeric(38,2),
    quantity integer NOT NULL,
    sub_total numeric(38,2) NOT NULL,
    unit_cost numeric(38,2),
    unit_price numeric(38,2) NOT NULL,
    unit_price_including_tax numeric(38,2),
    unit_tax_amount numeric(38,2),
    order_id uuid NOT NULL,
    product_id uuid NOT NULL
);


--
-- Name: order_tracking_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_tracking_events (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    note text,
    status character varying(255) NOT NULL,
    order_id uuid NOT NULL,
    CONSTRAINT order_tracking_events_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'CREATED'::character varying, 'PAID'::character varying, 'PROCESSING'::character varying, 'SHIPPED'::character varying, 'DELIVERED'::character varying, 'CANCELLED'::character varying, 'RETURN_REQUESTED'::character varying, 'RETURNED'::character varying, 'REFUNDED'::character varying])::text[])))
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    billing_address character varying(255),
    coupon_code character varying(255),
    delivery_instructions character varying(1000),
    delivery_phone_number character varying(255),
    discount_amount numeric(38,2),
    order_channel character varying(255) NOT NULL,
    order_number character varying(255) NOT NULL,
    payment_method character varying(255),
    payment_reference character varying(255),
    shipping_address character varying(255) NOT NULL,
    shipping_cell character varying(255),
    shipping_district character varying(255),
    shipping_province character varying(255),
    shipping_sector character varying(255),
    shipping_village character varying(255),
    status character varying(255) NOT NULL,
    sub_total_amount numeric(38,2),
    tax_amount numeric(38,2),
    tax_rate numeric(38,2),
    total_amount numeric(38,2) NOT NULL,
    cashier_id uuid,
    customer_id uuid,
    shipping_address_id uuid,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'CREATED'::character varying, 'PAID'::character varying, 'PROCESSING'::character varying, 'SHIPPED'::character varying, 'DELIVERED'::character varying, 'CANCELLED'::character varying, 'RETURN_REQUESTED'::character varying, 'RETURNED'::character varying, 'REFUNDED'::character varying])::text[])))
);


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    expiry_date timestamp(6) with time zone NOT NULL,
    token character varying(255) NOT NULL,
    used boolean NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_transactions (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    amount numeric(38,2) NOT NULL,
    payment_reference character varying(255),
    provider character varying(255) NOT NULL,
    reconciled_at timestamp(6) without time zone,
    reconciliation_notes text,
    reconciliation_status character varying(255),
    status character varying(255) NOT NULL,
    transaction_type character varying(255) NOT NULL,
    order_id uuid NOT NULL
);


--
-- Name: procurement_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.procurement_orders (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    expected_delivery_date date,
    quantity_ordered integer NOT NULL,
    quantity_received integer,
    status character varying(255) NOT NULL,
    total_cost numeric(38,2),
    unit_cost numeric(38,2),
    inventory_item_id uuid NOT NULL,
    product_id uuid,
    supplier_id uuid NOT NULL
);


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_images (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    alt_text character varying(255) NOT NULL,
    is_primary boolean NOT NULL,
    url character varying(255) NOT NULL,
    product_id uuid NOT NULL
);


--
-- Name: product_reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_reviews (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    comment text,
    rating integer NOT NULL,
    verified_purchase boolean NOT NULL,
    product_id uuid NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    average_rating numeric(3,2),
    cost_price numeric(38,2),
    description text,
    featured boolean NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(38,2) NOT NULL,
    sku character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    category_id uuid,
    discount_id uuid,
    inventory_item_id uuid,
    tax_rate_id uuid,
    CONSTRAINT products_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DRAFT'::character varying, 'ARCHIVED'::character varying])::text[])))
);


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provinces (
    id uuid NOT NULL,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refresh_tokens (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    expiry_date timestamp(6) with time zone NOT NULL,
    revoked boolean NOT NULL,
    token character varying(255) NOT NULL,
    user_id uuid
);


--
-- Name: return_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.return_requests (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    admin_notes character varying(255),
    approved_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone,
    reason character varying(255) NOT NULL,
    refund_provider character varying(255),
    refund_reference character varying(255),
    refund_requested_at timestamp(6) without time zone,
    refund_status character varying(255),
    refunded_amount numeric(38,2),
    requested_amount numeric(38,2),
    status character varying(255) NOT NULL,
    order_id uuid NOT NULL
);


--
-- Name: revenues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revenues (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    amount numeric(38,2) NOT NULL,
    reference_id character varying(255),
    revenue_date date NOT NULL,
    source character varying(255) NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    description character varying(255),
    name character varying(255) NOT NULL
);


--
-- Name: sales_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_reports (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    active_customers integer NOT NULL,
    report_date date NOT NULL,
    report_period character varying(255),
    total_orders integer NOT NULL,
    total_revenue numeric(38,2) NOT NULL
);


--
-- Name: satisfaction_surveys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.satisfaction_surveys (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    feedback text,
    rating integer NOT NULL,
    ticket_id uuid NOT NULL
);


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sectors (
    id uuid NOT NULL,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
    district_id uuid NOT NULL
);


--
-- Name: security_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.security_settings (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    lockout_duration_minutes integer NOT NULL,
    max_failed_login_attempts integer NOT NULL,
    mfa_required boolean NOT NULL,
    password_min_length integer NOT NULL,
    password_require_digit boolean NOT NULL,
    password_require_lowercase boolean NOT NULL,
    password_require_special_character boolean NOT NULL,
    password_require_uppercase boolean NOT NULL,
    session_timeout_minutes integer NOT NULL
);


--
-- Name: shipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipments (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    actual_delivery_date timestamp(6) without time zone,
    carrier character varying(255) NOT NULL,
    estimated_delivery_date timestamp(6) without time zone,
    status character varying(255) NOT NULL,
    tracking_number character varying(255) NOT NULL,
    order_id uuid NOT NULL
);


--
-- Name: stock_movements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_movements (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    quantity integer NOT NULL,
    reason character varying(255),
    reference_id character varying(255),
    type character varying(255) NOT NULL,
    inventory_item_id uuid NOT NULL
);


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.suppliers (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    active boolean NOT NULL,
    address character varying(255),
    contact_email character varying(255) NOT NULL,
    contact_phone character varying(255),
    name character varying(255) NOT NULL,
    notes text,
    performance_rating double precision
);


--
-- Name: support_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.support_messages (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    message text NOT NULL,
    sender_id uuid NOT NULL,
    ticket_id uuid NOT NULL
);


--
-- Name: support_tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.support_tickets (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    description text NOT NULL,
    priority character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    assigned_agent_id uuid,
    customer_id uuid NOT NULL
);


--
-- Name: system_backups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.system_backups (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    completed_at timestamp(6) without time zone,
    file_path character varying(255) NOT NULL,
    message character varying(255),
    name character varying(255) NOT NULL,
    restored_at timestamp(6) without time zone,
    size_bytes bigint NOT NULL,
    status character varying(255) NOT NULL
);


--
-- Name: system_configurations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.system_configurations (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    category character varying(255),
    config_key character varying(255) NOT NULL,
    config_value text,
    description character varying(255),
    sensitive boolean NOT NULL
);


--
-- Name: tax_rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_rates (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    active boolean NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(500),
    name character varying(255) NOT NULL,
    rate numeric(5,4) NOT NULL
);


--
-- Name: tax_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_records (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    amount numeric(38,2) NOT NULL,
    filing_date date NOT NULL,
    order_id uuid,
    order_number character varying(255),
    reference_id character varying(255),
    status character varying(255),
    tax_date date,
    tax_rate numeric(38,2),
    tax_type character varying(255) NOT NULL,
    taxable_amount numeric(38,2)
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    address character varying(255),
    email character varying(255) NOT NULL,
    email_verified boolean NOT NULL,
    enabled boolean NOT NULL,
    first_name character varying(255) NOT NULL,
    force_password_change boolean NOT NULL,
    last_login_date timestamp(6) without time zone,
    last_name character varying(255) NOT NULL,
    locked boolean NOT NULL,
    password character varying(255),
    phone_number character varying(255)
);


--
-- Name: villages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.villages (
    id uuid NOT NULL,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
    cell_id uuid NOT NULL
);


--
-- Name: wishlist_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlist_items (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone,
    created_by character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(255),
    product_id uuid NOT NULL,
    user_id uuid NOT NULL
);


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audit_logs (id, created_at, created_by, updated_at, updated_by, action, details, ip_address, resource, status, "timestamp", user_email) FROM stdin;
4c9f8f03-9ffb-4da4-8fd2-081bc63078a7	2026-07-14 18:09:48.122193	\N	2026-07-14 18:09:48.122795	\N	GET	status=500, durationMs=802, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/cart	FAILURE	2026-07-14 18:09:48.10447	ishimwedivin2@gmail.com
192cc1d4-2431-4e05-a2a3-7d70f3216e19	2026-07-14 18:09:48.439384	\N	2026-07-14 18:09:48.439384	\N	GET	status=200, durationMs=231, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/dashboard/kpis	SUCCESS	2026-07-14 18:09:48.438568	ishimwedivin2@gmail.com
f3cb5b1f-96e7-4bac-b893-341192f1a114	2026-07-14 18:10:44.731696	\N	2026-07-14 18:10:44.731696	\N	GET	status=200, durationMs=198, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/products/discounts	SUCCESS	2026-07-14 18:10:44.717705	ishimwedivin2@gmail.com
e8d8c37d-562e-4f5a-8cb9-7bc56b6d0dd2	2026-07-14 18:11:28.396108	\N	2026-07-14 18:11:28.396108	\N	GET	status=200, durationMs=222, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/wishlist	SUCCESS	2026-07-14 18:11:28.378001	ishimwedivin2@gmail.com
fd52e26f-8077-4a8d-926b-3b88b27d8653	2026-07-14 18:11:28.556014	\N	2026-07-14 18:11:28.556014	\N	GET	status=200, durationMs=69, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/support/tickets	SUCCESS	2026-07-14 18:11:28.547299	ishimwedivin2@gmail.com
8619d966-f198-4b92-a575-856ab172c85c	2026-07-14 18:11:28.907444	\N	2026-07-14 18:11:28.907444	\N	GET	status=200, durationMs=260, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/customers	SUCCESS	2026-07-14 18:11:28.906854	ishimwedivin2@gmail.com
337addab-596c-420e-a369-73a7c2f190ae	2026-07-14 18:09:48.122193	\N	2026-07-14 18:09:48.122193	\N	GET	status=200, durationMs=802, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/returns	SUCCESS	2026-07-14 18:09:48.10447	ishimwedivin2@gmail.com
9cb81e96-5556-4c19-b4d8-f04725a4b5b3	2026-07-14 18:09:48.391775	\N	2026-07-14 18:09:48.391775	\N	GET	status=200, durationMs=133, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/support	SUCCESS	2026-07-14 18:09:48.383749	ishimwedivin2@gmail.com
1bf7973a-c679-4871-8063-1f42c6f2193c	2026-07-14 18:10:45.173063	\N	2026-07-14 18:10:45.173063	\N	GET	status=200, durationMs=649, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/products/search	SUCCESS	2026-07-14 18:10:45.162993	ishimwedivin2@gmail.com
f812634c-3b7b-4ce7-a06f-98ff13d9342a	2026-07-14 18:11:28.397471	\N	2026-07-14 18:11:28.397471	\N	GET	status=200, durationMs=222, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/inventory/low-stock	SUCCESS	2026-07-14 18:11:28.378001	ishimwedivin2@gmail.com
a23b46db-5fda-4494-9ff8-6ff86f7a00b4	2026-07-14 18:11:38.267501	\N	2026-07-14 18:11:38.267501	\N	GET	status=500, durationMs=32, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/orders	FAILURE	2026-07-14 18:11:38.267501	ishimwedivin2@gmail.com
178c7f6b-41e1-4b91-8bc2-63cfb246612b	2026-07-14 18:09:48.122193	\N	2026-07-14 18:09:48.122193	\N	GET	status=200, durationMs=802, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/inventory/low-stock	SUCCESS	2026-07-14 18:09:48.10447	ishimwedivin2@gmail.com
39aecd99-d0f6-4a45-94ef-6dc6571c2043	2026-07-14 18:09:48.310437	\N	2026-07-14 18:09:48.310437	\N	GET	status=200, durationMs=89, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/revenue/monthly	SUCCESS	2026-07-14 18:09:48.310437	ishimwedivin2@gmail.com
5af797b1-fe1e-4264-9669-4efc387d20da	2026-07-14 18:09:48.400428	\N	2026-07-14 18:09:48.400428	\N	GET	status=200, durationMs=57, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/revenue	SUCCESS	2026-07-14 18:09:48.394764	ishimwedivin2@gmail.com
aeede221-cc9b-44e2-a822-db2632c4663e	2026-07-14 18:10:52.355723	\N	2026-07-14 18:10:52.355723	\N	GET	status=200, durationMs=30, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/finance/tax-rates	SUCCESS	2026-07-14 18:10:52.353695	ishimwedivin2@gmail.com
b6e983e8-36de-4129-9414-ba24c441b3ea	2026-07-14 18:11:28.546125	\N	2026-07-14 18:11:28.546125	\N	GET	status=500, durationMs=389, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/cart	FAILURE	2026-07-14 18:11:28.544979	ishimwedivin2@gmail.com
f5bcd0a2-3f0c-48f3-abfa-a3f42ece9d13	2026-07-14 18:11:28.994876	\N	2026-07-14 18:11:28.994876	\N	GET	status=200, durationMs=516, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/dashboard/kpis	SUCCESS	2026-07-14 18:11:28.988119	ishimwedivin2@gmail.com
368451a1-cd83-4c85-be8d-f48356ec9ae0	2026-07-14 18:11:41.842202	\N	2026-07-14 18:11:41.842202	\N	getBackups	\N	0:0:0:0:0:0:0:1	com.luztechnology.admin.controller.AdminController	SUCCESS	2026-07-14 18:11:41.841206	ishimwedivin2@gmail.com
76f958f9-4036-4632-a5fd-4742d65195d8	2026-07-14 18:11:41.846109	\N	2026-07-14 18:11:41.846109	\N	GET	status=200, durationMs=83, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/admin/backups	SUCCESS	2026-07-14 18:11:41.844617	ishimwedivin2@gmail.com
ec8b1fe3-f271-4699-9d81-41bc8122b03a	2026-07-14 18:09:48.122193	\N	2026-07-14 18:09:48.122193	\N	GET	status=200, durationMs=802, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/notifications/unread-count	SUCCESS	2026-07-14 18:09:48.10447	ishimwedivin2@gmail.com
46b535b9-792e-410b-a650-518d0e64dbc2	2026-07-14 18:09:48.385833	\N	2026-07-14 18:09:48.385833	\N	GET	status=200, durationMs=179, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/customers	SUCCESS	2026-07-14 18:09:48.384607	ishimwedivin2@gmail.com
f2d10c29-9f02-42ed-bc85-5dcf28b0c42d	2026-07-14 18:10:45.036316	\N	2026-07-14 18:10:45.036316	\N	GET	status=200, durationMs=525, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/categories	SUCCESS	2026-07-14 18:10:45.036317	ishimwedivin2@gmail.com
83a5e388-27c3-490e-b397-75d028953d55	2026-07-14 18:11:28.397471	\N	2026-07-14 18:11:28.397471	\N	GET	status=200, durationMs=222, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/notifications/unread-count	SUCCESS	2026-07-14 18:11:28.378001	ishimwedivin2@gmail.com
4926f609-9e72-42aa-9cf1-8c026f80a2ea	2026-07-14 18:11:28.620505	\N	2026-07-14 18:11:28.620505	\N	GET	status=200, durationMs=119, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/revenue	SUCCESS	2026-07-14 18:11:28.612667	ishimwedivin2@gmail.com
425c3b68-8a1f-44fa-946c-e74cb49d1b52	2026-07-14 18:11:28.994876	\N	2026-07-14 18:11:28.994876	\N	GET	status=200, durationMs=299, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/dashboard/kpis	SUCCESS	2026-07-14 18:11:28.988775	ishimwedivin2@gmail.com
a182d6d1-2147-485d-a6dd-674cd2a94955	2026-07-14 18:11:35.967099	\N	2026-07-14 18:11:35.967099	\N	GET	status=200, durationMs=103, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/admin/email-templates	SUCCESS	2026-07-14 18:11:35.9671	ishimwedivin2@gmail.com
509f444a-f62d-4a9e-93ca-907f213c8fa5	2026-07-14 18:11:41.863578	\N	2026-07-14 18:11:41.863578	\N	getSystemHealth	\N	0:0:0:0:0:0:0:1	com.luztechnology.admin.controller.AdminController	SUCCESS	2026-07-14 18:11:41.862997	ishimwedivin2@gmail.com
dbd1403c-2f86-4f3d-82f9-93956bd39b32	2026-07-14 18:11:41.879123	\N	2026-07-14 18:11:41.879123	\N	GET	status=200, durationMs=120, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/admin/system/health	SUCCESS	2026-07-14 18:11:41.878602	ishimwedivin2@gmail.com
bc17abe7-12e2-4159-bb37-7ca59dcdd5c5	2026-07-14 18:09:48.122795	\N	2026-07-14 18:09:48.122795	\N	GET	status=200, durationMs=802, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/wishlist	SUCCESS	2026-07-14 18:09:48.10447	ishimwedivin2@gmail.com
81c37aa7-44b6-467c-ab8f-838f6fadfdb4	2026-07-14 18:09:48.186103	\N	2026-07-14 18:09:48.186103	\N	GET	status=500, durationMs=898, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/orders	FAILURE	2026-07-14 18:09:48.186103	ishimwedivin2@gmail.com
9f4c97fb-fbf7-49ef-95fa-4d2d7ec18383	2026-07-14 18:09:48.286667	\N	2026-07-14 18:09:48.286667	\N	GET	status=200, durationMs=56, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/support/tickets	SUCCESS	2026-07-14 18:09:48.284656	ishimwedivin2@gmail.com
93e01019-2ec8-440d-ba96-77448f870ff6	2026-07-14 18:09:48.419747	\N	2026-07-14 18:09:48.419747	\N	GET	status=200, durationMs=67, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/inventory	SUCCESS	2026-07-14 18:09:48.41778	ishimwedivin2@gmail.com
e9767604-a02b-4596-b0c0-a424bf9845c0	2026-07-14 18:09:48.440265	\N	2026-07-14 18:09:48.440265	\N	GET	status=200, durationMs=216, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/dashboard/kpis	SUCCESS	2026-07-14 18:09:48.4365	ishimwedivin2@gmail.com
65fbc242-3d2e-4cc9-b02c-18a4a08a22c8	2026-07-14 18:10:44.778679	\N	2026-07-14 18:10:44.778679	\N	GET	status=200, durationMs=275, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/finance/tax-rates	SUCCESS	2026-07-14 18:10:44.772737	ishimwedivin2@gmail.com
269ebb74-5c95-455f-a3ad-3871f1111f21	2026-07-14 18:10:52.39417	\N	2026-07-14 18:10:52.39417	\N	GET	status=200, durationMs=60, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/categories	SUCCESS	2026-07-14 18:10:52.382751	ishimwedivin2@gmail.com
7420d1ad-14c4-4cbc-8533-838203e68144	2026-07-14 18:11:28.396108	\N	2026-07-14 18:11:28.396108	\N	GET	status=200, durationMs=222, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/returns	SUCCESS	2026-07-14 18:11:28.378001	ishimwedivin2@gmail.com
769d2d45-821b-4574-a5b9-e6ab69f603d2	2026-07-14 18:11:28.546125	\N	2026-07-14 18:11:28.546125	\N	GET	status=500, durationMs=390, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/orders	FAILURE	2026-07-14 18:11:28.545581	ishimwedivin2@gmail.com
61be5c25-b2b4-4884-b946-eec81d694240	2026-07-14 18:11:28.623929	\N	2026-07-14 18:11:28.623929	\N	GET	status=200, durationMs=101, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/revenue/monthly	SUCCESS	2026-07-14 18:11:28.609796	ishimwedivin2@gmail.com
d1a646ed-c296-45bb-a70a-03fef6f6daee	2026-07-14 18:11:28.85763	\N	2026-07-14 18:11:28.85763	\N	GET	status=200, durationMs=124, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/inventory	SUCCESS	2026-07-14 18:11:28.846983	ishimwedivin2@gmail.com
e60b8781-8aba-4478-863d-16bb311ed42a	2026-07-14 18:11:28.943756	\N	2026-07-14 18:11:28.943756	\N	GET	status=200, durationMs=67, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/analytics/support	SUCCESS	2026-07-14 18:11:28.939331	ishimwedivin2@gmail.com
85d876b6-6ffd-434f-afff-59d8f81e1793	2026-07-14 18:11:35.780744	\N	2026-07-14 18:11:35.780744	\N	getAllOrders	\N	0:0:0:0:0:0:0:1	com.luztechnology.order.controller.OrderController	SUCCESS	2026-07-14 18:11:35.780745	ishimwedivin2@gmail.com
02d1e159-3c44-4acf-919a-a233d1c6ad02	2026-07-14 18:11:35.794882	\N	2026-07-14 18:11:35.794882	\N	GET	status=200, durationMs=211, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/orders	SUCCESS	2026-07-14 18:11:35.794882	ishimwedivin2@gmail.com
924a0b18-5b28-4dc3-b730-36b40c365dc8	2026-07-14 18:11:38.267501	\N	2026-07-14 18:11:38.267501	\N	GET	status=500, durationMs=31, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/orders	FAILURE	2026-07-14 18:11:38.267501	ishimwedivin2@gmail.com
7c2df9bd-2e9e-42d1-ad2c-ccf87de3764a	2026-07-14 18:11:41.857524	\N	2026-07-14 18:11:41.857892	\N	GET	status=200, durationMs=86, userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	0:0:0:0:0:0:0:1	/api/admin/configurations	SUCCESS	2026-07-14 18:11:41.845626	ishimwedivin2@gmail.com
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.banners (id, created_at, created_by, updated_at, updated_by, active, button_text, display_order, image_url, link_url, product_id, subtitle, tag_label, title) FROM stdin;
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cart_items (id, created_at, created_by, updated_at, updated_by, quantity, cart_id, product_id) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts (id, created_at, created_by, updated_at, updated_by, user_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, created_at, created_by, updated_at, updated_by, description, name, parent_id) FROM stdin;
272fb51c-3f30-4d73-a445-c7b04ef8d4eb	2026-07-14 18:08:49.820976	\N	2026-07-14 18:08:49.820976	\N	Routers, switches, access points and network equipment	Networking	\N
41eb975c-fc70-42ee-bdb9-f281f10bd3b1	2026-07-14 18:08:49.820976	\N	2026-07-14 18:08:49.820976	\N	Notebooks and portable computers	Laptops	\N
7197ecb2-e637-47c4-aa15-4cc59b39afce	2026-07-14 18:08:49.820976	\N	2026-07-14 18:08:49.820976	\N	Desktop computers and all-in-one systems	Desktops & PCs	\N
3d62d3dc-590d-4af6-bd6b-8ebf5f7ff2f4	2026-07-14 18:08:49.83676	\N	2026-07-14 18:08:49.83676	\N	Computer monitors and display screens	Monitors	\N
3eadc5f1-5b65-4d94-a837-a69a633d6bec	2026-07-14 18:08:49.83676	\N	2026-07-14 18:08:49.83676	\N	Printers, scanners and multifunction devices	Printers & Scanners	\N
7a870b97-6212-4edd-8cde-1f01a0ffba9b	2026-07-14 18:08:49.84372	\N	2026-07-14 18:08:49.84372	\N	Hard drives, SSDs and external storage	Storage	\N
12c2a327-c42a-4609-8dcd-cc13404c3b91	2026-07-14 18:08:49.852694	\N	2026-07-14 18:08:49.852694	\N	CPUs, RAM, GPUs and PC components	Components	\N
aa2b4700-008d-4721-912c-ce333b775952	2026-07-14 18:08:49.852694	\N	2026-07-14 18:08:49.852694	\N	Keyboards, mice, headsets and peripherals	Accessories	\N
8efcd2d1-d0c8-49e0-a5d4-35da8e1ef1df	2026-07-14 18:08:49.852694	\N	2026-07-14 18:08:49.852694	\N	Server hardware and rack equipment	Servers	\N
aeb10164-f921-40cb-870c-e2e4cf294b99	2026-07-14 18:08:49.852694	\N	2026-07-14 18:08:49.852694	\N	Smart devices, cameras and IoT equipment	Smart Home & IoT	\N
\.


--
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cells (id, enabled, name, sector_id) FROM stdin;
6759e184-d434-4c83-8043-cd2b2c6fb8b3	t	Kinyaga	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
81909b62-f2b4-4136-8475-15dbdeabd020	t	Musave	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
85fbdbd6-20e0-4c54-af66-60adac60c92d	t	Mvuzo	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
ddf6579c-855c-4bc2-974a-2d09e7a3a5ad	t	Ngara	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
aa5f71b7-f9b5-4eb8-b9f5-d6f87152fa98	t	Nkuzuzu	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7	t	Nyabikenke	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
9435deff-6922-47a2-b7c7-d5e4b0c3501e	t	Nyagasozi	c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e
fe3ed661-5e9b-4d18-8d38-fb59bce00443	t	Karuruma	7fd9760e-c470-4a0a-b1cf-f678b053d0e5
afe0af55-e1e5-4b6d-86a2-9874dc95ed03	t	Nyamabuye	7fd9760e-c470-4a0a-b1cf-f678b053d0e5
0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da	t	Nyamugari	7fd9760e-c470-4a0a-b1cf-f678b053d0e5
6efe4f9f-643e-42e4-b7af-238cafac4a7c	t	Gasagara	94dc0784-2fb8-4cf8-825c-138afe08517d
deb83c82-2496-4236-be11-ceafa977749d	t	Gicaca	94dc0784-2fb8-4cf8-825c-138afe08517d
0dc92e40-6ec2-45c4-9654-630ce33e034d	t	Kibara	94dc0784-2fb8-4cf8-825c-138afe08517d
c0bb5133-a728-47fa-89d6-e2b776205baf	t	Munini	94dc0784-2fb8-4cf8-825c-138afe08517d
25d22e52-ea37-43dd-baeb-21c6b8523888	t	Murambi	94dc0784-2fb8-4cf8-825c-138afe08517d
7b844444-a2d1-49a9-9183-eafe2ceae406	t	Musezero	be06a851-7692-475d-8344-31cc21c79951
7a64eee5-9359-4652-98ef-db2a901c2a49	t	Ruhango	be06a851-7692-475d-8344-31cc21c79951
d4aeb524-59f4-4db5-8b05-a523e4ce74f4	t	Akamatamu	bc21f93b-e3c4-45b9-b75f-a88b547c3bab
a2e90909-fcea-47e4-b00a-5a90c1f80f7d	t	Bweramvura	bc21f93b-e3c4-45b9-b75f-a88b547c3bab
dff1710d-664e-462d-a634-34fdd4061c0f	t	Kabuye	bc21f93b-e3c4-45b9-b75f-a88b547c3bab
95432bf5-a6a0-4dec-ad5d-f72f11d79e29	t	Kidashya	bc21f93b-e3c4-45b9-b75f-a88b547c3bab
0edc5c63-2ce9-413a-b594-b1cfdb3dc795	t	Ngiryi	bc21f93b-e3c4-45b9-b75f-a88b547c3bab
8109bd4a-5a35-424c-9084-596af7295c64	t	Agateko	50a93f43-f428-460e-938d-a59451846a48
db837d38-0545-4cd1-ac2c-02e5d887767a	t	Buhiza	50a93f43-f428-460e-938d-a59451846a48
da0bc312-b7c8-43b1-97c2-7c819eec6ad8	t	Muko	50a93f43-f428-460e-938d-a59451846a48
dea4ca75-7e3a-48e4-8a90-e5034020f625	t	Nkusi	50a93f43-f428-460e-938d-a59451846a48
112185d1-abcf-4201-9fa5-d66173cf6507	t	Nyabuliba	50a93f43-f428-460e-938d-a59451846a48
2fe92806-f904-4a6e-954a-b51069523604	t	Nyakabungo	50a93f43-f428-460e-938d-a59451846a48
d0c3087a-310b-4758-8149-4778135ae5c4	t	Nyamitanga	50a93f43-f428-460e-938d-a59451846a48
7ae3b7b7-50b0-450e-b808-37beb9714c47	t	Kamatamu	41114943-a4e3-4ac8-b65b-eaccc192fb47
3066f588-da13-4cc5-b233-4869caab03b3	t	Kamutwa	41114943-a4e3-4ac8-b65b-eaccc192fb47
df9b10af-ae70-45c7-b368-5f853699e909	t	Kibaza	41114943-a4e3-4ac8-b65b-eaccc192fb47
416b7934-2083-4019-b11c-5db6030bd89a	t	Kamukina	79c23033-66e8-4611-9c98-50fda178a30f
1aaf0262-a7fb-48f7-b7d9-544a4e620cf5	t	Kimihurura	79c23033-66e8-4611-9c98-50fda178a30f
de5e86c0-9b0d-4949-8a08-14e373b76a52	t	Rugando	79c23033-66e8-4611-9c98-50fda178a30f
a1e88071-9d4e-4dbc-9200-5f7c9898387d	t	Bibare	5c9c02c9-cc0b-47c8-86f2-b9df1070c5d5
10bb9683-1653-4956-857d-c498acb80005	t	Kibagabaga	5c9c02c9-cc0b-47c8-86f2-b9df1070c5d5
16fbe457-0661-457c-98f1-d72ab9b1c03a	t	Nyagatovu	5c9c02c9-cc0b-47c8-86f2-b9df1070c5d5
b2b2649d-b7ea-4985-a598-7bf1fac36d16	t	Gacuriro	363e01ca-da5e-4657-a4a3-57ab71118396
acfbeedf-3adb-497f-95ba-fdeb979f6f47	t	Gasharu	363e01ca-da5e-4657-a4a3-57ab71118396
16132b92-fa4e-4764-802e-315f7dbafec9	t	Kagugu	363e01ca-da5e-4657-a4a3-57ab71118396
e5db1a8c-5874-49ac-91f4-c7dd302a691f	t	Murama	363e01ca-da5e-4657-a4a3-57ab71118396
39849947-31d8-4972-856d-2ad020ddca55	t	Bwiza	e982d12a-e873-4e36-991c-0dddf6e3374f
fe1d6a72-6852-4e14-b5d4-81863715891f	t	Cyaruzinge	e982d12a-e873-4e36-991c-0dddf6e3374f
9f915fa1-b418-47c9-bf19-ba60140c1ea8	t	Kibenga	e982d12a-e873-4e36-991c-0dddf6e3374f
12820992-f140-4fc5-af35-7bd5524238b6	t	Masoro	e982d12a-e873-4e36-991c-0dddf6e3374f
bcee783b-773a-492f-98cb-c1826a4a5288	t	Mukuyu	e982d12a-e873-4e36-991c-0dddf6e3374f
cad56407-add8-46b1-938d-0beb8e4ee6b7	t	Rudashya	e982d12a-e873-4e36-991c-0dddf6e3374f
d81a81e1-747c-4418-997c-cf8873cd43b7	t	Butare	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178	t	Gasanze	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
89be6674-f1e9-45c4-8bf1-16a63aea40b7	t	Gasura	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
33cf975e-c1cd-4d42-9214-2ccb28f80ee0	t	Gatunga	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
c21ee15d-ac58-4d70-840e-6dab526a384f	t	Muremure	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
5016cb46-c0da-42e5-b790-c3034c674bf7	t	Sha	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
5b64dc88-5551-4536-a3b9-634fe9e0dce3	t	Shango	09f67c22-bcf0-453f-b4d0-a2f697d9a5d8
9b740834-26b3-4ed8-a952-17351a59db15	t	Nyabisindu	4172bf67-72a5-4133-ab2f-2e01c2846eeb
63ff094b-3d6c-409c-9f96-5cc1ab4054e8	t	Nyarutarama	4172bf67-72a5-4133-ab2f-2e01c2846eeb
761abb54-4b4e-4f30-ae09-24a2f4646c2e	t	Rukiri I	4172bf67-72a5-4133-ab2f-2e01c2846eeb
c2b57c5f-7989-4e23-a772-2574a2efcaa5	t	Rukiri II	4172bf67-72a5-4133-ab2f-2e01c2846eeb
ef6332ef-4500-4804-885e-817bd7c6952e	t	Bisenga	a47e6718-4042-47c0-8d4a-6c3359072fa3
225bedb8-bfd4-46ff-8859-1ed7a39ab987	t	Gasagara	a47e6718-4042-47c0-8d4a-6c3359072fa3
18214639-095e-4b05-9b81-e76f64fc9123	t	Kabuga I	a47e6718-4042-47c0-8d4a-6c3359072fa3
070e2064-d913-4052-a84f-a6001d9e26fd	t	Kabuga II	a47e6718-4042-47c0-8d4a-6c3359072fa3
c31b54ac-5689-41a5-9297-d15ced8ae618	t	Kinyana	a47e6718-4042-47c0-8d4a-6c3359072fa3
46c11105-6b4d-4970-8d62-ba9e6cf54a69	t	Mbandazi	a47e6718-4042-47c0-8d4a-6c3359072fa3
d691907c-173a-43bf-a4dc-16d3662278a6	t	Nyagahinga	a47e6718-4042-47c0-8d4a-6c3359072fa3
6fab92d7-8ae9-4ae8-acea-f465a37a6981	t	Ruhanga	a47e6718-4042-47c0-8d4a-6c3359072fa3
721b1e90-ec70-4e5f-9d44-3ffd72df1272	t	Gasabo	3d050ca7-973e-464b-81fa-194194f0581b
9e43e4a8-5d11-416f-867a-2327e3d2ccf3	t	Indatemwa	3d050ca7-973e-464b-81fa-194194f0581b
745b47ae-7f3d-4196-bdf7-bd44ed5d1480	t	Kabaliza	3d050ca7-973e-464b-81fa-194194f0581b
c7af1a7b-0d0b-49cf-9e59-04380e8a1625	t	Kacyatwa	3d050ca7-973e-464b-81fa-194194f0581b
3503e128-81d1-49e3-a606-b19ca811aa24	t	Kibenga	3d050ca7-973e-464b-81fa-194194f0581b
48b9052b-a0c2-4622-b0ac-4941bb0316aa	t	Kigabiro	3d050ca7-973e-464b-81fa-194194f0581b
5111b16a-1d8b-4f61-ac3d-fad22d79e4b8	t	Gahanga	9231ba6c-0456-492a-949c-b40040f8d28f
9d4abea4-7850-40e9-a04d-11806341fb5a	t	Kagasa	9231ba6c-0456-492a-949c-b40040f8d28f
834fac3a-68cd-4861-b685-32c5789b0eaa	t	Karembure	9231ba6c-0456-492a-949c-b40040f8d28f
1913a49d-3258-4d3f-ab98-197c46962e1a	t	Murinja	9231ba6c-0456-492a-949c-b40040f8d28f
ece5314d-d371-4696-b070-b8c14ccc1f9d	t	Nunga	9231ba6c-0456-492a-949c-b40040f8d28f
c7d0004b-cf73-4aca-90b1-4b92ea8c964f	t	Rwabutenge	9231ba6c-0456-492a-949c-b40040f8d28f
25dda704-2d18-4de0-8a10-48cf64dd2619	t	Gatenga	7d0ca2ef-96b4-4e27-abe7-a0083b0f4279
bac895f1-e234-4c2a-9bc3-9cb6238aa203	t	Karambo	7d0ca2ef-96b4-4e27-abe7-a0083b0f4279
ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79	t	Nyanza	7d0ca2ef-96b4-4e27-abe7-a0083b0f4279
c4932dbf-f249-4805-87e4-90b916443139	t	Nyarurama	7d0ca2ef-96b4-4e27-abe7-a0083b0f4279
c6a7032a-c783-4f78-8528-0eb994cf8714	t	Kagunga	742d4dfc-52c7-4818-8798-b10a701b4683
f1c6078b-2004-4c7a-8764-68d2a40db1cd	t	Kanserege	742d4dfc-52c7-4818-8798-b10a701b4683
a5800276-f729-46bd-b830-6c9f32ba0472	t	Kinunga	742d4dfc-52c7-4818-8798-b10a701b4683
8b4940b6-0bcd-44e9-8fa9-acbd544b6a46	t	Kanserege	cb06f579-054e-4f2a-8882-2960581f7d2b
1c4ea082-386f-4c68-95ea-1f89ebbc95e3	t	Muyange	cb06f579-054e-4f2a-8882-2960581f7d2b
97b86bc1-da69-4b6d-a2c5-22cd1da0604b	t	Rukatsa	cb06f579-054e-4f2a-8882-2960581f7d2b
60afba48-cc47-433a-86e0-4355137af6ca	t	Busanza	a4b7d335-d039-4812-94b5-8d2089d50c78
068bed37-0668-412b-9368-1a050e4b0dea	t	Kabeza	a4b7d335-d039-4812-94b5-8d2089d50c78
2b02dcb0-b0ff-4f4d-bc33-69ed9920f291	t	Karama	a4b7d335-d039-4812-94b5-8d2089d50c78
203b64e1-78ec-4ecd-b425-aa64b133fed0	t	Rubirizi	a4b7d335-d039-4812-94b5-8d2089d50c78
6c7853d4-8543-41f9-9c78-f3a58b9cf802	t	Gasharu	8c790f45-c6a5-4ed3-863b-136640d8507a
29a87583-acb7-4057-9fd6-f0afea7a68c1	t	Kagina	8c790f45-c6a5-4ed3-863b-136640d8507a
dfb56bac-533a-430f-ae2e-b6d65ef9c75d	t	Kicukiro	8c790f45-c6a5-4ed3-863b-136640d8507a
ed8d0204-e3f6-477d-b7da-84e686048e1d	t	Ngoma	8c790f45-c6a5-4ed3-863b-136640d8507a
67997263-a6d4-4c97-a001-c09c827bcfd2	t	Bwerankori	a60bdb67-7f24-490c-be58-4b2bfb7ebbab
2811c4a6-cd71-43f4-943e-30973b115c29	t	Karugira	a60bdb67-7f24-490c-be58-4b2bfb7ebbab
513509b5-5eb7-4521-bb6c-65b60dc22834	t	Kigarama	a60bdb67-7f24-490c-be58-4b2bfb7ebbab
3d6b88fb-b979-46ca-8efa-220a95e2a3a6	t	Nyarurama	a60bdb67-7f24-490c-be58-4b2bfb7ebbab
69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a	t	Rwampara	a60bdb67-7f24-490c-be58-4b2bfb7ebbab
b7c68b21-4c82-4578-9c7a-19e766b8ed47	t	Ayabaraya	2eedcbc7-a7b4-489c-b235-87247c721e0d
32951129-bb87-403c-b6d1-97a43ba06ea2	t	Cyimo	2eedcbc7-a7b4-489c-b235-87247c721e0d
f73d4083-91ae-4e37-8fd1-3183b16fe4c1	t	Gako	2eedcbc7-a7b4-489c-b235-87247c721e0d
b60e2436-9b18-41e9-b12e-0b0232821128	t	Gitaraga	2eedcbc7-a7b4-489c-b235-87247c721e0d
dc0a45fd-387c-4215-8627-f2bcf8e154b2	t	Mbabe	2eedcbc7-a7b4-489c-b235-87247c721e0d
b410463c-9f8e-42a2-a482-0e3c86b24bd7	t	Rusheshe	2eedcbc7-a7b4-489c-b235-87247c721e0d
6a42723b-c9bf-446f-8791-f82edd2da5d1	t	Gatare	9ea9e7ba-41d4-4760-ad17-468339c56f21
934c071c-2dae-48b1-89d1-494a70547c7e	t	Niboye	9ea9e7ba-41d4-4760-ad17-468339c56f21
905f7bd2-258d-4e4f-933e-8577d644df40	t	Nyakabanda	9ea9e7ba-41d4-4760-ad17-468339c56f21
1ffef69c-760b-4c4a-a0bc-8e91b5279bf0	t	Kamashashi	c4a2dbb5-db5e-4d80-88a0-2841f3b1d13e
75706ee4-8bc3-4d7a-bffb-d503891d71bb	t	Nonko	c4a2dbb5-db5e-4d80-88a0-2841f3b1d13e
3d8a0009-adce-45ac-b99b-3ef908e42783	t	Rwimbogo	c4a2dbb5-db5e-4d80-88a0-2841f3b1d13e
1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210	t	Akabahizi	748edae7-919a-40bc-8e87-161a32959dad
43df8faa-4fab-4fdc-8f89-f93a4acdf4b7	t	Akabeza	748edae7-919a-40bc-8e87-161a32959dad
058a60be-85f4-460b-98ef-e5aa801c0e9a	t	Gacyamo	748edae7-919a-40bc-8e87-161a32959dad
f0b6257b-2888-4fdb-bbb2-b05d29b7080e	t	Kigarama	748edae7-919a-40bc-8e87-161a32959dad
439e41ec-7c1c-462d-b39e-5e6874809e05	t	Kinyange	748edae7-919a-40bc-8e87-161a32959dad
a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b	t	Kora	748edae7-919a-40bc-8e87-161a32959dad
94feecd5-c53c-4c51-9580-954e073b41c5	t	Nyamweru	3d2e3e55-bd66-4e63-8e1c-fc877a39e141
4bedd313-c61e-4ac4-ac4c-0cfe373cc54c	t	Nzove	3d2e3e55-bd66-4e63-8e1c-fc877a39e141
4ab06f0a-34ff-454c-9647-7ab6216651d1	t	Taba	3d2e3e55-bd66-4e63-8e1c-fc877a39e141
3e012ba5-4e8c-4cf1-b7a5-030c62aca126	t	Kigali	7d991248-dbb0-4d70-8cbe-8bdc3c4d92c8
af7dbb52-0bce-4986-810c-eac884888d74	t	Mwendo	7d991248-dbb0-4d70-8cbe-8bdc3c4d92c8
f94ea71b-58a2-4175-8412-787d5959c18a	t	Nyabugogo	7d991248-dbb0-4d70-8cbe-8bdc3c4d92c8
2db137bf-2c45-44bc-a4f5-4f8335601d81	t	Ruriba	7d991248-dbb0-4d70-8cbe-8bdc3c4d92c8
3d93669e-316a-4aab-a48e-e9578b7864a8	t	Rwesero	7d991248-dbb0-4d70-8cbe-8bdc3c4d92c8
c7f43c14-0c64-4f47-81ec-c89e283ee9a4	t	Kamuhoza	61bd8cf6-f71c-4927-ab81-fd1fef044e5b
f31e72d1-63ee-4900-846b-82a8aecd665a	t	Katabaro	61bd8cf6-f71c-4927-ab81-fd1fef044e5b
4856c90b-5e80-496c-ac34-21b5d5bc784b	t	Kimisagara	61bd8cf6-f71c-4927-ab81-fd1fef044e5b
c139dbab-1585-4e8c-b5fa-04dfe864da9e	t	Kankuba	f27b11f9-27f9-491e-ae62-77d8bb95d65d
fa2d65c0-6c0b-4ab7-966e-539c3a9b877d	t	Kavumu	f27b11f9-27f9-491e-ae62-77d8bb95d65d
a569f960-2a09-4f06-b936-d22c03de609f	t	Mataba	f27b11f9-27f9-491e-ae62-77d8bb95d65d
3322caa7-347a-485b-8a85-6fca71a815c3	t	Ntungamo	f27b11f9-27f9-491e-ae62-77d8bb95d65d
8d68880f-8c27-430e-9709-27142a866763	t	Nyarufunzo	f27b11f9-27f9-491e-ae62-77d8bb95d65d
d04ff060-261f-45c9-9c82-7d8316c58a8e	t	Nyarurenzi	f27b11f9-27f9-491e-ae62-77d8bb95d65d
5cc81396-5168-4ab4-bfd5-80aff7a994c3	t	Runzenze	f27b11f9-27f9-491e-ae62-77d8bb95d65d
47606d28-c4be-4949-8cc7-6acac5d6a2c2	t	Amahoro	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
a4be6ac1-81ed-4b9c-a3d9-de5fe226ae7d	t	Kabasengerezi	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
9db731c8-dffa-482c-acc9-0264acbf7783	t	Kabeza	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
154529c3-454a-4bd0-97d0-680019713a86	t	Nyabugogo	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
1a6a6fba-fbae-479d-a40b-f469e62d94c8	t	Rugenge	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
856a3fe6-e6db-4482-baa5-2a6d8b62f233	t	Tetero	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
9312f0a8-9993-4fff-9cc3-994fde293a65	t	Ubumwe	ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf
79119893-0263-45a8-b251-4faaff357c01	t	Munanira I	72926ace-63be-4d4a-a28e-0afe8e300356
c0f128ca-d278-4797-aec5-695637a1356e	t	Munanira II	72926ace-63be-4d4a-a28e-0afe8e300356
e26c9186-af6d-4505-a621-147e824897e4	t	Nyakabanda I	72926ace-63be-4d4a-a28e-0afe8e300356
43aa37a4-39ec-44af-b49a-09fdb4de308d	t	Nyakabanda II	72926ace-63be-4d4a-a28e-0afe8e300356
e818257d-9a30-4090-a9a8-941352cdee80	t	Cyivugiza	78ffdb10-b17a-4017-b9e8-3eb4350ec0bb
22a2575d-9897-4fa2-acf6-ecc5514d623e	t	Gasharu	78ffdb10-b17a-4017-b9e8-3eb4350ec0bb
d05e75c7-fbd7-4315-bf75-27419f232d5d	t	Mumena	78ffdb10-b17a-4017-b9e8-3eb4350ec0bb
97febf54-db2a-4474-bc4b-4b8b6166cbf4	t	Rugarama	78ffdb10-b17a-4017-b9e8-3eb4350ec0bb
ad02b1ac-f373-486f-bfdc-119dae66231a	t	Agatare	7d4c2fad-0136-4415-942b-3d2778f49a18
7572c4ef-89aa-44f2-8fb2-28e51d4e76cb	t	Biryogo	7d4c2fad-0136-4415-942b-3d2778f49a18
7d5720ca-158f-4363-8029-2069a3dd9e67	t	Kiyovu	7d4c2fad-0136-4415-942b-3d2778f49a18
9a529ea1-129f-4f73-912b-f1c342386830	t	Rwampara	7d4c2fad-0136-4415-942b-3d2778f49a18
af6ea1cd-7b10-49ee-b4ac-9a48a563f696	t	Kabuguru I	68b6fbf6-0ddc-410a-a713-46a393fa01c9
d24c4b5c-66d9-43c3-9bcf-e4281343e1b4	t	Kabuguru II	68b6fbf6-0ddc-410a-a713-46a393fa01c9
fbda4e79-e4b5-4e50-ac7d-3ada2ab05222	t	Rwezamenyo I	68b6fbf6-0ddc-410a-a713-46a393fa01c9
3e20e2b7-9e3b-48c8-b6c8-a3f3719d9f56	t	Rwezamenyo II	68b6fbf6-0ddc-410a-a713-46a393fa01c9
586b713b-f166-4f97-92d6-f231ffa0303b	t	Cyiri	33b3fe86-e7e7-4a8e-8b2c-27728b484930
cc44a33f-f186-418b-9ebf-69c3e684c947	t	Gasagara	33b3fe86-e7e7-4a8e-8b2c-27728b484930
277e66ef-00cc-4cd6-b246-a3d7b0dd7e0f	t	Gikonko	33b3fe86-e7e7-4a8e-8b2c-27728b484930
8edb7d05-6d67-4a67-bf5a-49d38dcefc8b	t	Mbogo	33b3fe86-e7e7-4a8e-8b2c-27728b484930
a87aff2e-a2ac-449f-9b7c-5d02ca221547	t	Gabiro	c0258f8d-8cbd-4346-b30a-c69337a3a3f9
240eb070-2c01-4b18-a941-01cc4b4a1217	t	Nyabitare	c0258f8d-8cbd-4346-b30a-c69337a3a3f9
7011b53e-c1ab-4333-a990-cbb354785999	t	Nyakibungo	c0258f8d-8cbd-4346-b30a-c69337a3a3f9
2d37774d-7652-4464-8a59-13fb2b4927b6	t	Nyeranzi	c0258f8d-8cbd-4346-b30a-c69337a3a3f9
47725f63-1f57-4025-8feb-90b25fe7bc98	t	Akaboti	abf7b66f-6d00-430a-894c-37b8c93dd007
6cb827d0-0368-4bb1-810c-977d29fe208f	t	Bwiza	abf7b66f-6d00-430a-894c-37b8c93dd007
3f03b9b1-9d97-4ca4-b92b-f9e4217e5bff	t	Sabusaro	abf7b66f-6d00-430a-894c-37b8c93dd007
f3ba8d2d-fff6-4042-8a2a-65e7ee4daf64	t	Duwani	452c6a96-2a92-4589-8aca-5a4409f48a31
4025e1e8-952c-4cd5-881f-f8f13e5db6b8	t	Kibirizi	452c6a96-2a92-4589-8aca-5a4409f48a31
72043d72-3288-4930-a2e0-8314f94841fe	t	Muyira	452c6a96-2a92-4589-8aca-5a4409f48a31
55b83b6c-7b81-4bc0-875e-98d25ca9df3e	t	Ruturo	452c6a96-2a92-4589-8aca-5a4409f48a31
98772560-607d-4302-8406-4a0c267f3902	t	Agahabwa	9337e292-08f0-4623-95f4-f4bdb25df587
0fc399a5-2147-47ce-a2ae-68dd47ca333e	t	Gatovu	9337e292-08f0-4623-95f4-f4bdb25df587
25ea9d41-d512-4a43-b5fe-f2a5a91677b1	t	Impinga	9337e292-08f0-4623-95f4-f4bdb25df587
b5037f2d-c8b0-48d2-b1cc-dbefe756b635	t	Nyabikenke	9337e292-08f0-4623-95f4-f4bdb25df587
eb9f3068-05c0-4ab1-8eff-66dc78c8712c	t	Rubona	9337e292-08f0-4623-95f4-f4bdb25df587
b8a8f3aa-5455-4180-98a0-6e549ff5b1f5	t	Rusagara	9337e292-08f0-4623-95f4-f4bdb25df587
338a53be-6eda-46ad-8c85-8f14ab33f85b	t	Gakoma	8bc5233e-0dee-4ee5-a136-187584a8093f
7548dbd7-6c0a-428d-8853-810658f52759	t	Kabumbwe	8bc5233e-0dee-4ee5-a136-187584a8093f
e7f42c08-7c05-40ba-b508-15ec95944d24	t	Mamba	8bc5233e-0dee-4ee5-a136-187584a8093f
7e4c9907-e3c1-4904-8395-d5c4c6832492	t	Muyaga	8bc5233e-0dee-4ee5-a136-187584a8093f
335389d3-1882-4b16-9067-0b44f6c22c5f	t	Ramba	8bc5233e-0dee-4ee5-a136-187584a8093f
9ea09ba2-2121-4ec5-b346-4bb957e90da6	t	Cyumba	bdf96fbb-4001-44a5-b226-4a4f60920b14
accbd684-f8ec-4818-9ba7-46b10139f9d8	t	Muganza	bdf96fbb-4001-44a5-b226-4a4f60920b14
c04bbc32-9ef9-4fb7-a12e-d1d44128919b	t	Remera	bdf96fbb-4001-44a5-b226-4a4f60920b14
c375a12d-bdfe-41b3-a363-a7997d42e765	t	Rwamiko	bdf96fbb-4001-44a5-b226-4a4f60920b14
152759d6-4f08-4481-8335-d1506f085b0a	t	Saga	bdf96fbb-4001-44a5-b226-4a4f60920b14
6fcf1dc1-d97f-4dbc-869a-4999af73a9db	t	Baziro	22e1a70b-affb-446f-83c0-e06423620678
e502101b-2dd3-4175-a60f-2236c966296b	t	Kibayi	22e1a70b-affb-446f-83c0-e06423620678
598a4826-3cf0-43f3-b29c-a3e9daada436	t	Kibu	22e1a70b-affb-446f-83c0-e06423620678
bae7a91a-6945-45bf-8e06-4c90a01e0776	t	Mugombwa	22e1a70b-affb-446f-83c0-e06423620678
301c9bf7-bb7f-469f-b242-51f68cefe215	t	Mukomacara	22e1a70b-affb-446f-83c0-e06423620678
09b1e9dd-ecc8-4a02-8138-b3615ab8002d	t	Gitega	9fa822f8-560a-4fa4-a3c1-c8f4705b9054
3b011cb3-399f-4c9c-bf73-00d0a93cca23	t	Mukiza	9fa822f8-560a-4fa4-a3c1-c8f4705b9054
a7cc74bf-458c-4ae2-9a4d-df01283f38e2	t	Nyabisagara	9fa822f8-560a-4fa4-a3c1-c8f4705b9054
0e1a6993-93d0-4c52-beb7-b7ae06be7048	t	Runyinya	9fa822f8-560a-4fa4-a3c1-c8f4705b9054
ed870518-1f58-4eda-a47e-7ab08a50cf79	t	Bukinanyana	5b6109a9-ba8a-4941-84ed-d9e0962f4b74
9ee4c811-7c5b-40c0-852a-7e443d64e51f	t	Gatovu	5b6109a9-ba8a-4941-84ed-d9e0962f4b74
fa437756-a63f-4748-8583-0220dfc026b7	t	Kigarama	5b6109a9-ba8a-4941-84ed-d9e0962f4b74
d276652b-fb19-4c2a-aee5-fe54e38c0dbc	t	Kimana	5b6109a9-ba8a-4941-84ed-d9e0962f4b74
23f8eb1a-3d7e-4aea-98c6-7e6a0778cf09	t	Bweya	66d8fe23-850c-4cff-8ff8-a1eb0c218743
9c9142a1-fe6f-42bf-bee5-6e71da5c2bff	t	Cyamukuza	66d8fe23-850c-4cff-8ff8-a1eb0c218743
a9509a9a-8609-4592-8498-4acf6e15e847	t	Dahwe	66d8fe23-850c-4cff-8ff8-a1eb0c218743
6851223a-4977-4c88-9839-c65c009f07a3	t	Gisagara	66d8fe23-850c-4cff-8ff8-a1eb0c218743
816a8472-b2c9-41a7-bf7f-957d55250718	t	Mukande	66d8fe23-850c-4cff-8ff8-a1eb0c218743
9d1ef4cc-7bad-4b6c-a8f0-b4255362e6f5	t	Higiro	91d933ab-9111-4021-9bc7-7b0d4acb3322
c0d9af68-3e0c-4a9a-8d6c-1413bfe7249d	t	Nyamugari	91d933ab-9111-4021-9bc7-7b0d4acb3322
58da4023-5ec0-4a77-ac6a-07fd046be46a	t	Nyaruteja	91d933ab-9111-4021-9bc7-7b0d4acb3322
e2e8d544-f51e-4242-adc9-afd6a23b370c	t	Umubanga	91d933ab-9111-4021-9bc7-7b0d4acb3322
519ca734-49e5-48c2-bb3c-5699569ad700	t	Gatoki	0516345f-416e-489d-ae76-c6bc492d2690
61e7cf44-2ec0-408b-b8c6-2556d01a5437	t	Munazi	0516345f-416e-489d-ae76-c6bc492d2690
70447821-63f4-4018-a5ed-3546fb4d4213	t	Rwanza	0516345f-416e-489d-ae76-c6bc492d2690
065dfaa8-116d-4cd9-8281-dd8cce04788c	t	Shyanda	0516345f-416e-489d-ae76-c6bc492d2690
e5b22f42-f9aa-46f1-8a8b-28fbe45ba742	t	Zivu	0516345f-416e-489d-ae76-c6bc492d2690
4591df75-9921-421a-a29a-8c3ffb79d326	t	Nyakibanda	1b7e723f-ec38-4ee4-b963-753ec38489e6
775e9d18-74d3-499b-a09a-c5d730d76b1e	t	Nyumba	1b7e723f-ec38-4ee4-b963-753ec38489e6
8c28b0ce-47c8-4563-93c9-d1640efd3b17	t	Ryakibogo	1b7e723f-ec38-4ee4-b963-753ec38489e6
270f38a3-eb84-47c7-b281-44bd29bab8ce	t	Shori	1b7e723f-ec38-4ee4-b963-753ec38489e6
d1b10ef1-d6b0-4456-a7c8-73739d49267a	t	Muyogoro	5609a27c-ab1d-4e97-b562-9ec7bdee0d6d
45982844-9a40-4aff-8cbd-f7f5d484d4e2	t	Nyakagezi	5609a27c-ab1d-4e97-b562-9ec7bdee0d6d
13758764-b0e2-4ae0-bebd-c6846237f992	t	Rukira	5609a27c-ab1d-4e97-b562-9ec7bdee0d6d
7c5da52a-84a1-49c9-9d85-3bac97be61e1	t	Sovu	5609a27c-ab1d-4e97-b562-9ec7bdee0d6d
5016c44f-e7ed-4015-ab22-7b56e0cb5724	t	Buhoro	bfe70125-877d-4ae0-ad21-7a829a9fa510
7f18ffe9-6448-4d28-a7b3-91ba4eb1378e	t	Bunazi	bfe70125-877d-4ae0-ad21-7a829a9fa510
418f9b2d-b82f-42f7-ad13-9d93ff387b57	t	Gahororo	bfe70125-877d-4ae0-ad21-7a829a9fa510
4343ed14-1394-4e4b-b723-3f6b83284c66	t	Kibingo	bfe70125-877d-4ae0-ad21-7a829a9fa510
862c0bb9-5a17-47ef-bc40-a7a4155c9b82	t	Muhembe	bfe70125-877d-4ae0-ad21-7a829a9fa510
e3d94b91-3fd1-4221-9a7d-3a0c92e1cd70	t	Gishihe	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
29d179d0-52d1-478d-9af9-8f1bb04663df	t	Kabuga	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
a0c04bdb-4c4e-44a4-9a72-3ea8a364e021	t	Karambi	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
359cccf6-cab4-43db-ac0d-3bdcddc2fa5a	t	Musebeya	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
5066bdf9-8917-412c-9dc3-fdefeec7bbae	t	Nyabisindu	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
c158ea12-6154-4a44-8d83-074f70cd82c7	t	Rugarama	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
d38413ac-9be0-4bc8-81d0-6c6f4e73e42d	t	Shanga	c671bbc8-6a8a-450f-9b71-db1c2144ae3a
2ec03bf8-39bb-4541-9425-23671983e10b	t	Byinza	a808e9fc-ca5d-4709-aae5-3791acfb09ed
75535fc2-abb9-4b5b-80e2-0af2140441dd	t	Gahana	a808e9fc-ca5d-4709-aae5-3791acfb09ed
43e6e0f5-811c-4760-b22a-d4641be46514	t	Gitovu	a808e9fc-ca5d-4709-aae5-3791acfb09ed
7b83f27b-cd4d-4b45-8d3c-07a442e346f5	t	Kabona	a808e9fc-ca5d-4709-aae5-3791acfb09ed
3565e71c-eeb0-4159-a3ff-5efc0d08c646	t	Sazange	a808e9fc-ca5d-4709-aae5-3791acfb09ed
4b79ac10-868c-4f7e-b480-fe094447f514	t	Shanga	9a39aa33-b1e1-46a9-9323-e8301d7e2701
df3cfe73-976a-4090-a502-59a784643707	t	Shyembe	9a39aa33-b1e1-46a9-9323-e8301d7e2701
b3406473-6636-4184-a9da-86a96af0304d	t	Gatobotobo	d89ea1f5-022e-43ea-aef7-537a36009d32
80651f50-747c-45eb-9496-8052e83fadd4	t	Kabuga	d89ea1f5-022e-43ea-aef7-537a36009d32
8a453461-c313-4e8d-894e-2995220be6cb	t	Mutunda	d89ea1f5-022e-43ea-aef7-537a36009d32
92a394a6-240c-4ebe-81f7-18397b563b5e	t	Mwulire	d89ea1f5-022e-43ea-aef7-537a36009d32
2c2efe89-5fc8-495a-9a64-98da73bb0f6a	t	Rugango	d89ea1f5-022e-43ea-aef7-537a36009d32
0374692d-b067-46ff-8864-3eec29230fde	t	Rusagara	d89ea1f5-022e-43ea-aef7-537a36009d32
db8e897c-db1a-4569-9360-a41ea54afbe9	t	Tare	d89ea1f5-022e-43ea-aef7-537a36009d32
da1227cd-faf8-4982-ac4d-84dac56b6f69	t	Bukomeye	8f903670-764d-4028-af4d-3ec7e266834e
b1160ba3-25bc-4a0d-bd78-b009204db17b	t	Buvumu	8f903670-764d-4028-af4d-3ec7e266834e
596dc10f-68f1-4baa-b287-09d2d3ebe7aa	t	Icyeru	8f903670-764d-4028-af4d-3ec7e266834e
4cda0929-8914-4237-aae4-8f6ed20600e3	t	Rango A	8f903670-764d-4028-af4d-3ec7e266834e
58fba5e2-e0f7-4057-ace8-6e1efe1d8370	t	Butare	fa644420-99b9-4557-ab52-008c9f31b73b
bf239682-1794-4d18-804e-e49f478f8a9d	t	Kaburemera	fa644420-99b9-4557-ab52-008c9f31b73b
52f65bef-9116-455d-965d-185589d0a8da	t	Matyazo	fa644420-99b9-4557-ab52-008c9f31b73b
bc773ca6-2cec-4439-9f79-ed53af08c6ad	t	Ngoma	fa644420-99b9-4557-ab52-008c9f31b73b
cfd0f71f-26da-4ce7-bc9f-816c4e257cb8	t	Gatovu	18ee5d75-4a8a-44c6-be19-85f390057294
666df64e-02ea-4abf-a747-95458d83ea87	t	Karama	18ee5d75-4a8a-44c6-be19-85f390057294
9c11cef6-d084-4d58-bdbb-b3381f95900c	t	Mara	18ee5d75-4a8a-44c6-be19-85f390057294
84e7bd58-bbfb-4d15-9035-9d21e87ab694	t	Muhororo	18ee5d75-4a8a-44c6-be19-85f390057294
9603b59e-9730-4c50-946e-fbb595d72dd8	t	Rugogwe	18ee5d75-4a8a-44c6-be19-85f390057294
1c627ac8-3cd0-4e7c-98be-f8d1dcbe8035	t	Ruhashya	18ee5d75-4a8a-44c6-be19-85f390057294
a834ce83-a295-4558-bb13-d8c07da8934a	t	Buhimba	202ba27e-744c-422f-9e5f-bea4dc4f4423
42037961-81a9-4431-81a3-089835512348	t	Gafumba	202ba27e-744c-422f-9e5f-bea4dc4f4423
c93f1f27-2eaa-432c-b187-28ecaf483fd3	t	Kimirehe	202ba27e-744c-422f-9e5f-bea4dc4f4423
e01d0315-5c1a-4069-a99e-33375bf27ecf	t	Kimuna	202ba27e-744c-422f-9e5f-bea4dc4f4423
c415b8ba-3283-4c39-9687-1b1939ff7a95	t	Kiruhura	202ba27e-744c-422f-9e5f-bea4dc4f4423
0f75b848-1fc9-433e-aecb-1e1dc190dd05	t	Mugogwe	202ba27e-744c-422f-9e5f-bea4dc4f4423
1ee7f3f0-c653-42e0-9f1d-4254128c8538	t	Gatwaro	d8ec6d49-df34-4fd9-838d-b9795e889ae7
6c33f198-202e-489f-90ec-7d2a5e640754	t	Kamwambi	d8ec6d49-df34-4fd9-838d-b9795e889ae7
de0ce24e-d08d-4fb3-b42e-36250303d57e	t	Kibiraro	d8ec6d49-df34-4fd9-838d-b9795e889ae7
1f47b6b5-effe-4928-a30f-ab8c1cd38130	t	Mwendo	d8ec6d49-df34-4fd9-838d-b9795e889ae7
deeaec71-87ed-41f0-8c2a-62341b00c1cc	t	Nyamabuye	d8ec6d49-df34-4fd9-838d-b9795e889ae7
3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6	t	Nyaruhombo	d8ec6d49-df34-4fd9-838d-b9795e889ae7
81791391-c885-4588-851f-dd4270e03189	t	Shyunga	d8ec6d49-df34-4fd9-838d-b9795e889ae7
1f3d165b-eac0-4dca-b361-1062c80624fa	t	Cyendajuru	1a6da1f7-73b8-437b-a459-535b706968f0
c554a548-ded3-47ac-8726-f21d48aa44fe	t	Kabusanza	1a6da1f7-73b8-437b-a459-535b706968f0
b5e3cebc-3e92-4de0-94d0-d44a18f5e936	t	Mugobore	1a6da1f7-73b8-437b-a459-535b706968f0
9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557	t	Cyarwa	8f1a4e10-c493-49f3-a7f6-88dbe2d6698f
6853ff61-14bd-412d-8249-793db38b4a98	t	Cyimana	8f1a4e10-c493-49f3-a7f6-88dbe2d6698f
27fada52-2916-46ad-b22a-d2dc53649b53	t	Gitwa	8f1a4e10-c493-49f3-a7f6-88dbe2d6698f
459c2cf7-d30f-4f8d-88f1-636e757af158	t	Mpare	8f1a4e10-c493-49f3-a7f6-88dbe2d6698f
8877d7c9-ee05-4990-b248-b627b67c0964	t	Rango B	8f1a4e10-c493-49f3-a7f6-88dbe2d6698f
a9d40bb6-6e99-4a5d-8246-d3a969b6ee74	t	Gihinga	9fafd273-e319-4fb2-9936-bc6680c230c0
c788e2bf-3aee-4345-93b9-3dc6f9beb7a3	t	Gihira	9fafd273-e319-4fb2-9936-bc6680c230c0
b635914c-9edc-4a91-9915-1f081945e8ac	t	Kigembe	9fafd273-e319-4fb2-9936-bc6680c230c0
c209338d-4c06-4862-83d7-728badb0ff45	t	Nkingo	9fafd273-e319-4fb2-9936-bc6680c230c0
863329e3-9652-48e3-a128-a199aa067de3	t	Bitare	b23701c1-5ef6-4681-a082-bce15b0d4619
676e0bfe-014c-43de-8622-4c130a550537	t	Bunyonga	b23701c1-5ef6-4681-a082-bce15b0d4619
8888b9fb-bb58-4275-9941-8af0c238c549	t	Muganza	b23701c1-5ef6-4681-a082-bce15b0d4619
7abcd1d0-fa92-4675-94c9-315632a3f1ca	t	Nyamirembe	b23701c1-5ef6-4681-a082-bce15b0d4619
42e8b706-31d6-4f70-b113-6e7aafab6eba	t	Bugarama	0797c8dc-32f4-4990-88ee-c25cb921ee69
979d0bca-525f-4065-9584-91b92aa8f021	t	Cubi	0797c8dc-32f4-4990-88ee-c25cb921ee69
b2442687-9015-4f94-8fd3-3011830a364f	t	Kirwa	0797c8dc-32f4-4990-88ee-c25cb921ee69
57bd0239-a431-4b20-b4d0-6fa7bb6078a4	t	Mataba	0797c8dc-32f4-4990-88ee-c25cb921ee69
0e2eaf92-6f0f-4703-8b0c-a83bf93033aa	t	Gaseke	bd758bbb-79b4-48e0-8152-9dfd4ec0d3f5
17d8fc15-5509-476c-8a8d-3152a31253ed	t	Giko	bd758bbb-79b4-48e0-8152-9dfd4ec0d3f5
3196d26c-65f4-4a59-9955-4ea4df0e3467	t	Muyange	bd758bbb-79b4-48e0-8152-9dfd4ec0d3f5
a4609757-eb09-4c02-8e42-321e6bc1662b	t	Jenda	ac3649d0-4eb0-4019-b438-5bfa6c9d0362
cbb02a1c-b832-4459-956a-f9fc58586e97	t	Kabugondo	ac3649d0-4eb0-4019-b438-5bfa6c9d0362
f9bc44be-f01e-45b5-bc62-6c8d2479760a	t	Mbati	ac3649d0-4eb0-4019-b438-5bfa6c9d0362
3ff15cdd-52f9-4a73-919d-e46b7f92c163	t	Mugina	ac3649d0-4eb0-4019-b438-5bfa6c9d0362
174c5d35-fc05-4db6-8ccf-a8b5ab2f55fa	t	Nteko	ac3649d0-4eb0-4019-b438-5bfa6c9d0362
1c6e2bb0-a1bb-4e4f-8b9d-f1b80995f346	t	Buhoro	fd1818c6-01a1-48b3-9b93-b1ba631395b7
4c5f3179-3dce-4602-91d1-53627a382881	t	Cyambwe	fd1818c6-01a1-48b3-9b93-b1ba631395b7
b2351573-f448-4fd5-8ad7-8e549667ae78	t	Karengera	fd1818c6-01a1-48b3-9b93-b1ba631395b7
36d10304-0b20-403d-90fa-09d90d1fbe00	t	Kivumu	fd1818c6-01a1-48b3-9b93-b1ba631395b7
cab1ac7b-a9dd-4681-877d-abc1beb87a8a	t	Mpushi	fd1818c6-01a1-48b3-9b93-b1ba631395b7
85e833c5-06be-425f-abb4-f59a1165f287	t	Rukambura	fd1818c6-01a1-48b3-9b93-b1ba631395b7
5667bf3f-f053-46c4-8ac1-a5e32629255a	t	Kabuga	c6e31311-3f88-487d-9ee8-df789fcd1e80
29062adb-5259-4bcd-98d9-c3336c3cafff	t	Kazirabonde	c6e31311-3f88-487d-9ee8-df789fcd1e80
c7f81d6b-6015-4dbc-8b99-e7a98300997e	t	Marembo	c6e31311-3f88-487d-9ee8-df789fcd1e80
5f6e0501-54f9-4c28-8583-32e1b82bce83	t	Bibungo	95269822-969e-4d09-a17a-c3f69d5d829b
e5ca7d99-6316-4685-b1a8-dd412650bf0d	t	Kabashumba	95269822-969e-4d09-a17a-c3f69d5d829b
274f5951-bd36-4aa8-bf97-89abe47f1a24	t	Kidahwe	95269822-969e-4d09-a17a-c3f69d5d829b
d52d9512-96fd-47d4-9375-061a88acf217	t	Mukinga	95269822-969e-4d09-a17a-c3f69d5d829b
cfc301c3-c196-419b-9de1-a9d50dd775fc	t	Ngoma	95269822-969e-4d09-a17a-c3f69d5d829b
d5cfd5c5-59b3-494e-96db-25c1a693519f	t	Gitare	2dc44c68-a51d-4f48-b8e2-1ddee65b8c0c
3014e965-004d-45fa-b4f9-b0a10e2758a3	t	Kambyeyi	2dc44c68-a51d-4f48-b8e2-1ddee65b8c0c
428e1c4d-aea8-4f62-860a-16c1c0fde458	t	Kigusa	2dc44c68-a51d-4f48-b8e2-1ddee65b8c0c
0678f280-7e11-4eb6-a767-2dc72d02840f	t	Nyagishubi	2dc44c68-a51d-4f48-b8e2-1ddee65b8c0c
728c7b3a-7653-4b8e-a969-96a7461b8a6a	t	Ruyanza	2dc44c68-a51d-4f48-b8e2-1ddee65b8c0c
4f581c43-ae2a-4f89-847a-703a659b1e34	t	Kigese	a6df88b4-cbe2-4657-9ce2-58f794416bff
da41767c-0e61-490c-b4c4-02f91a768472	t	Masaka	a6df88b4-cbe2-4657-9ce2-58f794416bff
ea43039c-1476-4ef2-bb6e-1e48254bb688	t	Nyarubuye	a6df88b4-cbe2-4657-9ce2-58f794416bff
d5fd55ee-a698-4c80-bf94-6fbc109acb26	t	Sheli	a6df88b4-cbe2-4657-9ce2-58f794416bff
d63819ca-7d55-41a6-807c-482b2ed9f616	t	Bugoba	98581c1e-a901-4e6a-845b-f899f9ca7312
f16ecac8-d47d-4848-895c-437ceafd130b	t	Buguri	98581c1e-a901-4e6a-845b-f899f9ca7312
a8b8ebe1-f2c3-4cdd-bbfc-650d13613cdb	t	Gishyeshye	98581c1e-a901-4e6a-845b-f899f9ca7312
0fc2dba8-1154-4805-ac27-b7a39f0b78ef	t	Murehe	98581c1e-a901-4e6a-845b-f899f9ca7312
e93bbb0e-310f-4525-9128-0d89419821e9	t	Mwirute	98581c1e-a901-4e6a-845b-f899f9ca7312
d6003a8e-0478-4b83-a574-044a7393ecf0	t	Remera	98581c1e-a901-4e6a-845b-f899f9ca7312
039ed15f-7249-4cec-abe6-41f6ede0f65e	t	Taba	98581c1e-a901-4e6a-845b-f899f9ca7312
53d90c17-8750-4012-bb41-5bb0ef42185a	t	Gihara	23fefa45-4903-4bdb-baed-4e5ed72cfeb5
22c558c5-f15d-4f5e-b146-b9bf93cfc1b5	t	Kabagesera	23fefa45-4903-4bdb-baed-4e5ed72cfeb5
b8459d7f-1215-4f0d-b46d-79b8cf97ec43	t	Kagina	23fefa45-4903-4bdb-baed-4e5ed72cfeb5
d714566e-2967-4936-b045-fbfa39e63175	t	Muganza	23fefa45-4903-4bdb-baed-4e5ed72cfeb5
1fdac4bf-c07c-465f-b97a-0f9ad410e533	t	Ruyenzi	23fefa45-4903-4bdb-baed-4e5ed72cfeb5
5e4955dd-0c94-4b8c-af90-cf8a0fbf4ac7	t	Kigarama	91a429b1-17e3-483a-8ff9-b2b8c2724e4b
ba1898ab-54ac-48d8-9ab6-ac5f54f08e74	t	Kivumu	91a429b1-17e3-483a-8ff9-b2b8c2724e4b
f9cfaa12-af8f-44ee-afa4-49c49bf539da	t	Makera	91a429b1-17e3-483a-8ff9-b2b8c2724e4b
08b5de04-7e5c-409b-bf28-403e3df53c1d	t	Nyarunyinya	91a429b1-17e3-483a-8ff9-b2b8c2724e4b
448a965d-14ba-448c-98e0-13ea17a8b6d7	t	Buramba	afe12030-3480-49a1-a95f-9e53b7f583fe
495ae53f-4d23-4a2d-8621-b88b15bff72b	t	Butare	afe12030-3480-49a1-a95f-9e53b7f583fe
3f81051f-cbd7-49f4-8755-5fc668797d91	t	Kabuye	afe12030-3480-49a1-a95f-9e53b7f583fe
0172407d-63f3-4328-bb0e-5ba2a7fa616d	t	Kavumu	afe12030-3480-49a1-a95f-9e53b7f583fe
931692ab-cd4a-42f1-abed-7cbded784f9c	t	Kibyimba	afe12030-3480-49a1-a95f-9e53b7f583fe
c566ae32-33b1-4516-ac0a-dfe69bf05074	t	Ngarama	afe12030-3480-49a1-a95f-9e53b7f583fe
f81b2512-58df-44da-a751-dad06621cde3	t	Ngoma	afe12030-3480-49a1-a95f-9e53b7f583fe
38b80730-3867-4edc-8172-50de32832086	t	Budende	1cadfa01-47c0-4c40-96b6-cb9f99e3bf34
1f72c93c-3fef-4e16-a55d-ded702478b5f	t	Remera	1cadfa01-47c0-4c40-96b6-cb9f99e3bf34
7fdfabc1-e7d1-46db-8579-a201ee6862ab	t	Ruhina	1cadfa01-47c0-4c40-96b6-cb9f99e3bf34
f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01	t	Rukeri	1cadfa01-47c0-4c40-96b6-cb9f99e3bf34
2d1c91ed-9137-4965-bed9-4bc5916961b7	t	Kanyinya	72fc8034-1632-41e4-ac74-633d9a59451d
c00d3077-1d30-4280-b6d6-404c5f10f8b2	t	Nganzo	72fc8034-1632-41e4-ac74-633d9a59451d
30bce05b-b545-496c-99ab-077bab0ed462	t	Tyazo	72fc8034-1632-41e4-ac74-633d9a59451d
90cc361c-ab9e-458f-8321-77deabf3c5e6	t	Matyazo	40a82a8e-53eb-474a-aee4-b64a62b9d940
5a27d3f8-ec4d-4796-8c9c-19b759253e12	t	Munazi	40a82a8e-53eb-474a-aee4-b64a62b9d940
2bd3a9e9-fced-4744-a018-eba8fd419299	t	Nyagasozi	40a82a8e-53eb-474a-aee4-b64a62b9d940
add90814-ba2e-4c62-ac9a-18a81bf20858	t	Rukaragata	40a82a8e-53eb-474a-aee4-b64a62b9d940
fa8a7308-b075-40c2-9977-c039d4fcc174	t	Rwasare	40a82a8e-53eb-474a-aee4-b64a62b9d940
519a3a38-48b2-4a7a-a700-6b6a7d760081	t	Rwigerero	40a82a8e-53eb-474a-aee4-b64a62b9d940
0d08d895-1871-401c-911e-0a57f093a291	t	Nyarusozi	50ab7c13-a2c5-4648-92c3-fd47e8ee56ab
ba6e2244-6532-4422-ba43-be92f2b08e31	t	Gahogo	93adfb7c-847a-4afd-9428-03d46a039e08
bf7c5dca-7fc5-49e0-9066-53a93aefa03e	t	Gifumba	93adfb7c-847a-4afd-9428-03d46a039e08
2230abb8-899d-40df-9c08-cf8a9d4f95d0	t	Gitarama	93adfb7c-847a-4afd-9428-03d46a039e08
9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e	t	Remera	93adfb7c-847a-4afd-9428-03d46a039e08
197364ee-766c-4ced-8d87-7afba9a284f0	t	Mbiriri	96750d57-2939-4fc6-9a1d-3211ede6bbe5
0b7e9ae5-3f4c-4dba-a8f7-e72ad8706ef5	t	Musongati	96750d57-2939-4fc6-9a1d-3211ede6bbe5
ec1188b8-8737-4af7-8ad1-577bdac8a77f	t	Ngaru	96750d57-2939-4fc6-9a1d-3211ede6bbe5
515f68bb-7693-4b02-a6ba-f1ffb5a1ed30	t	Rusovu	96750d57-2939-4fc6-9a1d-3211ede6bbe5
8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc	t	Gasagara	8d8fd022-3ef2-4bd3-b0b3-caac4990d62a
ab2d2377-4651-40ea-adc9-6d557dd366bb	t	Gasharu	8d8fd022-3ef2-4bd3-b0b3-caac4990d62a
ab17525f-865b-4454-977c-c119e94e6ac9	t	Karambo	8d8fd022-3ef2-4bd3-b0b3-caac4990d62a
282fe0f4-aeb9-4add-bbd8-eb123484f9d1	t	Nyamirambo	8d8fd022-3ef2-4bd3-b0b3-caac4990d62a
e7007c7e-5954-4c2e-a9bd-dc2259540698	t	Ruhango	8d8fd022-3ef2-4bd3-b0b3-caac4990d62a
086328f3-32e9-4e99-93ed-9104e413b136	t	Gasave	f2787b2c-9243-493d-a153-def4a34e2050
28b8e742-ade7-400c-a7f0-330cd3576c94	t	Nsanga	f2787b2c-9243-493d-a153-def4a34e2050
26c6af35-e7eb-420a-ac84-3a93040da91c	t	Kinini	75a0c33d-b669-48b9-a80b-9b941ab737fd
54ed53cf-5792-41ec-96de-f97525cbff30	t	Mbare	75a0c33d-b669-48b9-a80b-9b941ab737fd
2f7b7edf-301b-46d1-8dae-0c2d45900b36	t	Mubuga	75a0c33d-b669-48b9-a80b-9b941ab737fd
46753a28-b330-49dc-b6e9-12aa1bae11ee	t	Ruli	75a0c33d-b669-48b9-a80b-9b941ab737fd
c4885575-ea38-4f8f-9b1d-1e738b3b2c15	t	Bushigishigi	0d266d08-cd2d-4400-a4a4-4c669d7b51b1
79fb8108-a74e-42cd-a67a-f550e9a56c53	t	Byimana	0d266d08-cd2d-4400-a4a4-4c669d7b51b1
f54cbcff-9991-49ee-9e8d-e36742d99ece	t	Gifurwe	0d266d08-cd2d-4400-a4a4-4c669d7b51b1
aa611db7-cd19-4587-82d3-844a259f3534	t	Munini	0d266d08-cd2d-4400-a4a4-4c669d7b51b1
20f9f28b-f099-408c-91bd-c49b6c9bbf6f	t	Rambya	0d266d08-cd2d-4400-a4a4-4c669d7b51b1
96bc32c7-d460-467b-b806-d7fa82c8f17c	t	Gitega	3e31fc8a-b1c0-4c6d-9117-d627a26c52e3
641188e7-83a4-421d-873d-df68b5eb411a	t	Karama	3e31fc8a-b1c0-4c6d-9117-d627a26c52e3
0744a458-ede6-4942-91e1-cdb67455a00a	t	Kiyumba	3e31fc8a-b1c0-4c6d-9117-d627a26c52e3
456394cf-2621-4609-b49e-e9266b5d70b6	t	Ngoma	3e31fc8a-b1c0-4c6d-9117-d627a26c52e3
e98cce10-c0be-47dd-a302-25a8b536a72e	t	Nyanza	3e31fc8a-b1c0-4c6d-9117-d627a26c52e3
49909b1c-0512-4e6e-a499-a014b94c7dcd	t	Nyanzoga	3e31fc8a-b1c0-4c6d-9117-d627a26c52e3
395db7da-7587-4d64-b6d2-d5ef240547d7	t	Kigeme	c3515ddc-ab28-4b4b-bf99-bc9192b83abe
a495596a-5ad9-48bc-8a7d-7a8364b68f57	t	Ngiryi	c3515ddc-ab28-4b4b-bf99-bc9192b83abe
dbdb1f26-7e3c-439f-803e-9b3c2fc742fa	t	Nyabivumu	c3515ddc-ab28-4b4b-bf99-bc9192b83abe
335ad558-aa62-4b9b-a268-1ab488391f31	t	Nyamugari	c3515ddc-ab28-4b4b-bf99-bc9192b83abe
53effd48-8a99-4a8a-b213-ba884eba5421	t	Nzega	c3515ddc-ab28-4b4b-bf99-bc9192b83abe
b07e5a18-4954-4320-b805-3981bed25259	t	Remera	c3515ddc-ab28-4b4b-bf99-bc9192b83abe
ca6e4f0c-921c-4580-8f8d-122c79f5d93d	t	Gatare	cdeae1ba-0fd2-4d48-87af-4c41d7b14fed
ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf	t	Kavumu	9fede312-873b-42a9-909a-ca25ef46d292
1961dea9-6093-4bb3-8b76-0ecf2b2300b0	t	Murambi	9fede312-873b-42a9-909a-ca25ef46d292
4d1023ec-2d8d-4533-aaed-cf3e026a3e50	t	Musenyi	9fede312-873b-42a9-909a-ca25ef46d292
a3a5e876-395a-4d1d-9bd0-c43721c89f00	t	Nyabisindu	9fede312-873b-42a9-909a-ca25ef46d292
1e939216-f7ae-400f-a20c-1d17c14720ca	t	Nyamiyaga	9fede312-873b-42a9-909a-ca25ef46d292
6d739d6b-0747-4bac-9b02-a0f84838a06d	t	Bwama	c61cc130-a989-4e2d-8b08-d0505fcff967
9c907b5f-63fc-4c88-b968-df5e95cba7ad	t	Kirehe	c61cc130-a989-4e2d-8b08-d0505fcff967
81641aae-c29f-4675-95ea-c10ce432dc73	t	Nyarusiza	c61cc130-a989-4e2d-8b08-d0505fcff967
046818a1-ff97-4ab6-b9b1-11bd2856a21e	t	Bugarama	211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7
db0332e6-ed45-48ba-b489-1f96c425fde2	t	Bugarura	211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7
729a842d-8011-4970-bde3-4ef206cbade9	t	Gashiha	211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7
3d3802b5-de3c-4df6-8db0-7eb8d997ee19	t	Karambo	211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7
519ce539-6d3c-4e70-abaf-aaad114af469	t	Ruhunga	211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7
f1b0512d-ebd6-42eb-a394-e95af3adfe5a	t	Uwindekezi	211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7
d1e2a3dc-dc35-42d1-a5b2-a2b0158e8cac	t	Bwenda	41fdce21-a3c5-4a9f-89e1-79ae46eb9660
33fab97a-5c77-4255-b956-d830c37645c9	t	Gakanka	41fdce21-a3c5-4a9f-89e1-79ae46eb9660
02d1dea2-2f93-43e2-83c8-6bc548dea190	t	Kibibi	41fdce21-a3c5-4a9f-89e1-79ae46eb9660
8640b9aa-db42-47b8-b858-4365a9a53308	t	Nyakiza	41fdce21-a3c5-4a9f-89e1-79ae46eb9660
b8808a77-e697-41ba-90ec-bb0662277b2a	t	Kagano	4c95fa17-e992-439e-8548-57f63c1ca7a8
e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486	t	Mujuga	4c95fa17-e992-439e-8548-57f63c1ca7a8
67636dc6-e3a0-44d9-94bd-4cea9690f097	t	Mukungu	4c95fa17-e992-439e-8548-57f63c1ca7a8
0b0b96ad-1137-4b38-bb9e-88e721019dcc	t	Mutiwingoma	b418293a-6763-4bf1-be97-7a14857e133b
4a7ce83b-54f1-404b-88fd-defe513294ae	t	Ngambi	b418293a-6763-4bf1-be97-7a14857e133b
b38ad7ec-e2e1-490f-81a4-3ecf0cc93295	t	Ngara	b418293a-6763-4bf1-be97-7a14857e133b
37e2aaa5-96b3-4444-9952-60487afe0ba9	t	Gitwa	84b8dd0d-7b11-45ab-9793-81de101a4115
b4fc8e05-d797-454d-9203-992245529d6f	t	Ruhinga	84b8dd0d-7b11-45ab-9793-81de101a4115
9b256b01-7e8f-4fda-87f9-37d8640a7d57	t	Sovu	84b8dd0d-7b11-45ab-9793-81de101a4115
3c7feffc-acab-4c12-82c6-dbc9edf428b5	t	Suti	84b8dd0d-7b11-45ab-9793-81de101a4115
d4e3d6ec-dc37-4e84-82ec-4077df201565	t	Gasave	929467b3-e406-4ce3-88b1-efa783ca5989
c771409e-45f3-4535-93ae-091efe6c0608	t	Jenda	929467b3-e406-4ce3-88b1-efa783ca5989
6aa97242-13b7-46b2-aaa5-900adee6cbf8	t	Masagara	929467b3-e406-4ce3-88b1-efa783ca5989
6245a6ed-4ae3-4023-a99f-68e6c143f8d7	t	Masangano	929467b3-e406-4ce3-88b1-efa783ca5989
adf30a88-fcdc-4e59-95d4-1ffa409faf5c	t	Nyagisozi	929467b3-e406-4ce3-88b1-efa783ca5989
b9ba7046-395b-40a1-8b3c-152cd23bd338	t	Gatovu	b0950938-261a-42f8-b1b5-a2edf4fd7b5c
eeb119c7-171a-4279-85ef-5c9067eb89cd	t	Rugano	b0950938-261a-42f8-b1b5-a2edf4fd7b5c
012009b0-b206-4f66-9618-4e4fa00e5b14	t	Runege	b0950938-261a-42f8-b1b5-a2edf4fd7b5c
90f63de8-730e-4ad2-8532-557f62f74d64	t	Rusekera	b0950938-261a-42f8-b1b5-a2edf4fd7b5c
c05dfa25-5942-4289-97f4-c0a588610722	t	Sekera	b0950938-261a-42f8-b1b5-a2edf4fd7b5c
58fed7b9-4eec-4542-8dfb-8521ef9454b0	t	Buteteri	e48b71bf-daf1-43aa-aa2f-6d7aba822192
1bf13645-cdf5-436a-90cb-8a5a494b7b18	t	Cyobe	e48b71bf-daf1-43aa-aa2f-6d7aba822192
0ccd2147-20ac-4fac-a825-ef15ad30d739	t	Gashwati	e48b71bf-daf1-43aa-aa2f-6d7aba822192
ad3a78af-87d3-464d-9593-ee0d26a5e6b0	t	Bitandara	2024f584-b6c1-48f5-a429-1e0e31399785
08b8c071-7758-4b89-94d8-87f85df465bf	t	Musaraba	2024f584-b6c1-48f5-a429-1e0e31399785
8849652b-9705-4a74-baf2-d44ac508466f	t	Mutengeri	2024f584-b6c1-48f5-a429-1e0e31399785
c0f98b0c-aaf4-470e-b0b2-2ac161e2c1ad	t	Nkomane	2024f584-b6c1-48f5-a429-1e0e31399785
9c165fe2-99ef-45b5-b2b7-8510931e187b	t	Nyarwungo	2024f584-b6c1-48f5-a429-1e0e31399785
4b980882-bd07-407b-8e75-b4b3c487d3fe	t	Twiya	2024f584-b6c1-48f5-a429-1e0e31399785
59ef462f-c1f5-4d33-aca8-c638fc78c931	t	Gasarenda	a4fa0c53-6938-460b-a6c0-59c46c52317d
c2a898b8-f6c9-4d1b-a153-7b3c358a3162	t	Gatovu	a4fa0c53-6938-460b-a6c0-59c46c52317d
0f0ad195-fc8d-4508-a81e-57cb1a7cca1d	t	Kaganza	a4fa0c53-6938-460b-a6c0-59c46c52317d
1e2b9729-1a09-48af-900a-9d510dba57cf	t	Nkumbure	a4fa0c53-6938-460b-a6c0-59c46c52317d
92f5a8b6-4624-401b-897c-e574db2f9856	t	Nyamigina	a4fa0c53-6938-460b-a6c0-59c46c52317d
5abbfdc6-186e-4f09-ac4f-68e21b2b1189	t	Bigumira	d1185bfd-5ba7-4462-b7ea-4f37518c20e7
e2223389-869d-4c7d-a3d8-07f36002d759	t	Gahira	d1185bfd-5ba7-4462-b7ea-4f37518c20e7
ea562b8b-f9f4-4cc2-afbd-63f4e0e1a522	t	Kibyagira	d1185bfd-5ba7-4462-b7ea-4f37518c20e7
d0a13a95-a260-4a03-baa6-0654a6df4d16	t	Mudasomwa	d1185bfd-5ba7-4462-b7ea-4f37518c20e7
f55f91a8-7259-4b97-bdde-423f24cf6e79	t	Munyege	d1185bfd-5ba7-4462-b7ea-4f37518c20e7
719bc2f1-f945-4847-abbe-4241cafd2e2f	t	Rugogwe	d1185bfd-5ba7-4462-b7ea-4f37518c20e7
f4dc0086-9dec-4097-b407-c065d26a1404	t	Gahondo	29d9e667-7fbc-4b3b-8968-c6676479ba42
89570807-d2cc-476f-a8ce-453a4d607440	t	Kavumu	29d9e667-7fbc-4b3b-8968-c6676479ba42
66ba4f1f-2d0a-4f9f-80af-1599880c53e3	t	Kibinja	29d9e667-7fbc-4b3b-8968-c6676479ba42
2627d6e7-6165-48a3-8171-89f5cdc599a4	t	Nyanza	29d9e667-7fbc-4b3b-8968-c6676479ba42
5c020db8-e406-4f5f-a85d-d979cf6a4bf0	t	Rwesero	29d9e667-7fbc-4b3b-8968-c6676479ba42
70a0f026-e9ac-4608-9f9c-1372af770cbb	t	Gitovu	e4b591e4-9b29-484c-b6be-5cd981d1d378
359f7a62-945c-4629-9c40-f017bb0aec20	t	Kimirama	e4b591e4-9b29-484c-b6be-5cd981d1d378
b561b7d0-40da-49c3-9df0-2e77af89603a	t	Masangano	e4b591e4-9b29-484c-b6be-5cd981d1d378
6b2206de-12cc-4a9c-a16d-61693769c69a	t	Munyinya	e4b591e4-9b29-484c-b6be-5cd981d1d378
62eedf19-6978-43aa-912c-d6e0d1414f14	t	Rukingiro	e4b591e4-9b29-484c-b6be-5cd981d1d378
2893054e-91bd-4fb4-8fea-84653f57b636	t	Shyira	e4b591e4-9b29-484c-b6be-5cd981d1d378
f58d76e1-fb09-41c4-bb80-11a0038c4734	t	Kadaho	6930c77d-8bd4-4da6-b0d6-0212bebe7aa6
8cc96cc9-e11a-4e75-81ce-1dc875936db3	t	Karama	6930c77d-8bd4-4da6-b0d6-0212bebe7aa6
c58856ab-2db7-4169-a5dc-aace8ecca05a	t	Nyabinyenga	6930c77d-8bd4-4da6-b0d6-0212bebe7aa6
3b289be6-a720-4248-91eb-cc95e3fe0f7d	t	Nyarurama	6930c77d-8bd4-4da6-b0d6-0212bebe7aa6
5fde66c2-5234-4128-8f78-fea311818d3f	t	Rubona	6930c77d-8bd4-4da6-b0d6-0212bebe7aa6
7cb07092-6d4f-4ac6-8852-bbc592663ce3	t	Cyeru	c5014200-c96d-41fc-bcdf-ba51112ee66f
20faace8-a63b-4888-ba4f-9b69583cf42f	t	Mbuye	c5014200-c96d-41fc-bcdf-ba51112ee66f
bbea2a7e-21da-474e-8dcf-e1e8e6410ee0	t	Mututu	c5014200-c96d-41fc-bcdf-ba51112ee66f
87b80c92-2d15-43a9-99f7-b4604657a774	t	Rwotso	c5014200-c96d-41fc-bcdf-ba51112ee66f
d68bd4ab-b319-49cf-ad89-40b528927d5e	t	Butansinda	17738460-dff7-4929-b6a1-c6c009b85f14
912db2d1-5aa1-411b-91d4-b5a3c50202fe	t	Butara	17738460-dff7-4929-b6a1-c6c009b85f14
f08cf96d-d729-46df-97a2-0c047f5a569e	t	Gahombo	17738460-dff7-4929-b6a1-c6c009b85f14
33f860d5-7701-4e24-ad91-7cdb7f429fec	t	Gasoro	17738460-dff7-4929-b6a1-c6c009b85f14
a7da0f7f-0283-4e81-8ae0-77bbf1816666	t	Mulinja	17738460-dff7-4929-b6a1-c6c009b85f14
5c181bfb-11e2-4e00-9adb-214e9b5d79fa	t	Cyerezo	2400d1bf-a158-4fa4-ba86-2d5028ae253d
6300b0fd-fc24-4a59-8356-6c8bba843e24	t	Gatagara	2400d1bf-a158-4fa4-ba86-2d5028ae253d
387afd68-4da4-4bc6-98c0-75332e7fb104	t	Kiruli	2400d1bf-a158-4fa4-ba86-2d5028ae253d
ba85919f-65b6-40a7-a966-4c1b58b20e13	t	Mpanga	2400d1bf-a158-4fa4-ba86-2d5028ae253d
612346ee-f3d3-45cf-a672-1d1d081fa0a2	t	Ngwa	2400d1bf-a158-4fa4-ba86-2d5028ae253d
0e513155-f4ca-4c4d-9ad7-6d9d43aa883d	t	Nkomero	2400d1bf-a158-4fa4-ba86-2d5028ae253d
d40e0d39-0ada-4b36-8930-7d7af5f22968	t	Gati	0c1b7678-7914-4e4a-b841-e401a5900575
fff5760a-4a52-403c-aff1-c8c063e389c8	t	Migina	0c1b7678-7914-4e4a-b841-e401a5900575
7110203f-8eed-4c9c-8fdb-437e5cd42430	t	Nyamiyaga	0c1b7678-7914-4e4a-b841-e401a5900575
869f9e30-160e-4160-8324-cf864392fc7d	t	Nyamure	0c1b7678-7914-4e4a-b841-e401a5900575
4bab2be3-e2ea-4828-b081-7595008073da	t	Nyundo	0c1b7678-7914-4e4a-b841-e401a5900575
7b145b50-2793-430f-bd45-5c23500719ad	t	Bugali	fd6d44c6-a2ce-488b-998f-93784e65e65d
f978d674-1843-4299-baa1-bd8575f811f6	t	Cyotamakara	fd6d44c6-a2ce-488b-998f-93784e65e65d
5dab8bf9-62a0-4133-9c8f-2be8f188b4e2	t	Kagunga	fd6d44c6-a2ce-488b-998f-93784e65e65d
8967fb79-7c99-4203-8491-82a59dc14e98	t	Katarara	fd6d44c6-a2ce-488b-998f-93784e65e65d
bdfa38a5-fc87-46b5-893e-52dbb49621a2	t	Gahunga	0f252f95-6397-4b6f-907b-cbf4b57921e9
6c31c140-84a1-48b9-9725-6202d0eb5e23	t	Kabirizi	0f252f95-6397-4b6f-907b-cbf4b57921e9
dbd07124-1352-4a55-b061-5e61cc4e5eef	t	Kabuga	0f252f95-6397-4b6f-907b-cbf4b57921e9
3f155d28-d811-43f0-8b46-bad9ab3ac670	t	Kirambi	0f252f95-6397-4b6f-907b-cbf4b57921e9
5c3c9d8f-7de9-41ff-9622-1c14accecbaa	t	Rurangazi	0f252f95-6397-4b6f-907b-cbf4b57921e9
1947bf20-8539-484b-b82a-40a59c3fc481	t	Gacu	e34a9a1f-87a7-4413-8adc-5bfd8a7981ba
8298d498-66e4-4b8f-a43b-e7d8f64549d2	t	Gishike	e34a9a1f-87a7-4413-8adc-5bfd8a7981ba
a4130359-8f45-4c93-bbff-f32877a9655c	t	Mubuga	e34a9a1f-87a7-4413-8adc-5bfd8a7981ba
5e8d7cd9-c5fb-4e3b-9b9c-1ac8bfa6dc9b	t	Mushirarungu	e34a9a1f-87a7-4413-8adc-5bfd8a7981ba
81c41bc3-d9a7-4312-b614-dd2403c5307c	t	Nyarusange	e34a9a1f-87a7-4413-8adc-5bfd8a7981ba
64e4e5ca-9201-4ad0-b4c6-5a1c84ea8aa7	t	Kirarangombe	515a8bd2-55df-479e-a104-b9439708c5ba
51f64ce4-2a1a-4324-b0b9-6df216f8ce86	t	Nkanda	515a8bd2-55df-479e-a104-b9439708c5ba
d059ae2e-a378-458e-84cc-4296a7410a02	t	Nteko	515a8bd2-55df-479e-a104-b9439708c5ba
8636e6a3-fd61-4e5e-b698-eeb8cbfb27f6	t	Runyombyi	515a8bd2-55df-479e-a104-b9439708c5ba
156cf424-535b-4d4c-8674-870e08351e5a	t	Shororo	515a8bd2-55df-479e-a104-b9439708c5ba
3f329bae-f336-4508-bdff-90f52273133e	t	Coko	7e9e90ce-0ea7-4c4c-8ec7-1254dd0ca855
74433fe7-ab3b-4b57-846e-9f8d9c1b3b31	t	Cyahinda	7e9e90ce-0ea7-4c4c-8ec7-1254dd0ca855
ba105993-671b-4194-abfa-4b786de4f96f	t	Gasasa	7e9e90ce-0ea7-4c4c-8ec7-1254dd0ca855
57905c22-7229-45d1-9624-c9a1441165e9	t	Muhambara	7e9e90ce-0ea7-4c4c-8ec7-1254dd0ca855
785e2b16-5976-4b5f-8e46-ec4048ecd326	t	Rutobwe	7e9e90ce-0ea7-4c4c-8ec7-1254dd0ca855
1d0dba59-3af1-49bd-ba40-d980f6cd56d1	t	Gakoma	e23e4a47-4883-4b60-aa34-a9740e92fbae
7acfe8bb-8d35-4748-9280-f0f8877ddeb3	t	Kibeho	e23e4a47-4883-4b60-aa34-a9740e92fbae
ebf88fb6-3833-4685-86cf-16cba05ce905	t	Mbasa	e23e4a47-4883-4b60-aa34-a9740e92fbae
f71c732f-f1cb-4fab-9f62-528ce2dd1d90	t	Mpanda	e23e4a47-4883-4b60-aa34-a9740e92fbae
e1569cde-7636-4726-b1b9-e6b7de475558	t	Mubuga	e23e4a47-4883-4b60-aa34-a9740e92fbae
f66e4ef5-ce39-479a-89e4-0b9701689135	t	Nyange	e23e4a47-4883-4b60-aa34-a9740e92fbae
4423552d-ac53-4003-a4d8-4dacd3d8d4f0	t	Cyanyirankora	92462c11-354b-450d-9e08-db8f9ce8ed3d
71074210-f605-4287-a90e-64df124573ae	t	Gahurizo	92462c11-354b-450d-9e08-db8f9ce8ed3d
c10670af-5f33-4527-a85b-45d7ace59d53	t	Kimina	92462c11-354b-450d-9e08-db8f9ce8ed3d
7cf42d19-3b4b-4e1c-96e6-ffd8457cdc1d	t	Kivu	92462c11-354b-450d-9e08-db8f9ce8ed3d
ac4edaff-9096-488d-bc86-8bb62ac400b9	t	Rugerero	92462c11-354b-450d-9e08-db8f9ce8ed3d
1a341132-198b-43bc-a69e-f83200886ffb	t	Gorwe	67ba5d47-3c33-4595-b691-21f1155bd257
c0fea4ac-df30-4071-9bde-2c293eff3991	t	Murambi	67ba5d47-3c33-4595-b691-21f1155bd257
5cb6d190-6374-42ef-990c-42247ab51a0b	t	Nyamabuye	67ba5d47-3c33-4595-b691-21f1155bd257
eb0a6798-d4f2-4dfd-91d1-06e6a6015ccb	t	Ramba	67ba5d47-3c33-4595-b691-21f1155bd257
abca4f2f-3971-4fd0-9c09-744b0e7d7cfe	t	Rwamiko	67ba5d47-3c33-4595-b691-21f1155bd257
2b592fe8-1db0-424f-b8be-ed709648191b	t	Muganza	91b75011-c857-42a1-8f4f-e8cad83a8c5a
84a16805-19b7-4e7e-a269-a411bace5db0	t	Rukore	91b75011-c857-42a1-8f4f-e8cad83a8c5a
d1205896-87c3-4724-8a04-579e87155dfc	t	Samiyonga	91b75011-c857-42a1-8f4f-e8cad83a8c5a
7dae4a00-504b-468e-9d7e-313668730d5e	t	Uwacyiza	91b75011-c857-42a1-8f4f-e8cad83a8c5a
1d3207e5-9dca-4703-a8be-b792a159ff21	t	Ngarurira	96de5947-617d-4f16-8ee0-c820dfc128da
30fdb8db-785a-4e5e-a8e5-ed9f7b156ce2	t	Ngeri	96de5947-617d-4f16-8ee0-c820dfc128da
2f8015f5-0783-431c-bed3-203a3ce6df5e	t	Ntwali	96de5947-617d-4f16-8ee0-c820dfc128da
b7bb4822-5b37-4bfa-a6ac-23f766c70d46	t	Nyarure	96de5947-617d-4f16-8ee0-c820dfc128da
8a011873-ef71-4a88-a5fe-0de66dbce74e	t	Bitare	1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e
7e4a31be-ba78-49c8-87e3-7065dd73d0a2	t	Mukuge	1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e
7983746d-e82c-4597-97cd-c0ef000c54a3	t	Murama	1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e
3c7cb465-4826-4640-a0df-7bdea3d5e314	t	Nyamirama	1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e
ce159900-3371-4cca-a182-96ec984b7d6c	t	Nyanza	1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e
c5c81c8b-4d89-496c-933e-3ac37afaa13c	t	Yaramba	1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e
941b9927-b2f0-4814-b110-7884d6edec8a	t	Fugi	5fa5c972-51c8-4d0e-8b3e-fd020e7c17fe
07384228-a20e-4480-8032-f2ee44c78b3b	t	Kiyonza	5fa5c972-51c8-4d0e-8b3e-fd020e7c17fe
457580bb-baf6-493c-881a-0a6700d228cc	t	Mbuye	5fa5c972-51c8-4d0e-8b3e-fd020e7c17fe
2a40439f-64e0-4c22-a143-ab2e9bd297fe	t	Nyamirama	5fa5c972-51c8-4d0e-8b3e-fd020e7c17fe
61897e48-d0c6-44cb-ac14-5acbdb264d1b	t	Gihemvu	337023c6-e6ae-4b7b-84cd-a5998b9c1a2e
ced5a1a8-b779-4408-9cbc-16bee1064578	t	Kabere	337023c6-e6ae-4b7b-84cd-a5998b9c1a2e
a129543f-9c32-4018-a896-97740965b4e3	t	Mishungero	337023c6-e6ae-4b7b-84cd-a5998b9c1a2e
f4dbffac-433a-4ba9-be89-18446bdb03ad	t	Nyabimata	337023c6-e6ae-4b7b-84cd-a5998b9c1a2e
648bbae6-3974-4343-92bf-1573d392cfa2	t	Ruhinga	337023c6-e6ae-4b7b-84cd-a5998b9c1a2e
43961efe-7e65-428f-b916-1bb567fb4b00	t	Maraba	1c68b795-db2d-421e-89b4-9fa749820caa
0dff49ab-1673-48dd-aa7f-977616930fd6	t	Mwoya	1c68b795-db2d-421e-89b4-9fa749820caa
a7ae86ad-cd21-4c88-a5a8-5ed2650dd409	t	Nkakwa	1c68b795-db2d-421e-89b4-9fa749820caa
637d9a00-6146-48ea-a8e6-c33dce05d4c9	t	Nyagisozi	1c68b795-db2d-421e-89b4-9fa749820caa
5c0831b8-57af-4766-94b1-2e2a4d82c5c5	t	Gitita	835c392d-c535-4ada-91da-7dbb72cc3caf
99e319ea-81d8-4b52-8b0a-f0a82228276c	t	Kabere	835c392d-c535-4ada-91da-7dbb72cc3caf
5723fd1e-d8c7-4fdf-9f7b-2e6a651eeb34	t	Remera	835c392d-c535-4ada-91da-7dbb72cc3caf
dd1806af-d0aa-429d-822c-daf1734f0faf	t	Ruyenzi	835c392d-c535-4ada-91da-7dbb72cc3caf
9d43f82e-347e-4c8d-8dbc-acae194ef289	t	Uwumusebeya	835c392d-c535-4ada-91da-7dbb72cc3caf
5a6d40ac-5c09-4bc3-924b-63ec56c6beff	t	Gabiro	49ca94b6-c62b-41f3-8021-9a7c5b3b6a98
ecd76e47-cce8-4afb-a3db-c3f03853fa2a	t	Giseke	49ca94b6-c62b-41f3-8021-9a7c5b3b6a98
e9ecf79f-3890-4f52-9b4a-9766d3a6450f	t	Nyarugano	49ca94b6-c62b-41f3-8021-9a7c5b3b6a98
2d4b2829-a411-4c5a-9be8-e5dcd1c7cdee	t	Ruramba	49ca94b6-c62b-41f3-8021-9a7c5b3b6a98
3354e3f3-d887-48d1-919a-dac8bf003678	t	Bunge	292db683-7f04-4814-8ccb-49fa837677cc
ea2dad06-6efd-43a4-83fd-a8e4b3c79371	t	Cyuna	292db683-7f04-4814-8ccb-49fa837677cc
3447688c-fcb8-403c-ab06-88dcfd8aa3cf	t	Gikunzi	292db683-7f04-4814-8ccb-49fa837677cc
5c3d6d38-0a89-4d75-846d-6dc14ba3fb20	t	Mariba	292db683-7f04-4814-8ccb-49fa837677cc
c8cd6aaf-a26c-435a-b017-8eefcba8e58c	t	Raranzige	292db683-7f04-4814-8ccb-49fa837677cc
ea9258c0-bbc3-4444-995b-4077d23443eb	t	Rusenge	292db683-7f04-4814-8ccb-49fa837677cc
3450ba10-bcab-4cea-90d5-9734d5d78b8b	t	Buhanda	12f366a2-df19-40bb-b408-5d122be402d5
e6b63227-3ba5-4994-8953-c82e5cd8b8fc	t	Gitisi	12f366a2-df19-40bb-b408-5d122be402d5
254dac9d-e8ee-4b23-abe3-9ab6b8cb8b66	t	Murama	12f366a2-df19-40bb-b408-5d122be402d5
3df71cb0-c0b5-4f7f-b3b4-216630878870	t	Rubona	12f366a2-df19-40bb-b408-5d122be402d5
65c21e8a-79ed-4d01-9cd6-7a164a06f726	t	Rwinyana	12f366a2-df19-40bb-b408-5d122be402d5
fe1b2f00-9841-4d35-9c05-514d9c4926ae	t	Kamusenyi	15d2db0c-036b-4465-bf37-274ccb1e8f3c
3536aa92-67c5-4618-bb51-ea33d3c105a2	t	Kirengeri	15d2db0c-036b-4465-bf37-274ccb1e8f3c
ca8d75d3-15b2-459b-9db6-3e2cbcf72b6a	t	Mahembe	15d2db0c-036b-4465-bf37-274ccb1e8f3c
65b69639-6853-4dea-934a-c9ab58358924	t	Mpanda	15d2db0c-036b-4465-bf37-274ccb1e8f3c
36f5a214-aa22-498b-99cd-6a0bec74f9e1	t	Muhororo	15d2db0c-036b-4465-bf37-274ccb1e8f3c
3c55941e-f64a-4485-b2d5-074b91d9bcd5	t	Ntenyo	15d2db0c-036b-4465-bf37-274ccb1e8f3c
c7223032-2bb9-43a5-b819-73c25144e2ce	t	Nyakabuye	15d2db0c-036b-4465-bf37-274ccb1e8f3c
def1fb70-e7e3-45fc-ac83-6d5aa1001294	t	Bihembe	8516ee2a-5761-40e6-8de7-b08530d90691
49fdb73e-7a77-4c2f-83c2-bcb7e567c82c	t	Karambi	8516ee2a-5761-40e6-8de7-b08530d90691
411f85f6-648b-4a14-9a68-b3787d3c3527	t	Munanira	8516ee2a-5761-40e6-8de7-b08530d90691
e1d164b3-286a-40cf-b3c3-974177555af6	t	Remera	8516ee2a-5761-40e6-8de7-b08530d90691
fb611e64-2fe9-4621-866a-be0e6b703ddf	t	Rwesero	8516ee2a-5761-40e6-8de7-b08530d90691
293ec83b-e297-4ccb-8590-c14c7d05b54b	t	Rwoga	8516ee2a-5761-40e6-8de7-b08530d90691
88afe2d0-be2a-4b06-a2f2-90095ada30f7	t	Burima	8e271e8b-ae56-4e2a-875d-c7ae066fe581
1ff97262-1784-45d6-8388-9381e3207fd7	t	Gisali	8e271e8b-ae56-4e2a-875d-c7ae066fe581
fc4bb967-5450-4249-883d-2fe7e04dc2e6	t	Kinazi	8e271e8b-ae56-4e2a-875d-c7ae066fe581
ad1d9a2f-8564-4b82-8833-d5ad4da8af27	t	Rubona	8e271e8b-ae56-4e2a-875d-c7ae066fe581
010139f5-85bc-44af-9ba6-12685623382b	t	Rutabo	8e271e8b-ae56-4e2a-875d-c7ae066fe581
8af010a6-d21e-4884-8638-e41c12b3040a	t	Bweramvura	38d55516-d5bd-49ce-810f-7ba45e70815f
84ac168e-115c-4fbe-8052-4d256ae2a630	t	Gitinda	38d55516-d5bd-49ce-810f-7ba45e70815f
2e084a79-b682-48cd-9eaa-ced436b9245a	t	Kirwa	38d55516-d5bd-49ce-810f-7ba45e70815f
e1164804-a02a-4e46-bd78-9d0ba2495002	t	Muyunzwe	38d55516-d5bd-49ce-810f-7ba45e70815f
3fb30e85-b174-4897-b6ef-837d8cfdd55b	t	Nyakogo	38d55516-d5bd-49ce-810f-7ba45e70815f
aa29c432-43f6-4607-936c-22d512ef1d83	t	Rukina	38d55516-d5bd-49ce-810f-7ba45e70815f
13b16e97-a369-469c-af45-1b4eb651e1f4	t	Cyanza	0558b2f6-f15f-4d37-963f-7badbbf955c7
06fbade9-5091-4add-8564-f9e5163f74bf	t	Gisanga	0558b2f6-f15f-4d37-963f-7badbbf955c7
b8b07bb7-582f-4a8b-81e9-4d61634e0305	t	Kabuga	0558b2f6-f15f-4d37-963f-7badbbf955c7
4e06629c-1d4f-4e97-8ecd-f9eae80f0ea3	t	Kizibere	0558b2f6-f15f-4d37-963f-7badbbf955c7
735cdf32-a38a-46a1-ab9d-aef4ac7323a9	t	Mbuye	0558b2f6-f15f-4d37-963f-7badbbf955c7
47ffb123-d84d-45ed-a2a9-236553221992	t	Mwendo	0558b2f6-f15f-4d37-963f-7badbbf955c7
441d1804-d8a6-4bec-bfe7-2ad0f17950e8	t	Nyakarekare	0558b2f6-f15f-4d37-963f-7badbbf955c7
1bd17b8f-d05c-435b-a8c9-96e819c55fe9	t	Gafunzo	ceff3955-8f86-49a8-bebc-acd98a6fac59
160bf046-1bc7-413b-86c0-d7080ca037d8	t	Gishweru	ceff3955-8f86-49a8-bebc-acd98a6fac59
fad8305b-8b51-4e88-809c-cb196782afb4	t	Kamujisho	ceff3955-8f86-49a8-bebc-acd98a6fac59
65024bc2-1a24-4911-9613-6d1f26d88b0b	t	Kigarama	ceff3955-8f86-49a8-bebc-acd98a6fac59
605d2013-e3aa-49aa-8b7a-95b9451571d1	t	Mutara	ceff3955-8f86-49a8-bebc-acd98a6fac59
d4dce451-a910-49cb-a6ae-73099a5f8f7e	t	Nyabibugu	ceff3955-8f86-49a8-bebc-acd98a6fac59
c9f851cf-8238-4387-b1bf-f6113a6f94a2	t	Saruheshyi	ceff3955-8f86-49a8-bebc-acd98a6fac59
e5002f9f-a708-449b-bd36-2ae1a643c851	t	Gako	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
ce757bc3-3c93-4233-ba56-e89b190e31fd	t	Kareba	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
1d9498b2-e804-470e-9ce6-fe7db7d6d013	t	Kayenzi	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
3b0a27a8-bbc4-4f66-9a2a-985c1d8fdb45	t	Kebero	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
fb8a026b-9005-4298-becd-87633cb4b00b	t	Nyagisozi	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
8df454e8-ad3f-4e04-a56c-b86480ba893e	t	Nyakabungo	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
1803714b-49f2-460a-aabd-4319c2863617	t	Nyarurama	19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886
8cdf7a3d-0179-448e-9d1f-c6cfc98e62d6	t	Buhoro	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
76e48cfc-d6ee-4d53-92fa-174a9453b51c	t	Bunyogombe	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
96663366-0bc6-4e23-9dfd-2d8e6c2febdb	t	Gikoma	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
4ba67a5b-3970-451b-958b-bfecab0cc1f5	t	Munini	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
0c80a5a8-ec15-4f25-a7ef-e06a383d430e	t	Musamo	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
fa92fa6e-e0ca-40aa-afd4-de36b94a1dd9	t	Nyamagana	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
fe31270b-8371-44e7-9d14-b218b28d89ca	t	Rwoga	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
0630342f-aacb-4cab-b406-3ba1b37f571d	t	Tambwe	6dc00eb3-7153-4cb1-a79f-61cc58bf73e9
06e50642-5ce0-496c-b42d-01f93521b089	t	Burunga	9a653bfd-5a18-431b-b656-48bb7c909f5e
9e730a3d-bffa-41b9-af91-c0d86fe41458	t	Gasura	9a653bfd-5a18-431b-b656-48bb7c909f5e
ff69ef8a-17e0-499c-8633-f8cc73c65f82	t	Gitarama	9a653bfd-5a18-431b-b656-48bb7c909f5e
6952301f-5ee0-453b-8e66-5ab58ed5cbf4	t	Kayenzi	9a653bfd-5a18-431b-b656-48bb7c909f5e
ebc23886-7b5f-4d0c-995d-de9808722b02	t	Kibuye	9a653bfd-5a18-431b-b656-48bb7c909f5e
fc451f38-f94a-4089-9995-d7594028b899	t	Kiniha	9a653bfd-5a18-431b-b656-48bb7c909f5e
18b5e16c-d26d-4502-a89d-00e396fea18b	t	Nyarusazi	9a653bfd-5a18-431b-b656-48bb7c909f5e
3375f6c7-54c6-4fe7-9008-48be90a499fa	t	Birambo	5911f2e1-a558-4c12-981b-26e749eae8d2
dd0bcbee-6175-4c9e-ba0c-0c960f19d638	t	Tongati	5911f2e1-a558-4c12-981b-26e749eae8d2
3d4f5dc9-5dfa-41b4-bd4a-6cbf9ce2f6bc	t	Buhoro	fd790dff-bab4-44df-8484-26c51637e2e9
0c36c620-f375-4a3a-b272-9c2637a05030	t	Cyanya	fd790dff-bab4-44df-8484-26c51637e2e9
19f2dc10-58ef-44f2-8ab6-4fd8bd943c47	t	Kigarama	fd790dff-bab4-44df-8484-26c51637e2e9
f1c5287b-83ed-46c7-ae1b-5c7303aeb51c	t	Munanira	fd790dff-bab4-44df-8484-26c51637e2e9
4ffe587c-da50-4f9a-bc26-93fda946f056	t	Musasa	fd790dff-bab4-44df-8484-26c51637e2e9
d3fa8655-e2c5-4937-868e-1f1a0c1cf003	t	Ngoma	fd790dff-bab4-44df-8484-26c51637e2e9
5fb4c01d-8f1c-4a45-88fe-1305bc6a0ed3	t	Kanunga	6e4dad51-97a5-4813-9f3e-31d4ee7f3281
982725af-1fae-49b1-869b-107c761f10a3	t	Kirambo	6e4dad51-97a5-4813-9f3e-31d4ee7f3281
36eadc54-71b1-412e-94d1-68fcd4b257a4	t	Munanira	6e4dad51-97a5-4813-9f3e-31d4ee7f3281
733f98ac-5d7e-49c6-9bc9-1b5695892b82	t	Ruhinga	6e4dad51-97a5-4813-9f3e-31d4ee7f3281
d8b0ee7a-6825-4fe1-882b-2f237eebd695	t	Rwariro	6e4dad51-97a5-4813-9f3e-31d4ee7f3281
f7b33476-1f4a-48e9-aadc-1a9c760b9260	t	Kagabiro	d56ba155-8fb7-4997-ba05-7193e279a130
76ef4619-34ba-4d1d-8685-f83c8f13834b	t	Murangara	d56ba155-8fb7-4997-ba05-7193e279a130
67571a41-208d-4a95-ac92-cee0b9154c6b	t	Nyagatovu	d56ba155-8fb7-4997-ba05-7193e279a130
96ea9160-466c-46fd-b319-ea0d155e8d1a	t	Ryaruhanga	d56ba155-8fb7-4997-ba05-7193e279a130
ae2e1f11-f394-4b31-90bd-ec9921b5ce76	t	Mubuga	8518e8ed-dfea-463f-a5a6-167c43f61d36
a09427fe-8126-446b-b007-5ab608ec24ae	t	Muhororo	8518e8ed-dfea-463f-a5a6-167c43f61d36
6e12fec5-5e75-466b-b43a-2b1754d39dda	t	Nyarunyinya	8518e8ed-dfea-463f-a5a6-167c43f61d36
bbe443fd-060d-4d96-abcd-ac2eb0d82b8a	t	Shyembe	8518e8ed-dfea-463f-a5a6-167c43f61d36
6093e85a-fd9e-4bfb-8660-2a47777a3fc8	t	Kamina	51190007-fdf7-4f06-8ad5-7f189f807240
00f4d7c0-3b0f-4ab5-b1df-16a85fd5e3bb	t	Kareba	51190007-fdf7-4f06-8ad5-7f189f807240
3db1bde0-2df9-41c9-aaed-41d30ac328a6	t	Byogo	c7328e24-41d0-4d35-a35c-6a3a19ecd2ae
bc702389-1207-4d43-b498-2aba3dabbbe5	t	Bubazi	c850f18c-280d-423a-bb09-8e91817f3f77
bcb8ea7b-9f1d-44a3-bade-8faff028e8c1	t	Gacaca	c850f18c-280d-423a-bb09-8e91817f3f77
b5d4f782-e0d2-4842-a10b-b6fe1be0bd25	t	Gatovu	ad66fdd4-2952-4761-a1cf-bb0096e3e490
c4078805-fa1b-4319-b220-3466cf852899	t	Gisanze	c850f18c-280d-423a-bb09-8e91817f3f77
24e0b5d9-4fe9-47bf-8ee2-86ea095cb6fc	t	Gitwa	c850f18c-280d-423a-bb09-8e91817f3f77
da975e90-f45e-462d-8b29-fc66dfc468d7	t	Kibirizi	c850f18c-280d-423a-bb09-8e91817f3f77
97f7db3a-7ae9-4c4b-93b1-a92763efd9be	t	Nyarugenge	c850f18c-280d-423a-bb09-8e91817f3f77
edfacb8e-348d-426c-9e32-ef5185dceb1d	t	Ruragwe	c850f18c-280d-423a-bb09-8e91817f3f77
93d5616e-fe81-4ced-9d91-a57c39512d83	t	Gisiza	efd77379-27fd-4a7d-8d77-98e30bfe9ab5
09dd6484-2070-473d-9b82-9bf1e7b9c4e1	t	Mucyimba	efd77379-27fd-4a7d-8d77-98e30bfe9ab5
86c8d163-5ab1-43b1-81d1-e355c6851ccc	t	Rufungo	efd77379-27fd-4a7d-8d77-98e30bfe9ab5
3d6c5b71-a4a8-4345-8144-84c51149bc3a	t	Kinyovu	ee6fd9d5-856b-4e53-9ab1-7db9326bc0df
b4e0f4bf-c388-482b-87b7-d63f0bb93562	t	Rubona	ee6fd9d5-856b-4e53-9ab1-7db9326bc0df
023c6ea7-aea4-486d-a898-0c2767c4b7f7	t	Bigugu	b65e4899-8d71-43fc-b42d-44ae417ca61d
4da6f92f-fa5c-4086-8a4e-eefbfd667abe	t	Bisesero	b65e4899-8d71-43fc-b42d-44ae417ca61d
deae96c7-b675-4506-b70e-8975c091f81a	t	Gasata	b65e4899-8d71-43fc-b42d-44ae417ca61d
ebdd9d30-58c1-44c9-b245-97bfee961452	t	Munini	b65e4899-8d71-43fc-b42d-44ae417ca61d
e68e347a-0c6a-4b4c-b618-aed96d312234	t	Nyakamira	b65e4899-8d71-43fc-b42d-44ae417ca61d
99871166-8ade-480f-8434-5d20c10140c4	t	Nyarusanga	b65e4899-8d71-43fc-b42d-44ae417ca61d
45b41f8d-262b-48db-9acd-22fe9ea82cf7	t	Rubazo	b65e4899-8d71-43fc-b42d-44ae417ca61d
1e08c89c-038c-43bf-a067-5b07dff6b7d5	t	Bihumbe	ffb75e43-ace4-439c-9dc8-b7cc72558068
0489cfdb-484c-4624-b476-1c30f30444f1	t	Gakuta	ffb75e43-ace4-439c-9dc8-b7cc72558068
eee7bc0b-0f48-4df9-800a-a8572bee62b3	t	Gisovu	ffb75e43-ace4-439c-9dc8-b7cc72558068
31c35760-5441-4963-b426-0d311c88fffb	t	Gitabura	ffb75e43-ace4-439c-9dc8-b7cc72558068
85ff4954-a266-4cc2-95c2-c76ada8918da	t	Murehe	ffb75e43-ace4-439c-9dc8-b7cc72558068
82ef7a95-5786-44ab-b169-cc5decddcaa1	t	Bungwe	74bf8232-8107-4d82-b79f-d598e84295fc
5a5acb63-ee76-4012-bfd1-8308caec7e5b	t	Gashubi	74bf8232-8107-4d82-b79f-d598e84295fc
170b6f28-b480-4fcd-b51b-79dc9b5a114c	t	Kabarondo	74bf8232-8107-4d82-b79f-d598e84295fc
cd404df6-800a-4d62-8a80-eb78e7900b6d	t	Cyome	56a61911-7500-4aa0-b818-dd897228c6e4
586e9c50-0cac-4591-9bcd-1c86c11ed9e3	t	Gatsibo	56a61911-7500-4aa0-b818-dd897228c6e4
5c9d7d59-8216-42f9-b8af-fc020e3329ac	t	Kamasiga	56a61911-7500-4aa0-b818-dd897228c6e4
29a3f998-33d5-48b6-a839-f9ea186c81b7	t	Karambo	56a61911-7500-4aa0-b818-dd897228c6e4
b2cdb9a4-9ea6-4b1d-ac92-c8ddbc4fedf9	t	Ruhanga	56a61911-7500-4aa0-b818-dd897228c6e4
c013f99c-ea7e-4e73-aeab-848a8ef408bb	t	Rusumo	56a61911-7500-4aa0-b818-dd897228c6e4
71658468-11ef-4fc7-adff-3dca5448b85c	t	Gatare	7f7a0d09-fcb2-43f0-b941-39b4507e9517
c52dfc94-861a-42fd-ab51-fa9fa82b73ea	t	Gatega	7f7a0d09-fcb2-43f0-b941-39b4507e9517
03c9cf72-a998-4104-8312-2bd65ef3b689	t	Kajinge	7f7a0d09-fcb2-43f0-b941-39b4507e9517
124e9af9-fc19-4ef5-a29e-da47210209f4	t	Marantima	7f7a0d09-fcb2-43f0-b941-39b4507e9517
fefcb4c4-919f-4a18-90b1-d2a56d1f7a52	t	Rugendabari	7f7a0d09-fcb2-43f0-b941-39b4507e9517
cde976ec-28c6-4e9d-877c-b3db22f2ff5c	t	Busunzu	b4bc0bd4-6443-4f06-9db9-78b37acbc229
4a4dfe09-2c57-4dba-893b-e0b9ad3a6154	t	Gaseke	b4bc0bd4-6443-4f06-9db9-78b37acbc229
63f08127-dc36-41e9-a318-63213ae12caf	t	Kabaya	b4bc0bd4-6443-4f06-9db9-78b37acbc229
c2b54c07-a502-4787-b753-892285868940	t	Mwendo	b4bc0bd4-6443-4f06-9db9-78b37acbc229
2ffcd141-29df-4e5f-a134-2abd0c874be9	t	Ngoma	b4bc0bd4-6443-4f06-9db9-78b37acbc229
3da8bdfc-f9f5-42c8-b52d-63b1d21b453b	t	Nyenyeri	b4bc0bd4-6443-4f06-9db9-78b37acbc229
2db868d2-18fa-4cb0-b029-f15182456993	t	Kageshi	193ca3fc-f8eb-4352-99b8-f53ebcf58f8b
175f6736-3418-4f58-a40b-0cbfa53fab33	t	Mukore	193ca3fc-f8eb-4352-99b8-f53ebcf58f8b
01874478-101a-4788-96b8-cd8c5b966939	t	Muramba	193ca3fc-f8eb-4352-99b8-f53ebcf58f8b
2141b7bd-574d-4a03-a4a8-1a77fc12ba37	t	Nyamata	193ca3fc-f8eb-4352-99b8-f53ebcf58f8b
5bb842bb-6dac-468a-92b7-6170c74560c0	t	Rwamamara	193ca3fc-f8eb-4352-99b8-f53ebcf58f8b
1c538910-db1f-4db6-88f3-45129f977445	t	Birembo	61f242f5-9aaa-47b9-9edb-73620c006450
b0e55656-96e4-486f-b245-b5fdf9e37559	t	Gitwa	61f242f5-9aaa-47b9-9edb-73620c006450
cf5466af-87e5-441d-bd7b-81e44c66b7f3	t	Murinzi	61f242f5-9aaa-47b9-9edb-73620c006450
1f207ac7-2a3b-4ebf-9bc4-134265fd31d6	t	Nyamugeyo	61f242f5-9aaa-47b9-9edb-73620c006450
a6d4f2b9-a6d7-4087-851c-a4fd20d4b3c3	t	Rugeshi	61f242f5-9aaa-47b9-9edb-73620c006450
c4bdda45-312a-4be4-8b4a-ecf42b6dead2	t	Tetero	61f242f5-9aaa-47b9-9edb-73620c006450
d743704c-ad64-4d5f-ad7c-8910a36bc0e2	t	Binana	6965f5aa-f8ff-43ec-9cae-bcbe750190b7
2c18cce9-3e82-4129-8366-92bce146cb11	t	Gitega	6965f5aa-f8ff-43ec-9cae-bcbe750190b7
c72a5926-a197-454c-a425-f52f84d74c1a	t	Matare	6965f5aa-f8ff-43ec-9cae-bcbe750190b7
6578bd06-ff58-46e7-a454-215f1c80c525	t	Rutare	6965f5aa-f8ff-43ec-9cae-bcbe750190b7
8a73742a-b866-4822-a940-b9815007a6ad	t	Rwamiko	6965f5aa-f8ff-43ec-9cae-bcbe750190b7
3bf3a136-b285-4559-ac78-66b5eeaf73df	t	Bugarura	23f40805-ab2f-4768-8f48-91d4c5cc43e5
14c34249-e0a3-41c9-baf5-c33cc1dbc946	t	Gasiza	23f40805-ab2f-4768-8f48-91d4c5cc43e5
52f239c8-bb26-457a-8336-eca97f44ce22	t	Mashya	23f40805-ab2f-4768-8f48-91d4c5cc43e5
2dba63d0-79db-4bc8-8fe6-c1470d1cfc10	t	Nganzo	23f40805-ab2f-4768-8f48-91d4c5cc43e5
119cd1f5-49c1-4129-9de0-b75639a77f20	t	Ngoma	23f40805-ab2f-4768-8f48-91d4c5cc43e5
bd6f4c49-22aa-44df-96cb-603ac948f660	t	Rutagara	23f40805-ab2f-4768-8f48-91d4c5cc43e5
151c928a-db56-41e1-92ea-c6c31fe94986	t	Mubuga	644f7cef-a4a8-4370-b9eb-3240fc7555f8
8d133c7b-cf60-42d9-be45-53916a8a7ca5	t	Rugogwe	644f7cef-a4a8-4370-b9eb-3240fc7555f8
df815002-5463-4ab9-862b-030b9626971d	t	Rusororo	644f7cef-a4a8-4370-b9eb-3240fc7555f8
4b09a7b5-505a-42df-9b85-366eb9cd8525	t	Sanza	644f7cef-a4a8-4370-b9eb-3240fc7555f8
82cda267-5c24-490b-ac65-95b6ee8772b5	t	Bijyojyo	fd1a8786-e39f-4288-ac47-b43aedfa495f
082ec884-1275-433d-9b97-bc0218dc6cc1	t	Bitabage	fd1a8786-e39f-4288-ac47-b43aedfa495f
725e3ddf-13ae-453a-aad1-57b62330252c	t	Kabageshi	fd1a8786-e39f-4288-ac47-b43aedfa495f
d3a04cad-da6f-498a-9099-158a4dc3924e	t	Kibanda	fd1a8786-e39f-4288-ac47-b43aedfa495f
c344a5c5-2be1-4b22-a489-403dbf9213de	t	Kinyovi	fd1a8786-e39f-4288-ac47-b43aedfa495f
61085cee-c2af-4675-a1d5-5a43ba49bb3a	t	RKaseke	708e5663-3723-4647-b57f-55bbe91e191a
4dd5732a-2ca5-4dbc-bbc1-92bd37fd63c0	t	RKazabe	708e5663-3723-4647-b57f-55bbe91e191a
c200aff1-250c-4080-9ec1-16454b9ff05c	t	RMugano	708e5663-3723-4647-b57f-55bbe91e191a
abd2f9e6-0212-45c2-bcf4-41118a35c95a	t	RRususa	708e5663-3723-4647-b57f-55bbe91e191a
f4e10f90-a5ab-4ab7-bdae-d8edd2ef428c	t	RTorero	708e5663-3723-4647-b57f-55bbe91e191a
a611f7d4-3419-44ce-bbbd-ec1b200e2cb7	t	Bambiro	fd1840bc-0860-49ca-8325-d9e80e00164f
429f4142-bc17-4967-9f07-cc2840c149a0	t	Gaseke	fd1840bc-0860-49ca-8325-d9e80e00164f
78809bf0-3494-4666-8df0-3df921b391cd	t	Nsibo	fd1840bc-0860-49ca-8325-d9e80e00164f
26ea2ced-0d1e-4fc6-9d89-dbed10ae64b4	t	Vuganyana	fd1840bc-0860-49ca-8325-d9e80e00164f
3870e813-8e90-4bd0-8c92-74eea083a969	t	Birembo	ebf96b6a-29ac-44a4-8054-7cf797b03864
f531462b-6e66-40ba-90ca-ffb079784521	t	Kagano	ebf96b6a-29ac-44a4-8054-7cf797b03864
c503f200-767e-4bc1-bd65-0454d703adad	t	Nyabipfura	ebf96b6a-29ac-44a4-8054-7cf797b03864
e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d	t	Arusha	e32e40e9-8223-4bae-a68d-8bdd1d05d6b2
09195c52-e93e-4899-975e-5aa10f4afaad	t	Basumba	e32e40e9-8223-4bae-a68d-8bdd1d05d6b2
66c12866-1b54-426d-9b7e-83372b3cbc26	t	Kijote	e32e40e9-8223-4bae-a68d-8bdd1d05d6b2
3d8502a8-ceef-416f-83c7-8ee3cbb9cc40	t	Kora	e32e40e9-8223-4bae-a68d-8bdd1d05d6b2
1ace4911-a002-4f9b-9582-24f7bb56e351	t	Muhe	e32e40e9-8223-4bae-a68d-8bdd1d05d6b2
46bcb3b1-5069-454d-a3a9-3ed46d2d0804	t	Rega	e32e40e9-8223-4bae-a68d-8bdd1d05d6b2
e9c6fb70-46c4-4a9e-b5ed-628075973d2e	t	Bukinanyana	fbf4749d-236b-40db-8a61-cfc3efa869b4
afaba8d8-1be5-4209-a484-d277fe15f126	t	Gasizi	fbf4749d-236b-40db-8a61-cfc3efa869b4
9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a	t	Kabatezi	fbf4749d-236b-40db-8a61-cfc3efa869b4
b7338785-b926-4b7d-b5d6-c5e54d3aba1f	t	Kareba	fbf4749d-236b-40db-8a61-cfc3efa869b4
f00c236b-5bf3-4f8d-b224-860f065e1b0d	t	Nyirakigugu	fbf4749d-236b-40db-8a61-cfc3efa869b4
d0e8ea9b-6d85-4939-8b25-471d5c41a3fa	t	Rega	fbf4749d-236b-40db-8a61-cfc3efa869b4
6a3c53c2-08cd-4f73-8436-f7bb300aaff8	t	Gasiza	b8da4b24-2672-4223-abcf-bb658b27dc38
3e32a6ef-8242-4838-bee3-8a7419697cae	t	Gasura	b8da4b24-2672-4223-abcf-bb658b27dc38
1307ea79-72eb-4ffb-84f1-f454316ce25b	t	Gisizi	b8da4b24-2672-4223-abcf-bb658b27dc38
8231b467-06b0-4e4c-9748-76b5e95e8e20	t	Guriro	b8da4b24-2672-4223-abcf-bb658b27dc38
a6aa448c-7ad3-465f-91c6-3848c5cce7d7	t	Kavumu	b8da4b24-2672-4223-abcf-bb658b27dc38
5014d489-4bab-4334-aabc-f5768e615a98	t	Nyamitanzi	b8da4b24-2672-4223-abcf-bb658b27dc38
97d7cbd6-5db2-4f9b-8bae-c8a6c807670e	t	Batikoti	14daa264-063c-4fdd-8b6d-d3aae7ad5d59
ecbc750c-2fe2-4ee1-bdea-bcbbdc453f4c	t	Cyamvumba	14daa264-063c-4fdd-8b6d-d3aae7ad5d59
3021ce04-4d96-4056-b692-c157bdf98845	t	Gihorwe	14daa264-063c-4fdd-8b6d-d3aae7ad5d59
cc6a9658-fd3a-4197-806b-7721022effda	t	Myuga	14daa264-063c-4fdd-8b6d-d3aae7ad5d59
b98c6a2b-7fd9-4f15-b752-50d9a34ad43d	t	Ngando	14daa264-063c-4fdd-8b6d-d3aae7ad5d59
956510bc-d77d-4a58-96a2-e8c63c57ba89	t	Rugarama	14daa264-063c-4fdd-8b6d-d3aae7ad5d59
f986f9d2-6504-413d-9989-f03e882e6cdb	t	Cyamabuye	9931f4e8-2853-49f3-9c13-b2d854897dea
7aab640c-83a4-442d-815a-056aaf9887c4	t	Gihirwa	9931f4e8-2853-49f3-9c13-b2d854897dea
7d181aa0-978d-43e7-b3b0-a8012531cdc5	t	Kadahenda	9931f4e8-2853-49f3-9c13-b2d854897dea
c4617898-0c91-4eae-b245-fa08693d04f0	t	Rukondo	ad66fdd4-2952-4761-a1cf-bb0096e3e490
cc58f016-2592-407d-a993-2426ada81edc	t	Gasizi	cc6d039b-1941-4908-ba77-bef631d02965
84f95ff9-da30-4903-b5f2-cdb6d73418c3	t	Jaba	cc6d039b-1941-4908-ba77-bef631d02965
62075b20-1173-4a3b-bd24-206d0e6fdac3	t	Kanyove	cc6d039b-1941-4908-ba77-bef631d02965
525c1177-dd35-4037-8856-489acb0e1f75	t	Rubaya	cc6d039b-1941-4908-ba77-bef631d02965
14bd2e2b-0a22-472c-b2e2-1c2ff61c73a6	t	Rugeshi	cc6d039b-1941-4908-ba77-bef631d02965
fd66c513-4962-492c-b0d9-6f5e22f9497a	t	Rurengeri	cc6d039b-1941-4908-ba77-bef631d02965
2803ef1c-a57a-4c98-bc04-bb9fc9153bfb	t	Gisizi	db8c7792-42e9-407e-8573-4b6b812cf7e3
e26449e7-143c-4483-b4f6-8d304f0f452b	t	Mulinga	db8c7792-42e9-407e-8573-4b6b812cf7e3
778d61f7-4933-4c6a-94e5-6f43584c1286	t	Mwiyanike	db8c7792-42e9-407e-8573-4b6b812cf7e3
a68a0b5a-215d-43d2-98a1-f4f26cc37286	t	Nkomane	db8c7792-42e9-407e-8573-4b6b812cf7e3
190de93e-84a5-4219-8fff-7c2bc726ad22	t	Nyamasheke	db8c7792-42e9-407e-8573-4b6b812cf7e3
d7ba3bf1-04ee-406d-8f00-10251b03d6e8	t	Rwantobo	db8c7792-42e9-407e-8573-4b6b812cf7e3
b4020caa-e837-408c-8408-8d983b9ee229	t	Birembo	126befa4-d54f-4e49-b2cd-ea0359b78401
fdcd5a2d-c4aa-4b09-8531-177d80009d60	t	Kibisabo	126befa4-d54f-4e49-b2cd-ea0359b78401
7c43c6a1-ff30-4d40-b631-a10700d69bd1	t	Mutaho	126befa4-d54f-4e49-b2cd-ea0359b78401
cddbd9ac-bb77-42e3-a049-de14a66543e7	t	Nyundo	126befa4-d54f-4e49-b2cd-ea0359b78401
f9bf8395-74ff-4868-a2d2-64000d647f48	t	Rugamba	126befa4-d54f-4e49-b2cd-ea0359b78401
bbf64ad3-5321-4b0e-81fb-dd407b01880a	t	Gakoro	8a02a194-8892-47dc-ab56-52b47d4d9f2a
bb56328f-334b-49ae-9e91-ee1f79c36623	t	Nyagahondo	8a02a194-8892-47dc-ab56-52b47d4d9f2a
c39f53e9-55b1-4eda-8372-ddf5dd4a130d	t	Nyarutembe	8a02a194-8892-47dc-ab56-52b47d4d9f2a
a60f65af-26d0-4240-8c48-f9cea24521af	t	Rurembo	8a02a194-8892-47dc-ab56-52b47d4d9f2a
d88f2267-b483-4e64-9e05-a49d701ddcfc	t	Tyazo	8a02a194-8892-47dc-ab56-52b47d4d9f2a
968918b5-12a3-42c8-8b9c-5531b3c9e1f9	t	Gitega	df94e984-95d6-4f30-a76f-16e8b11331c3
df9417f7-9e3f-4950-90dd-76060e679717	t	Murambi	df94e984-95d6-4f30-a76f-16e8b11331c3
6f6481c3-2037-4092-8e57-b58de812dd2f	t	Mwana	df94e984-95d6-4f30-a76f-16e8b11331c3
65b18c8e-b11b-415d-87dd-73f3033277a6	t	Rwaza	df94e984-95d6-4f30-a76f-16e8b11331c3
d4777f70-5062-4f7f-9b4c-f67f5423be4f	t	Cyimanzovu	a0b10518-fd4b-4c80-a9cf-a7066644387e
072ace67-cc9b-4d82-b1db-5c21cf5c9fe8	t	Kanyamitana	a0b10518-fd4b-4c80-a9cf-a7066644387e
f584b14d-eec1-45d7-85be-d4bbc16eb7e4	t	Kintarure	a0b10518-fd4b-4c80-a9cf-a7066644387e
eeab64b3-02b8-424b-97fe-ed527ca2d5b4	t	Mpinga	a0b10518-fd4b-4c80-a9cf-a7066644387e
11fccd4f-58a1-4ffb-83c6-bc301ecfca65	t	Mutanda	a0b10518-fd4b-4c80-a9cf-a7066644387e
c97f7418-ca85-4a12-9d60-b9e185c2e07f	t	Shaki	a0b10518-fd4b-4c80-a9cf-a7066644387e
18caf7ce-0340-44cc-9b40-52da6c0dce9c	t	Buvungira	d28c93c1-5fc3-4d54-908c-81ee515d5b09
af428a92-e1c3-4330-8efe-d151924a2a96	t	Nyarusange	d28c93c1-5fc3-4d54-908c-81ee515d5b09
c12e0d21-a493-4f5d-9608-bfdaf991265c	t	Gasheke	ea43d49f-44bd-477e-8d7e-c4a1d28b4586
059b8e06-ea4a-4299-a442-61ff1c4138b2	t	Impala	ea43d49f-44bd-477e-8d7e-c4a1d28b4586
0cecdc62-51ae-4516-826f-cca62cf9b8a6	t	Kagatamu	ea43d49f-44bd-477e-8d7e-c4a1d28b4586
164d4398-2750-4183-b10e-4f4d75e29f6f	t	Karusimbi	ea43d49f-44bd-477e-8d7e-c4a1d28b4586
1675e90b-c693-40f8-bbab-d7d7a3fd1cb0	t	Murambi	cc21ac7e-c429-41b7-8bfc-dcb5c6306ad0
024ffebd-47bf-4afa-b2b0-1ef6e23bd00d	t	Mutongo	cc21ac7e-c429-41b7-8bfc-dcb5c6306ad0
3d38ad78-b2c3-407c-9f12-4727120cd1fa	t	Butare	79845127-f4ad-4f86-a4c2-5b2b623ebc6e
47dbd4c2-d250-4b45-a3c4-e7fa1c934aaf	t	Gitwa	79845127-f4ad-4f86-a4c2-5b2b623ebc6e
0b569b31-ad00-498e-8b3a-8facef5a1e68	t	Jarama	79845127-f4ad-4f86-a4c2-5b2b623ebc6e
c09aead7-a339-4250-af8d-fd366fdb76e5	t	Kibingo	79845127-f4ad-4f86-a4c2-5b2b623ebc6e
e0297f03-fc4f-4b35-8954-c89832506a6d	t	Mubuga	79845127-f4ad-4f86-a4c2-5b2b623ebc6e
9d429d4a-6631-4119-a470-4e2307ca6935	t	Gako	ab942cf3-68d3-4a58-abfe-814a8b9ca1e8
80e3b37c-7925-450b-8b48-edf6740d2274	t	Mubumbano	ab942cf3-68d3-4a58-abfe-814a8b9ca1e8
e7ff6a11-b28d-499e-b4bc-a43c8fe22941	t	Ninzi	ab942cf3-68d3-4a58-abfe-814a8b9ca1e8
cea6ad83-3072-4561-a18c-726e75cbe587	t	Rwesero	ab942cf3-68d3-4a58-abfe-814a8b9ca1e8
a5e669c2-3abf-4f49-aae7-7fce58cd441e	t	Shara	ab942cf3-68d3-4a58-abfe-814a8b9ca1e8
c050cf32-84c5-476c-86ce-7729a743ad40	t	Kibogora	e36cef8f-da9f-4a78-a084-49579b0964cb
72c522dc-38aa-48f9-a45f-c71446a988c3	t	Kigarama	e36cef8f-da9f-4a78-a084-49579b0964cb
cd8993bd-f510-4970-9dfc-f40ab2e6eda2	t	Kigoya	e36cef8f-da9f-4a78-a084-49579b0964cb
fff987fd-8349-4d9e-a0ae-17ff25d36811	t	Raro	e36cef8f-da9f-4a78-a084-49579b0964cb
375b8d89-5797-4d11-a1bb-30a4f011aa82	t	Susa	e36cef8f-da9f-4a78-a084-49579b0964cb
76c1aaf6-781d-4624-98ca-317568e4a094	t	Gasovu	5689e1f2-00d3-4114-8367-ba30365c9a8e
7807fcbf-e00e-45f5-94c4-ed92ed56251b	t	Kabuga	5689e1f2-00d3-4114-8367-ba30365c9a8e
542c3015-b94e-419e-be29-2d38b5ed7e32	t	Kagarama	5689e1f2-00d3-4114-8367-ba30365c9a8e
fe1cd7bd-1829-4484-b168-d29163972227	t	Rushyarara	5689e1f2-00d3-4114-8367-ba30365c9a8e
53e97db6-30b3-4cb9-b742-a10439940659	t	Gasayo	f9329ad8-a9d8-4658-8b1e-1eceafbee1b4
3a67df7e-173a-415b-8313-723b24a240a0	t	Gashashi	f9329ad8-a9d8-4658-8b1e-1eceafbee1b4
7bb8185e-9c50-4422-aa9e-f086061932d5	t	Higiro	f9329ad8-a9d8-4658-8b1e-1eceafbee1b4
e20773b9-eed6-4000-a71a-2a87ad6c8785	t	Miko	f9329ad8-a9d8-4658-8b1e-1eceafbee1b4
8c138796-debc-4ad6-96fb-f043eeab912a	t	Mwezi	f9329ad8-a9d8-4658-8b1e-1eceafbee1b4
8a4f904a-222a-4f2f-af0f-7d3b64e91935	t	Cyimpindu	339e0ff4-0995-44a4-bf5a-a7297ef190bf
c7212472-07f6-40b7-9588-2d676015bcb5	t	Karengera	339e0ff4-0995-44a4-bf5a-a7297ef190bf
16c3c207-4926-4398-b171-b4d4d822a2ae	t	Nyarusange	339e0ff4-0995-44a4-bf5a-a7297ef190bf
b44d0d5c-e432-41b9-8434-bbd8db6fcc6c	t	Gatare	276e4ec4-9f0b-4b34-a2d8-1bd759fc15ab
300685f4-1adb-432d-82f8-f58bb63cd5e8	t	Mutongo	276e4ec4-9f0b-4b34-a2d8-1bd759fc15ab
8dbf8063-6cdf-4890-a467-25d303b75692	t	Nyakabingo	276e4ec4-9f0b-4b34-a2d8-1bd759fc15ab
1747384b-7baa-4ba9-9bc7-0f335b8a39a0	t	Rugari	276e4ec4-9f0b-4b34-a2d8-1bd759fc15ab
ac8b1552-192d-48ec-9e46-fdefc70f9365	t	Vugangoma	276e4ec4-9f0b-4b34-a2d8-1bd759fc15ab
aa2adf71-f75c-4f19-bff7-0be2996a8856	t	Gisoke	8b7a3720-bbba-4f5e-80ed-8814bf26ad05
94a8232b-3a7a-462e-960e-1d8c77b703fb	t	Kagarama	8b7a3720-bbba-4f5e-80ed-8814bf26ad05
dd93337d-e070-4ecd-aaa4-e2d56b216892	t	Nyagatare	8b7a3720-bbba-4f5e-80ed-8814bf26ad05
bcaadcf2-9a4e-48e4-8e25-6951e94a871e	t	Nyakavumu	8b7a3720-bbba-4f5e-80ed-8814bf26ad05
d9542e31-18fe-4ebf-b191-afc8ad71d135	t	Kigabiro	0fc55ad8-332e-4e80-af44-01bd3e56feb0
94b9d030-eba5-4fda-a24c-0015e4b15cc3	t	Kinunga	0fc55ad8-332e-4e80-af44-01bd3e56feb0
f55a8031-2b03-4785-beac-57f9cef4efbb	t	Mariba	0fc55ad8-332e-4e80-af44-01bd3e56feb0
76e20690-0b90-4ebe-bdbf-59cc8dbe8178	t	Muyange	0fc55ad8-332e-4e80-af44-01bd3e56feb0
0426dac6-9f48-443e-ab2a-0f7e07288ae1	t	Ntango	0fc55ad8-332e-4e80-af44-01bd3e56feb0
1cfaf7f5-e83d-4712-8ed2-2bef3502c20f	t	Jurwe	210d7da6-fdc8-41d7-b364-368d43a39e75
bc228875-6668-450c-9417-667f2071f5c2	t	Murambi	210d7da6-fdc8-41d7-b364-368d43a39e75
d0b25ffc-3d9c-459c-a546-52596f10be4d	t	Kanazi	05ce52d0-d04a-47d9-b420-34f9bbd0bd21
04528616-8782-45fa-852e-5c4a8af6fb5b	t	Ntendezi	05ce52d0-d04a-47d9-b420-34f9bbd0bd21
af0228f7-282d-4a70-9d33-53f95bff19b2	t	Save	05ce52d0-d04a-47d9-b420-34f9bbd0bd21
2b2827ba-6a11-4850-942f-e9313ff3ed6e	t	Wimana	05ce52d0-d04a-47d9-b420-34f9bbd0bd21
647e72f9-07f6-4b21-8a22-672f57264acc	t	Burimba	c0115f65-a5a4-4ab2-8921-97e419e7b03d
7c2e8e25-5d33-4f08-bb4b-0d9213cec640	t	Mataba	c0115f65-a5a4-4ab2-8921-97e419e7b03d
1ee34485-af0f-45fa-a1f6-974451e693b3	t	Mugera	c0115f65-a5a4-4ab2-8921-97e419e7b03d
a5b729ba-a51a-4214-b9ad-f924e9011913	t	Nyamugari	c0115f65-a5a4-4ab2-8921-97e419e7b03d
b3041454-9088-4d21-8c0e-2d4c9b789e3a	t	Shangi	c0115f65-a5a4-4ab2-8921-97e419e7b03d
f6fd622a-d90a-4581-8392-9faff93ffc0f	t	Buringo	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
f674b7fb-72e1-483a-89ae-dbcc6c8c3495	t	Butaka	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
f26713d6-224d-47c5-b1b8-6e76b3a5a124	t	Hehu	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
273a5546-b6ac-4331-b659-8bc869083e2b	t	Kabumba	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
7276cd56-632c-42eb-9ef9-d1784f1f6ea7	t	Mutovu	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
837f8811-53c2-4b61-88b5-0ef610a1b040	t	Nsherima	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
1a205f87-0d77-496d-8150-5a02aacf4ac9	t	Rusiza	8dfa9c68-f2d3-494a-b8f7-4ea75e79d213
97452734-6963-4e80-861c-cea8b7ef8fa2	t	Gacurabwenge	22fd172e-63a0-4b03-b99f-982321be7280
f7727b55-7d43-4b5c-a167-a8e782dde7c8	t	Gasiza	22fd172e-63a0-4b03-b99f-982321be7280
c086aba0-af28-446c-a615-766b8cfa2dc4	t	Gihonga	22fd172e-63a0-4b03-b99f-982321be7280
729d463a-e0c5-469b-b26d-eae536ea801e	t	Kageshi	22fd172e-63a0-4b03-b99f-982321be7280
ddef402b-8da9-43c2-aa5d-ec5fb0f2ba6d	t	Makoro	22fd172e-63a0-4b03-b99f-982321be7280
0e4dae82-1825-45a3-bfe9-6f6c833b8876	t	Nyacyonga	22fd172e-63a0-4b03-b99f-982321be7280
325615d7-081e-43d8-9fd6-2fa43a8276fb	t	Rusura	22fd172e-63a0-4b03-b99f-982321be7280
9136dbe7-f290-4b9b-94c3-4e54111307d0	t	Busigari	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
4fcc7a53-b593-437d-83bd-48353e4c928f	t	Cyanzarwe	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
43ad7961-7ec5-4b6f-bb71-684177018fd2	t	Gora	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
8b5d9638-2b12-4183-8ca1-78c06151df6f	t	Kinyanzovu	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
f31d9861-35c7-4b13-801d-cc4e5990c2c0	t	Makurizo	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
adb9e0dc-3161-45ee-bb98-05247a772a5e	t	Rwangara	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
e9932cb5-5b8a-4a11-b3ef-4c9b240dd156	t	Rwanzekuma	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
1c409088-3254-4a43-bb0f-7d3a2c7f937f	t	Ryabizige	bb917d4c-97d5-436f-9cc7-88f6c8bddf3f
55ade7dc-1043-46fa-8d21-44fa8fb034b4	t	Amahoro	9603998b-259d-495e-a4b7-7c195e2c8400
03050180-0ace-41c9-8437-c07a5f17c797	t	Bugoyi	9603998b-259d-495e-a4b7-7c195e2c8400
8fb6ebb8-ad44-426e-bac2-1a47a5637297	t	Kivumu	9603998b-259d-495e-a4b7-7c195e2c8400
fc2ab273-fbc9-49cd-ad55-787a738de632	t	Mbugangari	9603998b-259d-495e-a4b7-7c195e2c8400
e742443a-21b0-40a4-ba08-80612c2980fd	t	Nengo	9603998b-259d-495e-a4b7-7c195e2c8400
6e196c32-fa01-42c2-9666-0b5bc352c983	t	Rubavu	9603998b-259d-495e-a4b7-7c195e2c8400
38c74439-1865-44fc-9188-63012f2afe7b	t	Umuganda	9603998b-259d-495e-a4b7-7c195e2c8400
0d4e85fb-84b4-4257-8efb-1206a01747b3	t	Kamuhoza	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
229912a9-6ded-4c5c-ae52-729cb022b01b	t	Karambo	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
1924aff4-cf93-4dcc-a24d-8d88d830acf7	t	Mahoko	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
6c39a762-c74e-4a35-9af8-c2df6f90e541	t	Musabike	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
08464b03-0d94-400a-8f51-fe0285121566	t	Nkomane	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
657759e5-8a6d-4098-98e4-bea48af213d5	t	Rusongati	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
bbd031ce-8d32-46fc-b1bd-c344e73fe89e	t	Yungwe	bb42e1ef-d6cf-4f11-b250-d6dbb79277f0
90cd6bf2-bffa-47ed-b559-cc5f93fed72e	t	Kanyirabigogo	0776c9d8-43a7-4141-a1d1-a0de08271e4f
ada937e0-37ee-4add-a070-4f0a92ffd1d8	t	Kirerema	0776c9d8-43a7-4141-a1d1-a0de08271e4f
2f8fc502-244d-449f-94be-f8d5cb9d5c96	t	Nyamikongi	0776c9d8-43a7-4141-a1d1-a0de08271e4f
c752af96-a21f-49be-97ae-ac972e8492a5	t	Nyamirango	0776c9d8-43a7-4141-a1d1-a0de08271e4f
8a065958-0b27-457a-8e02-561c2fafd563	t	Nyaruteme	0776c9d8-43a7-4141-a1d1-a0de08271e4f
7e1f4f28-1474-4708-96d9-1b70a9c06f5f	t	Bihungwe	4d7c0a6b-68a3-4849-85f0-36767d24ba82
2a03e9d5-8145-4bb4-aaa1-829d3327d31b	t	Kanyundo	4d7c0a6b-68a3-4849-85f0-36767d24ba82
682547e2-7776-4aa1-8b79-27968139a628	t	Micinyiro	4d7c0a6b-68a3-4849-85f0-36767d24ba82
9eb86f26-72b6-473d-b931-cbe6771645fc	t	Mirindi	4d7c0a6b-68a3-4849-85f0-36767d24ba82
42d103db-ab92-4cc9-8529-a95018c02de4	t	Ndoranyi	4d7c0a6b-68a3-4849-85f0-36767d24ba82
92a98898-8eb7-476b-bce8-6353225221f7	t	Rungu	4d7c0a6b-68a3-4849-85f0-36767d24ba82
ad0c68a5-c0a6-4962-b7cf-4755fef22294	t	Rwanyakayaga	4d7c0a6b-68a3-4849-85f0-36767d24ba82
90bf6f48-2862-4838-ac42-55e35b28f4f2	t	Bisizi	a734fdf4-a4c8-4a28-91b1-df69d65780d9
948138e8-cd1c-4661-a796-dc229511794b	t	Gikombe	a734fdf4-a4c8-4a28-91b1-df69d65780d9
ead505da-54fe-42e8-91ce-c05530b51161	t	Kanyefurwe	a734fdf4-a4c8-4a28-91b1-df69d65780d9
b76092ee-190f-4d9c-ac65-7c7962e6a4d5	t	Nyarushyamba	a734fdf4-a4c8-4a28-91b1-df69d65780d9
9376f468-e4df-48d2-abce-e9b40d115752	t	Burushya	7f31ee0a-80b2-49f0-8e73-deb3c001d084
dc174b5f-c625-4aca-909f-9da2e57cc45f	t	Busoro	7f31ee0a-80b2-49f0-8e73-deb3c001d084
4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7	t	Kinigi	7f31ee0a-80b2-49f0-8e73-deb3c001d084
0e4db960-8b19-4ca5-9b29-35adbb5c89ed	t	Kiraga	7f31ee0a-80b2-49f0-8e73-deb3c001d084
3dab6681-0923-4c2a-a12a-369022b33fc0	t	Munanira	7f31ee0a-80b2-49f0-8e73-deb3c001d084
70cc9446-f0f6-427b-b11e-f0816235cb88	t	Rubona	7f31ee0a-80b2-49f0-8e73-deb3c001d084
98d24b31-de13-45c4-957c-394f3d06aec3	t	Bahimba	78d05a76-f7a4-4d44-88fa-ca99949f77d5
f78df667-ffa3-4765-9a2d-b1cd0353e695	t	Gatovu	78d05a76-f7a4-4d44-88fa-ca99949f77d5
5d27be5a-a350-4d17-a67a-7b7228cbfe0d	t	Kavomo	78d05a76-f7a4-4d44-88fa-ca99949f77d5
933be8a1-8feb-4583-98c0-647f13791737	t	Kigarama	78d05a76-f7a4-4d44-88fa-ca99949f77d5
766d7706-e75c-4735-8d48-399515030cd4	t	Mukondo	78d05a76-f7a4-4d44-88fa-ca99949f77d5
ffb880ca-5a1a-4bc7-a99c-42e412b4dffb	t	Nyundo	78d05a76-f7a4-4d44-88fa-ca99949f77d5
08956ecf-ecc4-4761-ba40-1619b0929393	t	Terimbere	78d05a76-f7a4-4d44-88fa-ca99949f77d5
098f8695-588a-4cac-8a22-edfb6a08fd01	t	Buhaza	ee5b3f65-7dcc-4072-bff7-6f453d500bab
e0207896-f266-4a3b-9644-a796a4d215a3	t	Burinda	ee5b3f65-7dcc-4072-bff7-6f453d500bab
7413afbc-856d-4875-ae32-f768c34e3526	t	Byahi	ee5b3f65-7dcc-4072-bff7-6f453d500bab
2d5b652a-1d25-43d8-82c1-282374fa59ea	t	Gikombe	ee5b3f65-7dcc-4072-bff7-6f453d500bab
aad1acbb-933b-4af6-bf5b-c2d4aa0f6e43	t	Murambi	ee5b3f65-7dcc-4072-bff7-6f453d500bab
3776ba00-8d04-4ddf-98eb-7b03cedc93d8	t	Murara	ee5b3f65-7dcc-4072-bff7-6f453d500bab
79d41259-22b1-41ed-9221-032856812be2	t	Rukoko	ee5b3f65-7dcc-4072-bff7-6f453d500bab
0af901fa-9b09-4a68-8a85-228ab61c0233	t	Basa	076d4594-298f-4208-b16a-f5279992e238
773921ba-4669-481a-b782-639f2253653d	t	Gisa	076d4594-298f-4208-b16a-f5279992e238
277eb3fd-a261-4f07-bae5-58e7bf64aacf	t	Kabilizi	076d4594-298f-4208-b16a-f5279992e238
f8caef92-9598-4745-aae7-b7d2e3f07ea2	t	Muhira	076d4594-298f-4208-b16a-f5279992e238
1d980e3a-6a49-429e-b614-65d4d9061280	t	Rugerero	076d4594-298f-4208-b16a-f5279992e238
148200fc-75f6-47e8-bc63-41ef3387075b	t	Rushubi	076d4594-298f-4208-b16a-f5279992e238
6af11253-cbbd-46f1-9582-512080ed9740	t	Rwaza	076d4594-298f-4208-b16a-f5279992e238
704bce49-b552-4056-9289-d422b4c93f4f	t	Nyange	9fe3f36b-bd02-4903-83d7-8259e55dd67b
bbec4e32-e286-402a-9b7e-22a2700e1ca5	t	Pera	9fe3f36b-bd02-4903-83d7-8259e55dd67b
23cf5d83-9ef5-4b70-97cd-6206a474831b	t	Ryankana	9fe3f36b-bd02-4903-83d7-8259e55dd67b
c03ebbf0-f169-4c70-b36d-6709e73db551	t	Butanda	a73feb4d-d301-4d44-bed3-34aa21db5a94
65fb9cfb-ec20-4adb-a4c3-58450745133c	t	Gatereri	a73feb4d-d301-4d44-bed3-34aa21db5a94
950dcb06-f9ee-415a-b77f-0ea5e9ca28bb	t	Nyamihanda	a73feb4d-d301-4d44-bed3-34aa21db5a94
76abdad1-03d5-4a4d-9a7e-f29245d80c1f	t	Rwambogo	a73feb4d-d301-4d44-bed3-34aa21db5a94
95ebe2e6-ec87-458d-9397-f519a8a43266	t	Gikungu	3302b3af-c98e-42e4-8653-bc4c63ef7b3c
d79edc0d-dfed-4053-bf15-52278874f69e	t	Kiyabo	3302b3af-c98e-42e4-8653-bc4c63ef7b3c
6fe814f3-1c13-4ce1-a63b-28e9ea566500	t	Murwa	3302b3af-c98e-42e4-8653-bc4c63ef7b3c
19dd961b-dff6-4b92-bbca-72c2c156c285	t	Nyamuzi	3302b3af-c98e-42e4-8653-bc4c63ef7b3c
fcc301d5-3850-4a7d-8bc2-8ce854700d3a	t	Rasano	3302b3af-c98e-42e4-8653-bc4c63ef7b3c
d33db643-cfeb-42b6-b991-519f76bbfea6	t	Birembo	89f996f6-22ab-441a-92e5-e6af24910c8b
a406e98a-bfdf-47bb-bc0e-edd5e20a956d	t	Buhokoro	89f996f6-22ab-441a-92e5-e6af24910c8b
16dcbb78-7e38-454a-b982-3075957ad973	t	Kabakobwa	89f996f6-22ab-441a-92e5-e6af24910c8b
952c775f-1af6-42e2-8a70-07f7a1083bad	t	Kacyuma	89f996f6-22ab-441a-92e5-e6af24910c8b
6cd83c32-87dc-451e-a836-90cc93720f53	t	Kamurehe	89f996f6-22ab-441a-92e5-e6af24910c8b
ed6d74ad-1f50-4a97-8a00-4081b5b146c9	t	Karemereye	89f996f6-22ab-441a-92e5-e6af24910c8b
6a7df2cf-9fb1-462f-985e-83cb5b00ef5c	t	Muti	89f996f6-22ab-441a-92e5-e6af24910c8b
9ff034a3-9565-4be5-93dd-5b2cff727598	t	Rusayo	89f996f6-22ab-441a-92e5-e6af24910c8b
821c6a6e-2885-46c3-91b4-fec799d89462	t	Cyendajuru	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
ff3937db-f196-474d-ab77-bdec4b959ac1	t	Gakomeye	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
ba150e02-329f-4b27-9d6f-6018b87f341d	t	Giheke	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
307e96f9-368e-49b6-a23a-23f054432b93	t	Kamashangi	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
f3612641-2293-4782-a340-12ca6baf2de7	t	Kigenge	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
212321e8-c546-4784-8cad-dfc934610e55	t	Ntura	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
fa35b13a-7e6c-4f11-b286-901d90d00522	t	Turambi	3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7
3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a	t	Burunga	31e4b0a6-9e35-4ba2-893b-10e3ee24e263
b2325290-e43f-4bf2-b870-e6a1a7022e29	t	Gatsiro	31e4b0a6-9e35-4ba2-893b-10e3ee24e263
fb844e9e-56de-4c06-a401-b1e531096406	t	Kagara	31e4b0a6-9e35-4ba2-893b-10e3ee24e263
7037f7a5-c9cb-4b28-abfb-86b57c69237e	t	Kamatita	31e4b0a6-9e35-4ba2-893b-10e3ee24e263
b25c7a10-8812-488e-8ce5-a8892ec5cf21	t	Shagasha	31e4b0a6-9e35-4ba2-893b-10e3ee24e263
748bd728-7aca-46f6-b4ca-91e9430f433b	t	Kizura	a829d7e8-0071-4d4c-baad-089636b585a9
dec792c2-2a19-4ab3-a4b5-3e6cab86af15	t	Mpinga	a829d7e8-0071-4d4c-baad-089636b585a9
fe6d04b8-714e-48e3-86a5-ce39b9794e09	t	Nyamigina	a829d7e8-0071-4d4c-baad-089636b585a9
82a5afa2-6f56-410d-b75e-fe38890b35c6	t	Cyingwa	124e22d4-7c48-400a-898b-b5b19b600426
82f84d0a-290f-487d-94b6-05f98f131a9a	t	Gahungeri	124e22d4-7c48-400a-898b-b5b19b600426
2787e16a-6390-424f-b626-cca470469db5	t	Hangabashi	124e22d4-7c48-400a-898b-b5b19b600426
c2efc3c8-a878-4cce-a583-c89e5980eba5	t	Mashesha	124e22d4-7c48-400a-898b-b5b19b600426
43248804-2f12-4415-8bfa-8eec0130e06f	t	Cyangugu	62e83fa7-22b5-42ab-b9a3-3656f9988139
d2dde728-8784-4eab-8e05-be04371078b5	t	Gihundwe	62e83fa7-22b5-42ab-b9a3-3656f9988139
1f227be5-e1d1-4c7f-a6dc-38970ed96f20	t	Kamashangi	62e83fa7-22b5-42ab-b9a3-3656f9988139
a7d18bde-3404-49ce-98f4-f374617c56f9	t	Kamurera	62e83fa7-22b5-42ab-b9a3-3656f9988139
0f716c8b-ed3e-4c0b-af36-bcef898aed7a	t	Ruganda	62e83fa7-22b5-42ab-b9a3-3656f9988139
f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7	t	Cyarukara	52a2753d-ca83-4cc5-99de-2544b2346d71
3e0d51fa-e77f-4395-939a-b60aa5bffa47	t	Gakoni	52a2753d-ca83-4cc5-99de-2544b2346d71
ddee841f-2e4c-47bf-8dfe-d122983a4dce	t	Shara	52a2753d-ca83-4cc5-99de-2544b2346d71
0be18aa4-9782-48a2-87f2-b57519458e91	t	Gahinga	0bd400d1-f84b-457b-8829-1972656bb220
d5acf5ef-6dca-4268-b9a1-c17dc8f8f9b1	t	Kabahinda	0bd400d1-f84b-457b-8829-1972656bb220
802961df-47b3-40a3-b431-10c0c6bce9c9	t	Kabasigirira	0bd400d1-f84b-457b-8829-1972656bb220
888d6a61-0c62-40a7-9505-82325210c620	t	Kagarama	0bd400d1-f84b-457b-8829-1972656bb220
61020553-76d6-4fe8-8e10-7931eb42d9bf	t	Karambi	0bd400d1-f84b-457b-8829-1972656bb220
eb31b78a-8dc7-4f41-a134-3476c1ac6961	t	Miko	0bd400d1-f84b-457b-8829-1972656bb220
0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d	t	Tara	0bd400d1-f84b-457b-8829-1972656bb220
73322067-c3a0-4dd0-b78f-e02c42c585eb	t	Gitwa	ff56ce36-b8b8-4c78-a92a-2048e42e1f96
77f4f797-c9f2-4fd7-b685-d345cd9bd484	t	Kamanyenga	ff56ce36-b8b8-4c78-a92a-2048e42e1f96
ff5ee8b6-930d-45fc-b3bd-ccec424aa4e3	t	Kangazi	ff56ce36-b8b8-4c78-a92a-2048e42e1f96
7ec4eff0-4b5f-4b8f-b97a-2cf04bc2fc69	t	Kinyaga	ff56ce36-b8b8-4c78-a92a-2048e42e1f96
3f4fd1dc-b04e-4612-bdd3-18ed00da5ef5	t	Rugabano	ff56ce36-b8b8-4c78-a92a-2048e42e1f96
31bc36d8-d739-499c-9f13-35f9835bd0ac	t	Bigoga	65e3dcdb-a97b-4127-ad7e-5c4e9b3d5a2d
2f51db96-c35b-4e84-9a15-0ae919e23dc9	t	Bugarura	65e3dcdb-a97b-4127-ad7e-5c4e9b3d5a2d
57c20775-8383-434b-a4d9-d96d716efec5	t	Ishywa	65e3dcdb-a97b-4127-ad7e-5c4e9b3d5a2d
bc89e069-2593-4453-831e-a82056659855	t	Kamagimbo	65e3dcdb-a97b-4127-ad7e-5c4e9b3d5a2d
72d90a76-30c1-426e-8ac0-895bdbb9c279	t	Rwenje	65e3dcdb-a97b-4127-ad7e-5c4e9b3d5a2d
424fd75f-1eea-4478-b417-0ce0296525e8	t	Gatare	4aba17c9-5b01-4565-999d-d8f2f2e03c39
c2020ba8-bf72-40b4-b81e-5dec98b7e9a3	t	Kiziguro	4aba17c9-5b01-4565-999d-d8f2f2e03c39
efe65fb3-3dc6-4230-8e49-f89a66d784ce	t	Mataba	4aba17c9-5b01-4565-999d-d8f2f2e03c39
8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2	t	Ryamuhirwa	4aba17c9-5b01-4565-999d-d8f2f2e03c39
3601c397-8953-409c-bd66-03cb8fc4d24b	t	Gasebeya	34cc2600-4ceb-427a-9eaa-1c18993abd56
9f6ba8a8-9f12-4be4-b033-ca515609c12e	t	Gaseke	34cc2600-4ceb-427a-9eaa-1c18993abd56
65507ac0-2124-471e-9cd0-77d3803fa053	t	Kamanu	34cc2600-4ceb-427a-9eaa-1c18993abd56
e2524626-6349-43d1-b4ac-8be1cdc02a6c	t	Kiziho	34cc2600-4ceb-427a-9eaa-1c18993abd56
73f80fb2-7cc1-47b0-aaad-080211e8d26c	t	Mashyuza	34cc2600-4ceb-427a-9eaa-1c18993abd56
54a51453-75ba-4d36-aa3b-555c61b1d72c	t	Nyabintare	34cc2600-4ceb-427a-9eaa-1c18993abd56
dcf14c98-9d33-45bc-9090-ab5814529c40	t	Gatare	639c7b47-3d30-4cc9-b64f-d37ee53e1478
f2e03616-028e-4e12-bbfd-23f2863fa333	t	Kabagina	639c7b47-3d30-4cc9-b64f-d37ee53e1478
6b782b57-64dd-444c-b826-52f826fd26bc	t	Kabuye	639c7b47-3d30-4cc9-b64f-d37ee53e1478
79f001cf-25e2-4ce1-9a82-67f61de188f9	t	Kanoga	639c7b47-3d30-4cc9-b64f-d37ee53e1478
81dedc86-f158-4d64-965e-995e96a27195	t	Karangiro	639c7b47-3d30-4cc9-b64f-d37ee53e1478
8bd43f50-eef0-44c1-bc06-2cacad311242	t	Murambi	639c7b47-3d30-4cc9-b64f-d37ee53e1478
c0396bbe-1aa7-475f-ab9f-e7912c096c1c	t	Rusambu	639c7b47-3d30-4cc9-b64f-d37ee53e1478
a3ff1db2-23c1-439f-b638-4d9e4caa813a	t	Butambamo	ab3f7c99-5ba5-44bb-94b6-0e49821150ea
eb5ac054-2457-4ce7-9e18-2c86c6eb350b	t	Murya	ab3f7c99-5ba5-44bb-94b6-0e49821150ea
2d732e57-d074-44f0-a4b9-33f82c505f69	t	Rwinzuki	ab3f7c99-5ba5-44bb-94b6-0e49821150ea
57896833-6103-456e-bfeb-27c4a70ed9e2	t	Karenge	665a0cf0-4697-4522-9a95-e2f8721b785c
5669ef08-c7ac-4db2-afc1-e3c7a76121a5	t	Mushaka	665a0cf0-4697-4522-9a95-e2f8721b785c
04028663-e1fb-4576-869f-93ca4b4affc4	t	Rubugu	665a0cf0-4697-4522-9a95-e2f8721b785c
f337c3ce-e280-4f62-b821-15962d2cf90c	t	Bushaka	98622ef7-801a-41b3-b75e-f3a073d8ae6b
11c5ab87-acd6-43b8-9c75-9f9af61951f6	t	Kabihogo	98622ef7-801a-41b3-b75e-f3a073d8ae6b
042b8d38-17c8-463c-a53c-79713b0683e0	t	Nkira	98622ef7-801a-41b3-b75e-f3a073d8ae6b
413a6b3f-a4d8-4f78-b886-28c25e83b226	t	Remera	98622ef7-801a-41b3-b75e-f3a073d8ae6b
bfb265a3-bc45-4ae3-8c84-9f0fa73b2f3f	t	Bugina	361f9950-f9ec-44a9-a532-4b984c8cb85e
bfb21a2b-c7b0-401c-ae59-f2e1aa7f3e74	t	Congo-nil	361f9950-f9ec-44a9-a532-4b984c8cb85e
0d114787-68e2-4dce-a568-bbdc91253b76	t	Mataba	361f9950-f9ec-44a9-a532-4b984c8cb85e
f63ef8b4-9700-47ab-af34-8bedd6355cdf	t	Murambi	361f9950-f9ec-44a9-a532-4b984c8cb85e
2ff8755f-ade5-4632-bd61-b632bdab5620	t	Ruhingo	361f9950-f9ec-44a9-a532-4b984c8cb85e
b8907d36-c88d-4702-a3c6-383db72e5b82	t	Shyembe	361f9950-f9ec-44a9-a532-4b984c8cb85e
10ef3144-6873-451b-bb14-2a6ffcd47af9	t	Teba	361f9950-f9ec-44a9-a532-4b984c8cb85e
1ce0166d-255e-4349-800e-0099a4db0f76	t	Buhindure	20fcf846-0926-43e9-85ed-339f8f932d36
9c25e820-e35e-49ee-9fb2-70c9c84a1490	t	Nkora	20fcf846-0926-43e9-85ed-339f8f932d36
fa038e9b-3a06-416d-92b9-5fcea904d8e2	t	Nyagahinika	20fcf846-0926-43e9-85ed-339f8f932d36
a772310a-6579-4391-83fa-b91f11ef2001	t	Rukaragata	20fcf846-0926-43e9-85ed-339f8f932d36
30a2461e-6168-4aa9-99ec-095643fe51e2	t	Bunyoni	ef678a65-d6e7-4ddc-9688-a29eb10248ac
ea80c519-ad72-4a0e-b377-d043bd25013f	t	Bunyunju	ef678a65-d6e7-4ddc-9688-a29eb10248ac
97a97f1b-c5ef-4307-ba59-e67edcfbd5ed	t	Kabere	ef678a65-d6e7-4ddc-9688-a29eb10248ac
f7d1ba29-602f-4d88-81ea-398f8a1a38dc	t	Kabujenje	ef678a65-d6e7-4ddc-9688-a29eb10248ac
1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28	t	Karambi	ef678a65-d6e7-4ddc-9688-a29eb10248ac
add3873f-8369-4c22-b2e9-c56f8465306b	t	Nganzo	ef678a65-d6e7-4ddc-9688-a29eb10248ac
10bec438-6b50-4ce0-a2cd-2c5fe0ad0b18	t	Haniro	99ce2fe7-f9ac-4dd4-ab31-cf8132b73368
6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c	t	Muyira	99ce2fe7-f9ac-4dd4-ab31-cf8132b73368
f0a17fea-fab5-44b2-a34e-a343d75568e2	t	Tangabo	99ce2fe7-f9ac-4dd4-ab31-cf8132b73368
e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7	t	Kagano	4cab0e9c-48f5-4440-aacf-c274dce9acf4
02800f7e-e4da-4432-93f9-a1ab839e8cfb	t	Kageyo	4cab0e9c-48f5-4440-aacf-c274dce9acf4
07befce3-023b-43a5-b367-19922a3fbc03	t	Karambo	4cab0e9c-48f5-4440-aacf-c274dce9acf4
7c579874-96b4-41f4-a53c-9bfb81bf4cdc	t	Mwendo	4cab0e9c-48f5-4440-aacf-c274dce9acf4
f14aa855-fe3a-4384-8097-f56a6317c519	t	Kirwa	919820f3-5f06-417a-b391-44b7b65ce0af
f4bbeac7-6a0a-4e74-bba5-fa20d2c3f594	t	Mburamazi	919820f3-5f06-417a-b391-44b7b65ce0af
24e3e682-aa13-4064-8658-75169c68d75e	t	Rugeyo	919820f3-5f06-417a-b391-44b7b65ce0af
0455f824-a68d-4071-98cb-5763bec5b311	t	Twabugezi	919820f3-5f06-417a-b391-44b7b65ce0af
7edd5637-7d9a-4594-8c59-8ca2d5cd8657	t	Gabiro	496bb22b-c43f-454b-bbb8-bb5b28ed2cde
e66050d4-d42d-4fda-b375-a9da4265556c	t	Gisiza	496bb22b-c43f-454b-bbb8-bb5b28ed2cde
2f75b3b0-8ef2-4783-87fe-4ed20a18f5d6	t	Murambi	496bb22b-c43f-454b-bbb8-bb5b28ed2cde
0d9296f6-29ed-49e5-84d5-2f301bac1477	t	Nyarubuye	496bb22b-c43f-454b-bbb8-bb5b28ed2cde
06977671-3a1b-43f5-ad33-237a532e3a88	t	Biruyi	de08e844-c4ad-465c-9d64-cd2051295cc1
0b9f8223-789c-48db-9e07-a5cba7ad23b7	t	Kaguriro	de08e844-c4ad-465c-9d64-cd2051295cc1
19386f5c-e1a0-4393-9839-53c18c75d817	t	Magaba	de08e844-c4ad-465c-9d64-cd2051295cc1
57ba4bb0-1f94-40c7-82d5-237ae14efcbf	t	Rurara	de08e844-c4ad-465c-9d64-cd2051295cc1
da3f0a47-18ba-437b-8fac-fa0453d732f9	t	Bumba	c52405ca-9c31-44f1-a756-d492427b0ae4
5fd82fb3-7469-444c-b012-277680893810	t	Cyarusera	c52405ca-9c31-44f1-a756-d492427b0ae4
33ffe9eb-c671-4454-9284-e8cac32fb26e	t	Gitwa	c52405ca-9c31-44f1-a756-d492427b0ae4
739cfcc5-40cf-49d7-9514-64028478fa67	t	Mageragere	c52405ca-9c31-44f1-a756-d492427b0ae4
d3fa2e1c-58ef-4420-80b7-4c4f98c2c669	t	Sure	c52405ca-9c31-44f1-a756-d492427b0ae4
33e3b8c9-794f-4301-b72a-34ec6f21dcd0	t	Busuku	399e0bb5-3365-4137-bfaf-6f964370dee2
ec91dd3a-63a1-4194-b2be-19e1925df97a	t	Cyivugiza	399e0bb5-3365-4137-bfaf-6f964370dee2
ada6c10a-e290-4dc6-9403-f066e4a5c2b4	t	Ngoma	399e0bb5-3365-4137-bfaf-6f964370dee2
f08b038e-44fe-4127-a157-3f43bbf12dc4	t	Terimbere	399e0bb5-3365-4137-bfaf-6f964370dee2
5cff4722-b450-4d30-8d23-840aff303658	t	Gatare	ec251632-1d13-4809-9be5-f673a6e9f0b0
959811be-11bd-4b71-ba30-1c648323fe77	t	Gihira	ec251632-1d13-4809-9be5-f673a6e9f0b0
640b50bd-6b2e-4b30-90f0-3dc0b2078c75	t	Kavumu	ec251632-1d13-4809-9be5-f673a6e9f0b0
15a7b2bc-f17a-4f4a-bcf1-a9f660edb41f	t	Nyakarera	ec251632-1d13-4809-9be5-f673a6e9f0b0
a768d311-23fd-4557-af1f-7c29ddff629d	t	Rugasa	ec251632-1d13-4809-9be5-f673a6e9f0b0
044ef1cc-5fe9-4ef1-945c-52971f1e5c81	t	Rundoyi	ec251632-1d13-4809-9be5-f673a6e9f0b0
bbc2bbeb-f8ab-4c3b-8695-6ad87c823757	t	Kabona	70c5f2db-ffb6-441f-8279-88cfb2f37dd9
11ea68b8-f9c2-438c-9dd0-d7f89cd15f23	t	Mberi	70c5f2db-ffb6-441f-8279-88cfb2f37dd9
b29e2118-9ba5-4f16-84e6-a1b2c648737d	t	Remera	70c5f2db-ffb6-441f-8279-88cfb2f37dd9
99872f52-9abb-4311-9ac3-d91e033d6440	t	Ruronde	70c5f2db-ffb6-441f-8279-88cfb2f37dd9
a1f06cda-0585-4939-8280-11bb5072e9ce	t	Bungwe	d804aaa5-e041-4738-b8e8-daede2140bc1
cf186aca-f6f2-4579-a7a9-ae5e6fbb2dd9	t	Bushenya	d804aaa5-e041-4738-b8e8-daede2140bc1
5f656404-07a4-413c-b687-350d5824b9b3	t	Mudugari	d804aaa5-e041-4738-b8e8-daede2140bc1
0df66bc4-33f8-455b-bcdf-dd9a64443df2	t	Tumba	d804aaa5-e041-4738-b8e8-daede2140bc1
5209b401-8438-43d4-b10e-3f612ece32f2	t	Gatsibo	5ecac098-afe6-41dc-99e9-e8c14e5a4952
7a0f31aa-385e-4def-ba55-b51de9c9eb6b	t	Mubuga	5ecac098-afe6-41dc-99e9-e8c14e5a4952
4f03d411-3ae1-4b79-972c-6b6df587a36e	t	Muhotora	5ecac098-afe6-41dc-99e9-e8c14e5a4952
1dccc1f6-6c9f-4cff-823a-a261cd5b9713	t	Nyamicucu	5ecac098-afe6-41dc-99e9-e8c14e5a4952
b2853706-7cc7-4645-959d-0de6bdf17b05	t	Rusumo	5ecac098-afe6-41dc-99e9-e8c14e5a4952
c920eb70-f819-450b-9c9c-3effad18fb55	t	Gasiza	97762696-25e6-47cc-b288-243b9ce4fc15
c426c826-de66-4ed4-915e-c21d2f5ae300	t	Gisovu	97762696-25e6-47cc-b288-243b9ce4fc15
d7a20e37-4def-4f23-8867-53f6f444a311	t	Kabyiniro	97762696-25e6-47cc-b288-243b9ce4fc15
09d5cd65-6f85-4b29-8818-541f04dda392	t	Kagitega	97762696-25e6-47cc-b288-243b9ce4fc15
569aec92-34b8-4316-821f-d81932b6dffa	t	Kamanyana	97762696-25e6-47cc-b288-243b9ce4fc15
5adaf426-e09d-483e-b542-4dfce392742d	t	Nyagahinga	97762696-25e6-47cc-b288-243b9ce4fc15
51f9bde1-08ba-47ea-aacf-769253ecbb9a	t	Butare	df5beef4-1981-420b-9c1f-997c6401f1d1
ec2d49ca-80e8-4f5e-aa68-c9fcd65064c6	t	Ndongozi	df5beef4-1981-420b-9c1f-997c6401f1d1
84302164-ed39-48ef-b81b-bb01d8de75ea	t	Ruyange	df5beef4-1981-420b-9c1f-997c6401f1d1
8a61b980-2b06-4b7d-a35a-9e9358f1dca3	t	Buramba	5f67a7ae-76eb-49aa-8243-694bb50bfc1a
a318b157-f03b-48a1-aff5-e877904c23d5	t	Gisizi	5f67a7ae-76eb-49aa-8243-694bb50bfc1a
992b4139-6477-4f15-9ff6-9a7713740987	t	Kidakama	5f67a7ae-76eb-49aa-8243-694bb50bfc1a
f5d8ccd4-5652-4b96-a28d-5cdde5eece32	t	Nyangwe	5f67a7ae-76eb-49aa-8243-694bb50bfc1a
a70060e4-ac19-4179-aa29-0e3eeafc7f25	t	Rwasa	5f67a7ae-76eb-49aa-8243-694bb50bfc1a
a8230f35-9468-4fce-995b-263c370c6323	t	Gabiro	24697f74-e2c1-49f3-8511-f3fa4ad0a58e
50324292-8790-43be-ad26-12373aaeedb3	t	Musenda	24697f74-e2c1-49f3-8511-f3fa4ad0a58e
1ebef1d6-2dd4-4069-af9e-fee80a9efbfa	t	Rwambogo	24697f74-e2c1-49f3-8511-f3fa4ad0a58e
fd96ec85-8dd5-4149-b963-858fd404ff84	t	Rwasa	24697f74-e2c1-49f3-8511-f3fa4ad0a58e
88013572-4e77-4103-aeb8-75e19881607c	t	Mariba	911f8775-6549-4231-a04d-6db28562c70c
b8754181-a1ba-43f3-b4f8-62f742dcdcf3	t	Musasa	911f8775-6549-4231-a04d-6db28562c70c
7bc6dfd1-8a9b-4912-994f-42605b4e85fb	t	Runoga	911f8775-6549-4231-a04d-6db28562c70c
25370b0f-d529-4689-b35b-9a8eb7e6d62b	t	Kabaya	2d1a4c15-0187-4bad-969d-b2a64d10e529
cefc7d9a-7b25-4e38-b269-f3b0f43178ed	t	Kayenzi	2d1a4c15-0187-4bad-969d-b2a64d10e529
5ecc1e13-8921-41e0-b903-b1dd522eda92	t	Kiringa	2d1a4c15-0187-4bad-969d-b2a64d10e529
e9a149b9-821a-4117-9a26-918333d96d44	t	Nyamabuye	2d1a4c15-0187-4bad-969d-b2a64d10e529
aeb348f7-e094-4e93-af6b-483e31808ff0	t	Gafuka	9baefc88-0d84-43c4-a7d8-2063302f7cd9
be198dc0-0cf4-406c-8378-071af746d8d4	t	Nkenke	9baefc88-0d84-43c4-a7d8-2063302f7cd9
6ab97eab-69db-4d8a-9423-cff359d1754c	t	Nkumba	9baefc88-0d84-43c4-a7d8-2063302f7cd9
4cd34419-aecc-473f-a732-806b418b0298	t	Ntaruka	9baefc88-0d84-43c4-a7d8-2063302f7cd9
410b05ab-4200-4657-99c7-0457ad7fc8c4	t	Bugamba	eb07f0dd-1c52-4007-8ba7-16baf7f781a2
c64ec44a-3380-47de-a9d6-1ca2d8cbc9c2	t	Kaganda	eb07f0dd-1c52-4007-8ba7-16baf7f781a2
845c6ed4-a93b-41a6-9ffa-b146aad5bb1e	t	Musasa	eb07f0dd-1c52-4007-8ba7-16baf7f781a2
7d397302-4f5e-4108-97c4-896ee788628d	t	Rutovu	eb07f0dd-1c52-4007-8ba7-16baf7f781a2
28fdb6df-c824-4c96-9045-3c9bedba102a	t	Bukwashuri	7bc7c6a9-17f7-4b49-9199-8104b077067c
84f6d064-e727-4a9b-a324-5c2d29e76be8	t	Gashanje	7bc7c6a9-17f7-4b49-9199-8104b077067c
475844f1-9032-48c3-99ce-a71655588698	t	Murwa	7bc7c6a9-17f7-4b49-9199-8104b077067c
4011e87e-53e2-45c4-b378-9f09d816369c	t	Nyirataba	7bc7c6a9-17f7-4b49-9199-8104b077067c
1d5706a1-195b-4130-8dd0-62d79e1ceb40	t	Kivumu	9b641c16-6cec-44a5-ace3-6abb1efddc91
95140f17-516b-449c-880a-6c39295598b0	t	Nyamugari	9b641c16-6cec-44a5-ace3-6abb1efddc91
df76d71f-4fbf-4405-9b5c-b60f902d3061	t	Rubona	9b641c16-6cec-44a5-ace3-6abb1efddc91
68a9bfd8-1bee-402a-9029-6c767f257920	t	Rushara	9b641c16-6cec-44a5-ace3-6abb1efddc91
990aa416-cee8-45d3-b7e1-3b256824cd02	t	Cyahi	90260d6c-70b2-49e8-815c-90bea963f8e0
3e70440a-ac93-4ef4-8bcb-945c42fd9e7c	t	Gafumba	90260d6c-70b2-49e8-815c-90bea963f8e0
163d9923-02b5-4b9f-bd50-ba0d25ae9964	t	Karangara	90260d6c-70b2-49e8-815c-90bea963f8e0
6f190d99-5801-49dc-9745-24f076f5feec	t	Rurembo	90260d6c-70b2-49e8-815c-90bea963f8e0
ce714aef-c976-48a0-ab40-18af24c4fcce	t	Kilibata	a6ed8d1f-5cc8-4c18-a09d-ea67ad4c7d17
eb4b8623-fe5e-455b-82d8-1ac541cdf9c4	t	Mucaca	a6ed8d1f-5cc8-4c18-a09d-ea67ad4c7d17
d40c2384-59e3-4567-90ed-c06a7f613ab3	t	Nyanamo	a6ed8d1f-5cc8-4c18-a09d-ea67ad4c7d17
7ed2fd7e-9cab-4577-834a-53bf0064a4b3	t	Rukandabyum	a6ed8d1f-5cc8-4c18-a09d-ea67ad4c7d17
8e0d6395-51e7-47ad-9886-61a3a88f749a	t	Gaseke	5d8a2c28-76f1-4611-8efd-f3723f936002
540187f4-dfd8-4147-8cc2-77392be54174	t	Gatare	5d8a2c28-76f1-4611-8efd-f3723f936002
1241649c-1a07-4466-8f1f-690e21edb687	t	Gitovu	5d8a2c28-76f1-4611-8efd-f3723f936002
0aba3c09-1b3c-4cc0-aff2-48466049572b	t	Rusekera	5d8a2c28-76f1-4611-8efd-f3723f936002
f0307efd-3f61-4852-a483-4bf1d6da7e57	t	Kabona	2089e3c2-0673-4670-9db1-3938d57dc2cb
3e285148-759b-40d2-a5cf-654475604299	t	Ndago	2089e3c2-0673-4670-9db1-3938d57dc2cb
719a2290-4006-497c-aca3-fdfeb31b27e6	t	Ruhanga	2089e3c2-0673-4670-9db1-3938d57dc2cb
5a4bfc01-abb7-4788-9652-b992ee7a8a56	t	Gacundura	cc23038b-3bef-400f-b384-356fdaaa27e5
80e8a61b-6c96-4e81-bca3-f631ed29e8ba	t	Gashoro	cc23038b-3bef-400f-b384-356fdaaa27e5
6c6667a6-d35d-4bf6-8336-2ea391a91c76	t	Ruconsho	cc23038b-3bef-400f-b384-356fdaaa27e5
dfb5a19f-6ab2-4bb7-a3fb-c39daa05ebf9	t	Rugari	cc23038b-3bef-400f-b384-356fdaaa27e5
b89bcb5c-0e73-4bb8-99ec-af3db37b4235	t	Birambo	c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f
9a08b56e-0114-4c04-84bb-f81bf9e29401	t	Butereri	c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f
097b8ab4-a213-4364-b459-a9110fde262e	t	Kamina	c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f
46da926a-b15b-400d-bdd0-bfcca1cca033	t	Kirabo	c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f
2d8822a3-f5a2-4d07-bc95-72574e7f5e45	t	Mwumba	c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f
ef6f9807-ccd7-448b-ac9a-cb2b714a8864	t	Ruhanga	c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f
d4b9b904-33fd-43e7-979d-f09b90ca111b	t	Kiruku	b2d7ce0c-b8c9-4129-8baf-e2bc1ab19bce
c364ec9b-c954-4803-8694-53de7a549fb5	t	Mbirima	b2d7ce0c-b8c9-4129-8baf-e2bc1ab19bce
4adca6f5-8096-4949-92c8-6e1df88e103c	t	Nyange	b2d7ce0c-b8c9-4129-8baf-e2bc1ab19bce
cbb39f33-9812-453b-9256-aaa6e89482c5	t	Nyanza	b2d7ce0c-b8c9-4129-8baf-e2bc1ab19bce
2a6b86bc-1f69-4edd-82c3-caf98a2d453a	t	Muhaza	136f17f1-9bde-4cff-a4ce-49896cd2809f
e3b9352b-780e-4e8d-9aab-43673d2d0bf7	t	Muhororo	136f17f1-9bde-4cff-a4ce-49896cd2809f
221f1541-aa6b-4137-a0b0-7ec2f0098ed9	t	Muramba	136f17f1-9bde-4cff-a4ce-49896cd2809f
dc9d8d46-7669-419b-98cf-50b8a978ff41	t	Mutanda	136f17f1-9bde-4cff-a4ce-49896cd2809f
0ec58387-7f40-4bbe-8a52-523cf46572ae	t	Rukore	136f17f1-9bde-4cff-a4ce-49896cd2809f
d34abc36-33b0-4500-b5f9-e18c8c66dcfd	t	Buheta	fe04fa71-c18a-4a44-9a7a-d784483807f5
2980c451-6872-4b49-848f-83c1cb9b8994	t	Kagoma	fe04fa71-c18a-4a44-9a7a-d784483807f5
8d207ecc-c6c2-4bae-8da4-0e02838b208a	t	Nganzo	fe04fa71-c18a-4a44-9a7a-d784483807f5
c9c732c3-c2f1-488e-936a-aa24836cab80	t	Rusagara	fe04fa71-c18a-4a44-9a7a-d784483807f5
12cfc3eb-1906-4be0-9bb5-a7e7923e2b11	t	Nyacyina	06858286-92f1-4a9b-bf9f-b022b247b62d
5636e5bf-4bdb-4526-87fb-c0679951a873	t	Rukura	06858286-92f1-4a9b-bf9f-b022b247b62d
2e4e028e-c395-4cd3-ba91-ffebad5c6a40	t	Rutenderi	06858286-92f1-4a9b-bf9f-b022b247b62d
2aaa460d-cb96-4385-8ea2-739a5ccb9fea	t	Taba	06858286-92f1-4a9b-bf9f-b022b247b62d
2be9d570-5bec-4a91-b535-62ea1bbecd28	t	Gakindo	c7464505-55f6-4874-8c67-2391c7e61440
ce29377a-d623-41ca-a1f9-76d5e2f73eef	t	Gatwa	c7464505-55f6-4874-8c67-2391c7e61440
97f1fc3d-1bb9-42df-bf33-633ee7201b5e	t	Karukungu	c7464505-55f6-4874-8c67-2391c7e61440
ca7a8b94-d858-44d7-8444-1f75790ed989	t	Kamubuga	48d11048-5727-4d2c-8b99-54d1cd033c71
bd3b98ca-0dd7-408c-85ba-4e9fa398b1f9	t	Kidomo	48d11048-5727-4d2c-8b99-54d1cd033c71
f9428e31-112e-4c50-b7b7-2d515d53e360	t	Mbatabata	48d11048-5727-4d2c-8b99-54d1cd033c71
961ecfd3-6dbd-4c7b-b7ab-5ca7209cabdc	t	Rukore	48d11048-5727-4d2c-8b99-54d1cd033c71
e0ffe874-2cff-4611-913f-b5d0a07378ae	t	Kanyanza	743dcdbd-c3a5-4528-a36d-bf08bfd24880
c8d86e0b-c96d-4588-9b2a-e29be2921583	t	Karambo	743dcdbd-c3a5-4528-a36d-bf08bfd24880
3bb76088-c54c-4ac6-a82e-cf8e6e387239	t	Kirebe	743dcdbd-c3a5-4528-a36d-bf08bfd24880
b1cd17a0-efdf-423a-99d7-cf4059ce5042	t	Cyintare	1c5855fb-bc6b-44ab-b820-45263e5cf780
6f1edabf-337d-4f28-9d32-c67c642fa367	t	Gasiza	1c5855fb-bc6b-44ab-b820-45263e5cf780
a4f5bdcf-cf83-46ca-844a-1e17576605e7	t	Rugimbu	1c5855fb-bc6b-44ab-b820-45263e5cf780
a90b8e78-44c7-44a0-8953-4871c1ee715e	t	Sereri	1c5855fb-bc6b-44ab-b820-45263e5cf780
9dc24897-812b-45b5-a111-42618f90de35	t	Buyange	c327bb4e-9b28-4c0a-989e-ef7b083489b7
4773f22b-b82b-4737-8228-04cf2915a3f5	t	Gikombe	c327bb4e-9b28-4c0a-989e-ef7b083489b7
faac8fd6-8f62-4db1-bab1-e3a402eefacd	t	Nyundo	c327bb4e-9b28-4c0a-989e-ef7b083489b7
7abd9055-d973-436b-8530-08184d5f9c2c	t	Gasiho	8533de75-57c9-4bc7-8a4c-59281e4fb123
36946fd6-67c5-4738-b1d6-3883bb64b20e	t	Munyana	8533de75-57c9-4bc7-8a4c-59281e4fb123
08e01c7d-8397-4fcd-aee7-14b9fae6dd0f	t	Murambi	8533de75-57c9-4bc7-8a4c-59281e4fb123
10b4d674-f888-4b6c-8eae-ec066283b675	t	Raba	8533de75-57c9-4bc7-8a4c-59281e4fb123
825aa441-6a81-4198-973b-a087fc7fb8af	t	Gahinga	d8ab76ed-6cb9-4f30-b94a-00ae4b87aa47
b4d1c5f1-99be-4d99-b9e5-69132871b4fa	t	Munyana	d8ab76ed-6cb9-4f30-b94a-00ae4b87aa47
e0d89c23-9fd0-4ba0-aa3c-b780bd20494f	t	Nkomane	d8ab76ed-6cb9-4f30-b94a-00ae4b87aa47
9d553484-a930-44d8-9bca-e9dfc648822c	t	Rutabo	d8ab76ed-6cb9-4f30-b94a-00ae4b87aa47
9d803d09-d559-4f53-9161-5434fca40bb4	t	Rwamambe	d8ab76ed-6cb9-4f30-b94a-00ae4b87aa47
4a34f41a-b304-4c1c-a95a-5cad7a825511	t	Busake	12caa727-bce5-4be4-888c-5577a33858d8
273aa86c-f556-42fc-827e-c8dc1cb0dcaa	t	Bwenda	12caa727-bce5-4be4-888c-5577a33858d8
00b1fd1d-f870-4531-a453-b3bb3ed93c28	t	Gasiza	12caa727-bce5-4be4-888c-5577a33858d8
09ee9e14-4bf9-4438-84b0-5140125494e5	t	Gihinga	12caa727-bce5-4be4-888c-5577a33858d8
314a88b3-bf50-42ce-8672-a53addf58a8a	t	Huro	12caa727-bce5-4be4-888c-5577a33858d8
62d10e68-30f9-4cee-af7f-a271a100743f	t	Musagara	12caa727-bce5-4be4-888c-5577a33858d8
4bfc41d9-4166-42d3-86df-17e60f620102	t	Musenyi	12caa727-bce5-4be4-888c-5577a33858d8
8501e8ef-8902-49b0-8a8e-ca4459956fe0	t	Ruganda	12caa727-bce5-4be4-888c-5577a33858d8
0f329f83-a34d-4d08-914d-f3523e727568	t	Bumba	4b0aa0e7-3f6e-43f2-b35d-18e276fae83b
fbdedc8a-04b8-45db-b8c1-ff92dfae1d19	t	Gisiza	4b0aa0e7-3f6e-43f2-b35d-18e276fae83b
2055b102-528a-45e5-8c01-80b725255465	t	Nganzo	4b0aa0e7-3f6e-43f2-b35d-18e276fae83b
b566dfc4-1e06-4e0f-8f73-f3cb42e73caf	t	Kabatezi	7ad7d1a4-41c0-4fe6-ac31-af9be219d869
395bceab-8387-4605-9fca-07b770028cc4	t	Mubuga	7ad7d1a4-41c0-4fe6-ac31-af9be219d869
494efbd5-7fc0-4068-bab0-c6ed176a5e2b	t	Rwa	7ad7d1a4-41c0-4fe6-ac31-af9be219d869
492034a9-1fb8-4ad8-9513-4ad94a66776a	t	Buranga	3c40b986-c6eb-4466-88bd-63abb5238637
554b6e1c-2d97-43c7-a02a-2da02462575b	t	Gahinga	3c40b986-c6eb-4466-88bd-63abb5238637
5ce9df04-bb7a-4c75-a28a-5fc2123c00bb	t	Gisozi	3c40b986-c6eb-4466-88bd-63abb5238637
aaa24563-208d-48d0-ac37-7ef85e39c52d	t	Mucaca	3c40b986-c6eb-4466-88bd-63abb5238637
a1719c8d-cc46-4169-9da4-e0b33532fef8	t	Busoro	654097ca-e1ac-4ee1-b591-c663a0358220
202f66a3-e3e5-46cd-8094-77c58d5c1696	t	Gikingo	654097ca-e1ac-4ee1-b591-c663a0358220
45a0ee3d-66e4-4cfc-9721-3d97381e239e	t	Jango	654097ca-e1ac-4ee1-b591-c663a0358220
9cc56841-c3b8-4d01-b1c0-b1075e617b52	t	Ruli	654097ca-e1ac-4ee1-b591-c663a0358220
788f8673-4743-4778-9173-f2f48ace6c96	t	Rwesero	654097ca-e1ac-4ee1-b591-c663a0358220
5e994475-0f06-45c8-a31c-c526690c23f7	t	Gataba	49e8d762-42b5-49c0-95ad-a6eb8c62faaa
0fff02c5-f370-4a88-9218-980b2142ba97	t	Kamonyi	49e8d762-42b5-49c0-95ad-a6eb8c62faaa
b603cf02-1de2-4794-81c8-3d2dd4dec149	t	Murambi	49e8d762-42b5-49c0-95ad-a6eb8c62faaa
7b600b9a-ec98-403a-9e72-dffdfb705f13	t	Nyundo	49e8d762-42b5-49c0-95ad-a6eb8c62faaa
71e1629a-3e37-49de-a782-4eca95e50878	t	Rumbi	49e8d762-42b5-49c0-95ad-a6eb8c62faaa
b8ef97cf-feb6-4985-a79e-dbdc35837ade	t	Burimba	4782aba3-07b9-42f4-8b26-0f4054461021
b7bbd187-7985-4cd9-a132-041d6f50a6e4	t	Busanane	4782aba3-07b9-42f4-8b26-0f4054461021
42d0b8a1-9353-4a23-b26c-850810bb5489	t	Joma	4782aba3-07b9-42f4-8b26-0f4054461021
02323fdc-0e8e-451e-bfcd-8315f854b168	t	Kageyo	4782aba3-07b9-42f4-8b26-0f4054461021
ba2c651c-6505-4654-ade7-582f4aead3cb	t	Mbogo	4782aba3-07b9-42f4-8b26-0f4054461021
799597ad-9dd1-49b2-8d4b-fd8504416ecc	t	Razi	4782aba3-07b9-42f4-8b26-0f4054461021
6573fd73-8475-4b92-9d16-49cd5961cc49	t	Rwankuba	4782aba3-07b9-42f4-8b26-0f4054461021
a91dda7f-fc3a-45d7-974a-0b6f4c4ec117	t	Shyombwe	4782aba3-07b9-42f4-8b26-0f4054461021
e5d19481-dd2b-4c24-905e-b5059848dd91	t	Karenge	a9c59fa8-343b-450c-9e84-54d68d4e9283
17c2762b-e439-43aa-8c48-25982a078d9e	t	Kigabiro	a9c59fa8-343b-450c-9e84-54d68d4e9283
d82e4b72-7d05-4a27-bbb6-0e6cfa2d04b9	t	Kivumu	a9c59fa8-343b-450c-9e84-54d68d4e9283
f9fcaef7-44ce-41ad-9b81-81b7b3206fca	t	Rwesero	a9c59fa8-343b-450c-9e84-54d68d4e9283
1c97f9b0-6faf-4d81-ba5e-75c07c4eb9c5	t	Bwisige	d035b1ee-bdc8-4944-a843-78cb939631e0
16892d16-2771-40df-a5d8-afcc5e9e6628	t	Gihuke	d035b1ee-bdc8-4944-a843-78cb939631e0
e6c57623-b25c-48fb-b5a0-5393e2e0bf37	t	Nyabushingitw	d035b1ee-bdc8-4944-a843-78cb939631e0
e4b710f5-06e6-406b-92aa-3ea6f414a499	t	Gacurabwenge	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
c3e3192b-a996-43ab-aebe-83dfa38b8329	t	Gisuna	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
561fa7e9-e0ad-4961-9a67-d60122772eab	t	Kibali	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
58d91c77-d925-4fbd-b327-f0929ee44ff5	t	Kivugiza	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
be04b579-b380-4338-b06d-fd9d481a5d59	t	Murama	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
b4016398-408b-4c29-a3ae-09634cdc28a9	t	Ngondore	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
67fb8aa6-0d2f-4fd1-a5a6-03ec84a7384c	t	Nyamabuye	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
b9302f89-eef5-4987-8d28-5f6e396c75f2	t	Nyarutarama	9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8
761e32ac-d818-4185-91b8-c5459ba4506e	t	Gasunzu	c0d640f6-1a2e-42d1-981a-8cce91b88501
401f3f7c-c520-40e3-9ec2-e75a74e7b38d	t	Muhambo	c0d640f6-1a2e-42d1-981a-8cce91b88501
4af06e2a-96bf-466e-a261-41e830eeb74f	t	Nyakabungo	c0d640f6-1a2e-42d1-981a-8cce91b88501
f617471b-c2a0-4fba-afd6-d0d8f41abe00	t	Nyambare	c0d640f6-1a2e-42d1-981a-8cce91b88501
71b598e9-1fb4-48d4-867f-729b3b971a3c	t	Nyaruka	c0d640f6-1a2e-42d1-981a-8cce91b88501
3b73ed9e-560c-416a-9abb-d14950076d53	t	Rwankonjo	c0d640f6-1a2e-42d1-981a-8cce91b88501
f9e7c625-95c5-42c9-a447-fb489e2567f4	t	Gatobotobo	a728c87f-aee0-4f62-9118-5a783d2c91c4
50ac0f9d-e9bc-4fb5-a1a5-5394a8e4a6d0	t	Murehe	a728c87f-aee0-4f62-9118-5a783d2c91c4
603b1626-65de-407c-a015-ecea1c417ea9	t	Tanda	a728c87f-aee0-4f62-9118-5a783d2c91c4
ac8f542b-9067-43a0-8261-6bdbf026e828	t	Gihembe	a64ed6b2-8119-4a89-9231-995e35a10eaf
a1d89943-41e5-45fd-bbd2-4d796f319670	t	Horezo	a64ed6b2-8119-4a89-9231-995e35a10eaf
fbbbe843-fcc8-4e9e-828f-59285936d01a	t	Kabuga	a64ed6b2-8119-4a89-9231-995e35a10eaf
c50771c7-ed04-465e-82e9-a79aaf86b5c5	t	Muhondo	a64ed6b2-8119-4a89-9231-995e35a10eaf
a04c41dc-338e-4068-a5ec-b079a11dfa40	t	Bugomba	c40db82d-5a07-406c-9644-9e9427795cc6
1ef60a03-d0d1-44a3-ad57-d401fb679bd7	t	Gatoma	c40db82d-5a07-406c-9644-9e9427795cc6
d60292ef-c6af-4085-abe3-bdf89afc0604	t	Mulindi	c40db82d-5a07-406c-9644-9e9427795cc6
42a86b33-6e3b-41fd-9dbb-33aef9ef50be	t	Nyarwambu	c40db82d-5a07-406c-9644-9e9427795cc6
4896aea9-8c44-43d0-bc0c-cd7fed5ec8ab	t	Rukurura	c40db82d-5a07-406c-9644-9e9427795cc6
ec558a31-e46d-43d9-9335-2bb13772e8eb	t	Kabuga	09eef9c8-6170-4db9-9889-9356ce6d22b4
640c1aee-477d-4931-91ba-8fd5e8da9751	t	Nyiragifumba	09eef9c8-6170-4db9-9889-9356ce6d22b4
9b06da6b-c281-40a6-a9ba-d93ca1b4af80	t	Nyiravugiza	09eef9c8-6170-4db9-9889-9356ce6d22b4
a2cce29f-ffeb-48eb-b79d-5dc3249fc221	t	Remera	09eef9c8-6170-4db9-9889-9356ce6d22b4
799ad225-0139-464f-8064-289438b15453	t	Rusekera	09eef9c8-6170-4db9-9889-9356ce6d22b4
d7f47722-bccd-4e4f-87e8-68803d8121be	t	Ryaruyumba	09eef9c8-6170-4db9-9889-9356ce6d22b4
0addbe12-e1cd-478f-8470-e83260f8d951	t	Gakenke	25633821-a7f4-4f81-9101-3b6d0a844da4
f300840e-2a5a-45e1-9694-8c483fc434e2	t	Miyove	25633821-a7f4-4f81-9101-3b6d0a844da4
530c99b4-c3d3-4857-b48c-3d0a61fa6b03	t	Mubuga	25633821-a7f4-4f81-9101-3b6d0a844da4
f898d6e3-e4b1-4899-830f-410e7bc03a96	t	Cyamuganga	24c03381-7025-4516-990c-b37ecad3cdae
5248f885-fb8e-4116-9749-4995437e8c42	t	Gatenga	24c03381-7025-4516-990c-b37ecad3cdae
f6bcc53b-8284-42fc-aca1-a542badfb6d5	t	Kiruhura	24c03381-7025-4516-990c-b37ecad3cdae
4ad626e2-fb88-41ac-adbe-94e40a9ddc19	t	Mutarama	24c03381-7025-4516-990c-b37ecad3cdae
c5cd0711-2771-4606-8cd1-23f180a8a5b4	t	Rugerero	24c03381-7025-4516-990c-b37ecad3cdae
7fb30fa4-ceaf-41e5-8b91-ba73868f0efa	t	Rusambya	24c03381-7025-4516-990c-b37ecad3cdae
0cc0ddef-11c9-4f96-b2f1-b56133c8235c	t	Cyamuhinda	bf6c7627-e266-48ed-ab1f-3c45f5ffc07d
da71f93f-17d7-41fe-82ff-a953ca8d8986	t	Kigoma	bf6c7627-e266-48ed-ab1f-3c45f5ffc07d
73ddbdaf-e74b-4639-8644-432839adc5f4	t	Mwendo	bf6c7627-e266-48ed-ab1f-3c45f5ffc07d
9d15d833-412b-4462-8e48-6321cad348f0	t	Ngange	bf6c7627-e266-48ed-ab1f-3c45f5ffc07d
a86db648-5bcb-4b3f-868e-2d7a77287f98	t	Rebero	bf6c7627-e266-48ed-ab1f-3c45f5ffc07d
9a01f5e1-e2e4-46e3-9ce8-116a0fae98f0	t	Gaseke	4603bf6b-c990-474e-a2c2-89a1725bba09
78bf479d-0e53-42a6-ae3b-9c27366dee92	t	Kabeza	4603bf6b-c990-474e-a2c2-89a1725bba09
ef4f72c0-1a6d-4077-b9d1-68f5d9e87462	t	Musenyi	4603bf6b-c990-474e-a2c2-89a1725bba09
2b7f7d01-eaee-42cf-9c85-6451f520d50a	t	Mutandi	4603bf6b-c990-474e-a2c2-89a1725bba09
971a1cf0-f6b5-4a4b-a964-7467ceffeb93	t	Nyarubuye	4603bf6b-c990-474e-a2c2-89a1725bba09
f380acf5-182b-44fe-bd85-1f59d5f1dd50	t	Gahumuliza	03f1c959-1e38-4cdc-93d5-87f652389772
b3aa1cd4-5a0c-4f2a-9d5d-ce9edb4c5696	t	Jamba	03f1c959-1e38-4cdc-93d5-87f652389772
15051842-5371-4bf8-8cb8-0cf03b7cc7e5	t	Kabeza	03f1c959-1e38-4cdc-93d5-87f652389772
9b2c3e1e-7d2b-4d52-81a1-c9525b1844bb	t	Kabuga	03f1c959-1e38-4cdc-93d5-87f652389772
70e3df8e-ac32-42e8-870b-4694541ce184	t	Kiziba	03f1c959-1e38-4cdc-93d5-87f652389772
da8d9c86-a89a-4502-bb9b-182a4be9f203	t	Mataba	03f1c959-1e38-4cdc-93d5-87f652389772
4326ee9d-67b6-4d50-8938-26c9adea57a6	t	Butare	9184d6a1-9af4-4f46-94ed-428c92e49dc9
de28f7a3-50ba-4164-95d2-153890e4c0a0	t	Rusasa	9184d6a1-9af4-4f46-94ed-428c92e49dc9
25a26511-7d22-4b23-a564-70b6e5b166d3	t	Rwagihura	9184d6a1-9af4-4f46-94ed-428c92e49dc9
afe9aca9-f509-47b9-8346-8a539c1ba17d	t	Yaramba	9184d6a1-9af4-4f46-94ed-428c92e49dc9
f0bd283b-1257-4e2c-8384-a0c866750655	t	Gihanga	55856b79-635d-4f51-9b33-9d4743b72e93
ada26712-c97f-4e5b-a621-02c3c9bbae96	t	Gishari	55856b79-635d-4f51-9b33-9d4743b72e93
42f312e4-7fd9-4ad8-b57b-e9fd9e779dd2	t	Muguramo	55856b79-635d-4f51-9b33-9d4743b72e93
82dd9a42-4957-406f-bb42-7839538a4a15	t	Cyuru	d8b5c397-0da9-4970-9c76-538fab8d78b3
895528b9-797b-4aea-85f4-816722b855a4	t	Gisiza	d8b5c397-0da9-4970-9c76-538fab8d78b3
7634bbb5-df63-417b-83d5-a9c08da8fc89	t	Kinyami	d8b5c397-0da9-4970-9c76-538fab8d78b3
4f3d287b-71eb-44b8-ad5a-802deff7fc61	t	Mabare	d8b5c397-0da9-4970-9c76-538fab8d78b3
4c839030-80c9-459c-9e66-48e99d4739cf	t	Munyinya	d8b5c397-0da9-4970-9c76-538fab8d78b3
59c72877-d5cd-4d33-b347-aff8bf5864a9	t	Gitega	09af53ad-27c1-46c6-a4cb-913d025f942e
f2b84600-c8ee-4eda-aa1b-f886efdb083b	t	Kamutora	09af53ad-27c1-46c6-a4cb-913d025f942e
04cd94c4-45c2-4292-bddd-7158e7ad09ec	t	Karurama	09af53ad-27c1-46c6-a4cb-913d025f942e
2d94f8db-cb65-49a5-87dc-95346e049350	t	Bikumba	eacb7101-ebaa-4ee0-bdaf-22f16e820e4e
e6464479-fcb5-4c0e-9324-71ee2324004c	t	Gasharu	eacb7101-ebaa-4ee0-bdaf-22f16e820e4e
d59fb805-0456-4a72-9ba0-70dd60ab025a	t	Gatwaro	eacb7101-ebaa-4ee0-bdaf-22f16e820e4e
4bfbede0-c43c-4f2d-b64c-a87de053792f	t	Kigabiro	eacb7101-ebaa-4ee0-bdaf-22f16e820e4e
a3c05a4b-6368-44ae-b1cc-7076aea7ac95	t	Munanira	eacb7101-ebaa-4ee0-bdaf-22f16e820e4e
851a8079-dabe-4273-b994-78c49d2d0310	t	Nkoto	eacb7101-ebaa-4ee0-bdaf-22f16e820e4e
cd742878-7261-40bd-ba6e-45f268c78ece	t	Cyandaro	1c61869f-e949-4de1-9b62-58e31799e7d6
4dc67c56-f50c-47e4-8bc7-4ad3957eec4e	t	Gasambya	1c61869f-e949-4de1-9b62-58e31799e7d6
298fb136-527d-493a-9cc2-3290bd15ce5c	t	Gashirira	1c61869f-e949-4de1-9b62-58e31799e7d6
40075e19-2cf8-42ea-b64b-fee806a6e38f	t	Kabare	1c61869f-e949-4de1-9b62-58e31799e7d6
cee59cce-2f99-4a5b-a924-5091497ecd93	t	Rebero	1c61869f-e949-4de1-9b62-58e31799e7d6
cccaa251-c61f-40af-8ad4-4cdfddbb484c	t	Ruhondo	1c61869f-e949-4de1-9b62-58e31799e7d6
a672a9cb-9221-4ef3-94ab-5134382b13f2	t	Cyeru	b34a0d83-a29b-4ba1-98ee-6256da7ad7ed
9068b732-2e13-4494-883c-c99c44f066c2	t	Kigabiro	b34a0d83-a29b-4ba1-98ee-6256da7ad7ed
4a6fe973-3246-4f06-83cb-f35f1f60f4d2	t	Nyagahinga	b34a0d83-a29b-4ba1-98ee-6256da7ad7ed
fc0d1954-f9e3-4bcc-a493-a6e0476200ae	t	Bushara	1beabf1a-e57f-4555-9040-3ec701b7537a
66c7cc13-27ae-45c5-a5ff-919d7e6aff0c	t	Shangasha	1beabf1a-e57f-4555-9040-3ec701b7537a
3fc878d6-bd8d-4c61-ba69-e7e35336afb5	t	Gisesero	5c5d8594-5c8a-4faf-9c62-791b1a7e7999
9d456ac8-aea9-4df1-8bbb-9f2cc761e7e9	t	Sahara	5c5d8594-5c8a-4faf-9c62-791b1a7e7999
b4b07d6f-f00a-4bd3-90c5-bafd240b4e64	t	Bukinanyana	a6f5901e-98ed-4bb7-b93f-a4af02f4089d
951c57b1-57fa-47e2-9537-02a9b5ed823c	t	Buruba	a6f5901e-98ed-4bb7-b93f-a4af02f4089d
e31218b9-1976-44af-bc02-030ad4a4db66	t	Cyanya	a6f5901e-98ed-4bb7-b93f-a4af02f4089d
0acad510-8983-4a50-b99e-54b6f0131187	t	Kabeza	a6f5901e-98ed-4bb7-b93f-a4af02f4089d
574b29f6-ae5e-40c4-b925-d35c6c2b0ff9	t	Migeshi	a6f5901e-98ed-4bb7-b93f-a4af02f4089d
66dc38c8-01e1-4063-a26d-8fb43707df27	t	Rwebeya	a6f5901e-98ed-4bb7-b93f-a4af02f4089d
74f4cf3b-58ab-46cd-a94b-98b972cf8610	t	Gakoro	d057edca-63c4-43c0-b66a-cf00917f0f92
9c70327f-7d2e-4945-afaf-ee962846eb69	t	Gasakuza	d057edca-63c4-43c0-b66a-cf00917f0f92
8328c107-2047-4c6e-8420-a24fda1d2306	t	Kabirizi	d057edca-63c4-43c0-b66a-cf00917f0f92
82958763-daa4-40d1-8ccf-ce048013e0bc	t	Karwasa	d057edca-63c4-43c0-b66a-cf00917f0f92
cca09444-52f9-4e7d-a4e3-7444b401a091	t	Kigabiro	f83d62e0-e0e2-4ee3-b6b0-09f3ba39628a
ec04cd26-5ee8-473a-91f6-1acacc065f48	t	Kivumu	f83d62e0-e0e2-4ee3-b6b0-09f3ba39628a
2a74def3-6551-41e7-a0de-7e2505a7b291	t	Mbwe	f83d62e0-e0e2-4ee3-b6b0-09f3ba39628a
f61ac71e-4b14-4607-a0c4-cd2df306d724	t	Muharuro	f83d62e0-e0e2-4ee3-b6b0-09f3ba39628a
1e59846c-80f6-4889-8bb9-149889752d8c	t	Mudakama	ffe8dea5-cf77-4cd8-b338-4adde6c77d29
bf3c8cb3-f9aa-4f41-9cc4-15de06222d70	t	Murago	ffe8dea5-cf77-4cd8-b338-4adde6c77d29
0f6b6d1b-0b65-4cf5-9197-ba84d03da59e	t	Rubindi	ffe8dea5-cf77-4cd8-b338-4adde6c77d29
cc7c0804-e05f-4ebf-afdf-f54a1cc16d65	t	Rungu	ffe8dea5-cf77-4cd8-b338-4adde6c77d29
400991a1-86c0-4d8d-8ec0-33c25811e1b7	t	Birira	a11ed3c1-6b6a-4b4b-a5d4-2df986766d98
755eb9bd-3c63-4787-a07f-6764ecf67b61	t	Buramira	a11ed3c1-6b6a-4b4b-a5d4-2df986766d98
8177cdbf-bef0-4aee-839e-b2886da508cb	t	Kivumu	a11ed3c1-6b6a-4b4b-a5d4-2df986766d98
2f0a44d6-6ae6-44c3-940f-e2f48e58a561	t	Kaguhu	d35402e8-2fd2-4ad8-ba41-08f9df59c178
751e86b5-2982-4564-9385-476522783c5c	t	Kampanga	d35402e8-2fd2-4ad8-ba41-08f9df59c178
5a34d3eb-2faf-45c1-aa89-f27086230007	t	Nyabigoma	d35402e8-2fd2-4ad8-ba41-08f9df59c178
1fc2628a-0dde-41ad-a50c-a5ca10c245e9	t	Nyonirima	d35402e8-2fd2-4ad8-ba41-08f9df59c178
e3d4a732-7d16-43f0-a863-cb89c5748dc0	t	Cyabararika	f2d29deb-78e4-47c5-8af1-0814ddd0ee60
8d3082d9-d89f-4714-a4e7-479da3ac3c9a	t	Kigombe	f2d29deb-78e4-47c5-8af1-0814ddd0ee60
caf05d04-fa88-44f0-8a90-4cf4a333d150	t	Mpenge	f2d29deb-78e4-47c5-8af1-0814ddd0ee60
e1b2bcc2-43ae-424d-a69e-b25e2ab7059b	t	Ruhengeri	f2d29deb-78e4-47c5-8af1-0814ddd0ee60
8f0110b0-451f-444f-a903-eb8961b73b41	t	Cyivugiza	29d3ebe2-91ba-4a8c-8ffb-685fa5c133b0
801b3439-3d60-4ca4-aa0d-b105b5d0230b	t	Cyogo	29d3ebe2-91ba-4a8c-8ffb-685fa5c133b0
5a92fd87-ddf6-4903-9d6a-5d1477e21319	t	Mburabuturo	29d3ebe2-91ba-4a8c-8ffb-685fa5c133b0
fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb	t	Cyabagarura	1d20a106-838e-405f-9293-d6d959170d3f
13580f29-a41b-40b6-b764-4b62db9e6a3f	t	Garuka	1d20a106-838e-405f-9293-d6d959170d3f
95fba288-0531-4f98-ab8b-ee86c475cb94	t	Kabazungu	1d20a106-838e-405f-9293-d6d959170d3f
cb1ab8ad-a062-45bd-a52e-d2887414cd87	t	Nyarubuye	1d20a106-838e-405f-9293-d6d959170d3f
b12e0176-b705-462b-aded-5f1186b23e22	t	Rwambogo	1d20a106-838e-405f-9293-d6d959170d3f
e376ead6-7811-4b05-a813-664a135e0a0c	t	Bikara	42c3d202-9453-4fde-95f9-10826c3e334a
e6f579e8-06cc-4bfc-ade4-757904c71b45	t	Cyivugiza	33411e35-0ea0-4074-aed0-df17ae5b8759
092769cf-cd85-4776-a4c6-192d4efa2659	t	Kabeza	33411e35-0ea0-4074-aed0-df17ae5b8759
b5e732e3-0157-46b5-bc05-56e4bed52534	t	Kamwumba	33411e35-0ea0-4074-aed0-df17ae5b8759
1a22ea5b-4467-4c5a-8cef-83504d1582d4	t	Muhabura	33411e35-0ea0-4074-aed0-df17ae5b8759
93db33c2-023f-4aa0-bb01-981f24f9f6e4	t	Ninda	33411e35-0ea0-4074-aed0-df17ae5b8759
0506eb21-e775-4f3f-96f8-e7ea8c4a5173	t	Gasongero	38909dcd-a47c-451d-a2e7-1487b503777b
bca0ca96-fad9-4571-aaae-89694742d01c	t	Kamisave	38909dcd-a47c-451d-a2e7-1487b503777b
6ced6df2-f1aa-4693-9eaa-0d894d308480	t	Murandi	38909dcd-a47c-451d-a2e7-1487b503777b
b75680ef-d79c-446a-9463-c278117d4214	t	Murwa	38909dcd-a47c-451d-a2e7-1487b503777b
bdbd38f4-83cb-4110-8719-ff4be06a533e	t	Rurambo	38909dcd-a47c-451d-a2e7-1487b503777b
e45413bc-34bd-4192-ab7b-1cc51ab40a39	t	Bumara	22f4c8e8-3437-43ef-96fe-dea49651544f
682d57cd-d24b-4ad9-8d6f-77f4614e8bbd	t	Kabushinge	22f4c8e8-3437-43ef-96fe-dea49651544f
7afdd98f-39d7-4e66-a155-531175dcd1b6	t	Musezero	22f4c8e8-3437-43ef-96fe-dea49651544f
f43896e1-6f99-487a-889a-5dd80ffb58be	t	Nturo	22f4c8e8-3437-43ef-96fe-dea49651544f
b7441b6a-2367-4f5b-8085-4e490c95ebac	t	Nyarubuye	22f4c8e8-3437-43ef-96fe-dea49651544f
dc3b31e6-b0a3-42c7-a4cb-11352d55d912	t	Gakingo	f2865c2a-d92a-4182-800d-05f89c9ddcec
9b4a4c27-0eae-40b2-8a8d-4ba08a6f0d93	t	Kibuguzo	f2865c2a-d92a-4182-800d-05f89c9ddcec
227c848d-2a3f-4a74-b583-3ddde1e62778	t	Mudende	f2865c2a-d92a-4182-800d-05f89c9ddcec
075c957f-3f2c-4633-a480-eabd2f0d6626	t	Cyohoha	ede3131d-4674-4c49-9466-dc5bb316ba08
0cb3639f-451d-4f71-b992-86b1c33bc1d1	t	Gitare	ede3131d-4674-4c49-9466-dc5bb316ba08
c67fc204-cce9-4d62-b585-30b30de2f3e1	t	Rwamahwa	ede3131d-4674-4c49-9466-dc5bb316ba08
5e5e1a51-e28d-4edb-8c38-12a44f9d49c7	t	Butangampund	72d94312-6c08-4428-b20d-c2dc61f1ac77
f0d808eb-bf24-452d-a9c6-a1808d694ae0	t	Karengeri	72d94312-6c08-4428-b20d-c2dc61f1ac77
ff6b1c8b-2c37-4040-aa5b-31b2a7e59e2f	t	Taba	72d94312-6c08-4428-b20d-c2dc61f1ac77
bd965e36-8dd1-465b-900d-6b1659cf43e7	t	Gasiza	d493e9f1-72d9-420a-89a9-c099b4ff4843
78adca9d-41e6-4705-92b6-aa23361f16e6	t	Giko	d493e9f1-72d9-420a-89a9-c099b4ff4843
c4b913e2-5554-4d7a-905e-42c9993fd136	t	Kayenzi	d493e9f1-72d9-420a-89a9-c099b4ff4843
666302f9-4390-4270-84b6-2620b7e40161	t	Mukoto	d493e9f1-72d9-420a-89a9-c099b4ff4843
353f6c52-e1dc-4f26-98c7-411cddf02f75	t	Nyirangarama	d493e9f1-72d9-420a-89a9-c099b4ff4843
ff854686-79be-4f08-9a83-f4a6c449a3df	t	Busoro	f277633f-cee0-4ea3-8972-815e2bc2eb9d
acd618c3-4d0f-4911-8af7-f204108db92b	t	Butare	f277633f-cee0-4ea3-8972-815e2bc2eb9d
1cb3f1ef-090e-40de-ba50-88b70d1affd3	t	Gahororo	f277633f-cee0-4ea3-8972-815e2bc2eb9d
0fee8ed7-276a-433d-b4e8-b9bd6ab00f1c	t	Gitumba	f277633f-cee0-4ea3-8972-815e2bc2eb9d
bcc4b1c0-43a8-43df-b845-46045e2921aa	t	Karama	f277633f-cee0-4ea3-8972-815e2bc2eb9d
8798f04c-58fa-47fd-b14a-959c2920e64b	t	Mwumba	f277633f-cee0-4ea3-8972-815e2bc2eb9d
75a16664-1f6f-4253-b710-0636a9a92235	t	Budakiranya	8fba04dc-66ef-4dc3-b219-3661320e3001
99d53ab2-b4a4-480b-b4a5-2040bfcd93c9	t	Migendezo	8fba04dc-66ef-4dc3-b219-3661320e3001
2a07c267-3122-4ce4-bbee-c253b61e32ca	t	Rudogo	8fba04dc-66ef-4dc3-b219-3661320e3001
39fa42fc-383e-482d-bd9e-a76d363db69e	t	Burehe	b7978f69-db90-4f08-b822-726e6684fa77
907d4ca5-be56-4e3e-ac4c-e3103ab35ddb	t	Marembo	b7978f69-db90-4f08-b822-726e6684fa77
7c7ed2d9-d93a-47b1-9324-4e2674ff5373	t	Rwili	b7978f69-db90-4f08-b822-726e6684fa77
13d88bc6-6ac9-4bdd-9b48-29f6f12c250e	t	Butunzi	654e79d5-0ffb-41d1-9f68-c28ef7e1b79a
92affa87-6a0d-4ee9-a507-c26bdc789f04	t	Karegamazi	654e79d5-0ffb-41d1-9f68-c28ef7e1b79a
e357546f-633c-4f56-9707-c54d88621a27	t	Marembo	654e79d5-0ffb-41d1-9f68-c28ef7e1b79a
b4b27848-1559-4e27-a1ab-8832c393058c	t	Rebero	654e79d5-0ffb-41d1-9f68-c28ef7e1b79a
b0b9a06b-72e5-49c0-888c-6acce2f1e796	t	Kamushenyi	cc27274a-1a75-4b85-af7c-5cf42c9ba5e9
a3804965-a2c9-43f7-975f-d8bcaf09faba	t	Kigarama	cc27274a-1a75-4b85-af7c-5cf42c9ba5e9
7fd08877-efa9-4d6c-9bf4-ab211129640b	t	Mubuga	cc27274a-1a75-4b85-af7c-5cf42c9ba5e9
8f296180-394f-4bc4-acdb-13193cc28edf	t	Murama	cc27274a-1a75-4b85-af7c-5cf42c9ba5e9
72ff90f2-23b9-4b10-b2c6-c2469f257076	t	Sayo	cc27274a-1a75-4b85-af7c-5cf42c9ba5e9
61cb21f5-591b-4543-9597-940a832d41b8	t	Kabuga	aa32b891-488a-4f4a-baff-572aaec48669
bbc1efdf-4b3f-45c9-ac99-184c41e5b4b3	t	Kigarama	aa32b891-488a-4f4a-baff-572aaec48669
53693072-853c-4d11-931c-5da397c6c398	t	Kivugiza	aa32b891-488a-4f4a-baff-572aaec48669
6e7ec98a-36a0-4060-985b-b2b395e0d6c7	t	Nyamyumba	aa32b891-488a-4f4a-baff-572aaec48669
31d7c56e-824e-4239-a234-766d7dc3d7c2	t	Shengampuli	aa32b891-488a-4f4a-baff-572aaec48669
454a8229-f8c9-454a-aaa4-68901313f9ab	t	Bukoro	34f8e971-791d-4c9d-890c-3022188f04fe
8300d45a-dc93-4889-92a8-a22fc848a3f3	t	Mushari	34f8e971-791d-4c9d-890c-3022188f04fe
66a4ba9d-b1a7-4c72-b41f-0a5987b09d17	t	Ngiramazi	34f8e971-791d-4c9d-890c-3022188f04fe
81ea7634-9af0-488c-aea9-bb5f584fcc47	t	Rurenge	34f8e971-791d-4c9d-890c-3022188f04fe
c502812e-6ef1-4507-bd97-3edbe6c06e59	t	Bubangu	248f4b69-a749-45f6-9bab-a10095eac21d
2b20de79-f953-45f0-b57f-5f6a8288cca3	t	Gatwa	248f4b69-a749-45f6-9bab-a10095eac21d
fba0a7b9-364f-4370-ad83-45a75f145e55	t	Mugambazi	248f4b69-a749-45f6-9bab-a10095eac21d
87f7d85c-f717-437c-b830-ed189fb7d34d	t	Mvuzo	248f4b69-a749-45f6-9bab-a10095eac21d
ed18c39d-5c29-49ab-a016-7b2eff6ecb72	t	Kabuga	646b3351-d51b-4b42-b145-0fb509512724
5c3b7ece-b7cd-4c01-bbde-bef8bb9fdb6b	t	Karambo	646b3351-d51b-4b42-b145-0fb509512724
e3ed9bc6-7116-4914-a9a8-d6a73427b615	t	Mugote	646b3351-d51b-4b42-b145-0fb509512724
bef4a4ff-47c0-4b80-b3dd-e0c7fee70eb2	t	Munyarwanda	646b3351-d51b-4b42-b145-0fb509512724
f4209573-ec17-45cb-b05a-e1c72d2bc26a	t	NKajevuba	f2630f14-2e89-49f0-8d75-a502386fd818
ed96d5c3-254a-42bb-bd02-e3cd9381d578	t	NKiyanza	f2630f14-2e89-49f0-8d75-a502386fd818
0e667f40-5e2b-45f1-bd74-9f9523664433	t	NMahaza	f2630f14-2e89-49f0-8d75-a502386fd818
0785fd31-685c-458c-a7ff-7d7becd5820f	t	Buraro	e8b17e24-19c4-444f-a732-d6091b72a85a
2d252f2f-21b3-49f1-aa11-3f07c88cac8e	t	Bwimo	e8b17e24-19c4-444f-a732-d6091b72a85a
91198b9e-3449-42b4-a56e-4fc32d1bad09	t	Mberuka	e8b17e24-19c4-444f-a732-d6091b72a85a
36edce68-d553-45e9-a51a-bbe481c3efeb	t	Mbuye	e8b17e24-19c4-444f-a732-d6091b72a85a
89956ede-f8cd-41ac-8d4c-c1494609c92a	t	Gako	f888772a-eb27-4991-8d25-303a4f16a104
301164a7-c391-4743-af33-c0cb316da2ca	t	Kirenge	f888772a-eb27-4991-8d25-303a4f16a104
5947091c-cf91-4640-b13f-d79a9810d86d	t	Taba	f888772a-eb27-4991-8d25-303a4f16a104
fb309eb3-d949-4fef-a486-a122eb7e33f9	t	Bugaragara	74c407ee-3c0b-4fae-ae8e-d05f96389c92
e9ee49da-346f-4747-a622-956696f42875	t	Kijabagwe	74c407ee-3c0b-4fae-ae8e-d05f96389c92
f251d8bb-aa76-42e1-88bd-cb7d59729f7d	t	Muvumu	74c407ee-3c0b-4fae-ae8e-d05f96389c92
cd0169ad-c97f-4896-9bff-d5f68defc787	t	Rubona	74c407ee-3c0b-4fae-ae8e-d05f96389c92
b018143f-1c3f-4d4f-8cd2-daefd38b786d	t	Rutonde	74c407ee-3c0b-4fae-ae8e-d05f96389c92
fca17902-d0bb-452d-8a54-08607be6e612	t	Barari	df9e755b-f545-40f8-9113-b6f42487a28b
e6d81045-9f37-4fff-ba6b-ee8b727803c9	t	Gahabwa	df9e755b-f545-40f8-9113-b6f42487a28b
91f3ab4e-6f0f-43d0-be14-c1e3bb5d6fb4	t	Misezero	df9e755b-f545-40f8-9113-b6f42487a28b
e38b8b7d-81fe-4b06-b3e9-e5f3715c3f8e	t	Nyirabirori	df9e755b-f545-40f8-9113-b6f42487a28b
b8bf52a0-9837-4f77-9df3-0f002583f651	t	Taba	df9e755b-f545-40f8-9113-b6f42487a28b
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chat_messages (id, created_at, created_by, updated_at, updated_by, message, sender_id, session_id) FROM stdin;
\.


--
-- Data for Name: chat_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chat_sessions (id, created_at, created_by, updated_at, updated_by, status, subject, agent_id, customer_id) FROM stdin;
\.


--
-- Data for Name: communication_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.communication_logs (id, created_at, created_by, updated_at, updated_by, channel, notes, outcome, reference_id, reference_type, subject, customer_id, handled_by_id) FROM stdin;
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coupons (id, created_at, created_by, updated_at, updated_by, active, amount, code, current_usage, expiry_date, minimum_order_amount, type, usage_limit) FROM stdin;
\.


--
-- Data for Name: customer_addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_addresses (id, created_at, created_by, updated_at, updated_by, cell, default_address, delivery_instructions, delivery_phone_number, district, label, province, sector, village, customer_id) FROM stdin;
\.


--
-- Data for Name: customer_metrics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_metrics (id, created_at, created_by, updated_at, updated_by, average_order_value, engagement_score, return_rate_percentage, customer_id) FROM stdin;
\.


--
-- Data for Name: customer_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_profiles (id, created_at, created_by, updated_at, updated_by, last_purchase_date, total_purchases, total_spent, customer_id, segment_id) FROM stdin;
\.


--
-- Data for Name: customer_segments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_segments (id, created_at, created_by, updated_at, updated_by, description, name) FROM stdin;
\.


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discounts (id, created_at, created_by, updated_at, updated_by, active, description, discount_percentage, end_date, name, start_date) FROM stdin;
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.districts (id, enabled, name, province_id) FROM stdin;
889318f2-78b0-408b-9687-8f5948117ef7	t	Gasabo	d2e54ace-1fec-493f-9acb-1a736b3c0982
e95499e5-2001-483e-910a-87498359e4fb	t	Kicukiro	d2e54ace-1fec-493f-9acb-1a736b3c0982
8bf1e693-a9ff-4574-8d06-d477f83e1ee9	t	Nyarugenge	d2e54ace-1fec-493f-9acb-1a736b3c0982
9425aa03-feed-4bb9-bec9-89ea2363ff3c	t	Gisagara	d00755fc-24a9-4bba-a784-a140e97db2e2
7022d524-a71c-4fd5-b052-bc0d26dfb706	t	Huye	d00755fc-24a9-4bba-a784-a140e97db2e2
ceea3d82-4960-4991-9033-1b0ca2fa582e	t	Kamonyi	d00755fc-24a9-4bba-a784-a140e97db2e2
03f9750e-76c9-4e99-9581-c7a6af198da7	t	Muhanga	d00755fc-24a9-4bba-a784-a140e97db2e2
7ddf0119-599a-4504-bdfb-62fc1c059b25	t	Nyamagabe	d00755fc-24a9-4bba-a784-a140e97db2e2
21d26823-c3e1-4e62-98df-bbb5b503ad32	t	Nyanza	d00755fc-24a9-4bba-a784-a140e97db2e2
d5c880e1-77ef-4587-a9fe-e19fdc56367d	t	Nyaruguru	d00755fc-24a9-4bba-a784-a140e97db2e2
297891ef-4f24-430a-8d49-b09c7165d822	t	Ruhango	d00755fc-24a9-4bba-a784-a140e97db2e2
965ce8e7-1249-4270-a967-73c2780fdb63	t	Karongi	db916524-c5e3-4fd5-a428-700bd54f9d59
982bc8c3-1efb-40ce-ab74-83c51ff1416d	t	Ngororero	db916524-c5e3-4fd5-a428-700bd54f9d59
c3eb2998-7bdd-4afe-8fa8-6c050f83a047	t	Nyabihu	db916524-c5e3-4fd5-a428-700bd54f9d59
f7715340-99f1-4d53-9348-8b70b4ab3315	t	Nyamasheke	db916524-c5e3-4fd5-a428-700bd54f9d59
7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f	t	Rubavu	db916524-c5e3-4fd5-a428-700bd54f9d59
09e6c3c4-1a53-421d-aeb9-059f26d5af84	t	Rusizi	db916524-c5e3-4fd5-a428-700bd54f9d59
6b34fbc4-e056-463d-a218-f919d1fd581b	t	Rutsiro	db916524-c5e3-4fd5-a428-700bd54f9d59
5e84cb9b-c57a-45d6-b604-9d31b439dbf5	t	Burera	40a0fb3c-366a-4dc8-ab85-59a41be3e483
79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4	t	Gakenke	40a0fb3c-366a-4dc8-ab85-59a41be3e483
65323863-6675-4a80-b30d-a9249cc93bbb	t	Gicumbi	40a0fb3c-366a-4dc8-ab85-59a41be3e483
15d178d2-e99e-4db0-9080-6d484e5e8fe6	t	Musanze	40a0fb3c-366a-4dc8-ab85-59a41be3e483
c81995c8-e629-459d-88a0-a211ccd02d70	t	Rulindo	40a0fb3c-366a-4dc8-ab85-59a41be3e483
1ce2fe8a-4d43-4816-a812-660decbfd78a	t	Bugesera	880a4470-2530-4197-8554-07fa23e8f025
4a6b23ff-e2e4-4a23-aea3-ae9f6a02f02c	t	Gatsibo	880a4470-2530-4197-8554-07fa23e8f025
2e2ac437-4b87-4f56-a163-1e267733fbef	t	Kayonza	880a4470-2530-4197-8554-07fa23e8f025
53f0af7a-3b79-4c3b-b371-4e13b1095537	t	Kirehe	880a4470-2530-4197-8554-07fa23e8f025
205b4143-933a-499f-972a-970d03715214	t	Ngoma	880a4470-2530-4197-8554-07fa23e8f025
da677b83-4dfa-43d7-a751-d92fc9f3dab1	t	Nyagatare	880a4470-2530-4197-8554-07fa23e8f025
b288c3de-8abc-49b9-b50a-f9a61a83c618	t	Rwamagana	880a4470-2530-4197-8554-07fa23e8f025
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, created_at, created_by, updated_at, updated_by, amount, category, description, expense_date, status) FROM stdin;
\.


--
-- Data for Name: faq_articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.faq_articles (id, created_at, created_by, updated_at, updated_by, answer, category, published, question) FROM stdin;
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.feedbacks (id, created_at, created_by, updated_at, updated_by, category, comments, rating, reference_id, customer_id) FROM stdin;
\.


--
-- Data for Name: financial_reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.financial_reports (id, created_at, created_by, updated_at, updated_by, generated_date, net_profit, report_period, total_expenses, total_revenue) FROM stdin;
\.


--
-- Data for Name: fulfillment_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fulfillment_orders (id, created_at, created_by, updated_at, updated_by, completed_at, dispatched_at, packed_at, picked_at, status, order_id, shipment_id) FROM stdin;
\.


--
-- Data for Name: inventory_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_items (id, created_at, created_by, updated_at, updated_by, location, low_stock_threshold, product_name, quantity, sku, unit_cost) FROM stdin;
\.


--
-- Data for Name: kpi_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.kpi_records (id, created_at, created_by, updated_at, updated_by, description, metric_name, metric_value, record_date) FROM stdin;
\.


--
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.login_attempts (id, created_at, created_by, updated_at, updated_by, email, failure_reason, ip_address, success) FROM stdin;
\.


--
-- Data for Name: mfa_otps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mfa_otps (id, created_at, created_by, updated_at, updated_by, code_hash, expiry_date, mfa_token, used, user_id) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, created_at, created_by, updated_at, updated_by, message, read, related_id, title, type, user_id) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_items (id, created_at, created_by, updated_at, updated_by, applied_tax_code, applied_tax_name, applied_tax_rate, line_cost, line_tax_amount, line_total_including_tax, quantity, sub_total, unit_cost, unit_price, unit_price_including_tax, unit_tax_amount, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: order_tracking_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_tracking_events (id, created_at, created_by, updated_at, updated_by, note, status, order_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, created_at, created_by, updated_at, updated_by, billing_address, coupon_code, delivery_instructions, delivery_phone_number, discount_amount, order_channel, order_number, payment_method, payment_reference, shipping_address, shipping_cell, shipping_district, shipping_province, shipping_sector, shipping_village, status, sub_total_amount, tax_amount, tax_rate, total_amount, cashier_id, customer_id, shipping_address_id) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_reset_tokens (id, created_at, created_by, updated_at, updated_by, expiry_date, token, used, user_id) FROM stdin;
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payment_transactions (id, created_at, created_by, updated_at, updated_by, amount, payment_reference, provider, reconciled_at, reconciliation_notes, reconciliation_status, status, transaction_type, order_id) FROM stdin;
\.


--
-- Data for Name: procurement_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.procurement_orders (id, created_at, created_by, updated_at, updated_by, expected_delivery_date, quantity_ordered, quantity_received, status, total_cost, unit_cost, inventory_item_id, product_id, supplier_id) FROM stdin;
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_images (id, created_at, created_by, updated_at, updated_by, alt_text, is_primary, url, product_id) FROM stdin;
\.


--
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_reviews (id, created_at, created_by, updated_at, updated_by, comment, rating, verified_purchase, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, created_at, created_by, updated_at, updated_by, average_rating, cost_price, description, featured, name, price, sku, status, category_id, discount_id, inventory_item_id, tax_rate_id) FROM stdin;
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.provinces (id, enabled, name) FROM stdin;
d2e54ace-1fec-493f-9acb-1a736b3c0982	t	Kigali City
d00755fc-24a9-4bba-a784-a140e97db2e2	t	Southern Province
db916524-c5e3-4fd5-a428-700bd54f9d59	t	Western Province
40a0fb3c-366a-4dc8-ab85-59a41be3e483	t	Northern Province
880a4470-2530-4197-8554-07fa23e8f025	t	Eastern Province
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.refresh_tokens (id, created_at, created_by, updated_at, updated_by, expiry_date, revoked, token, user_id) FROM stdin;
\.


--
-- Data for Name: return_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.return_requests (id, created_at, created_by, updated_at, updated_by, admin_notes, approved_at, completed_at, reason, refund_provider, refund_reference, refund_requested_at, refund_status, refunded_amount, requested_amount, status, order_id) FROM stdin;
\.


--
-- Data for Name: revenues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.revenues (id, created_at, created_by, updated_at, updated_by, amount, reference_id, revenue_date, source) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, created_at, created_by, updated_at, updated_by, description, name) FROM stdin;
df33d37d-ce52-4f2b-84bf-b89035ef8807	2026-07-14 18:08:49.07181	\N	2026-07-14 18:08:49.07181	\N	Default role: ROLE_ADMIN	ROLE_ADMIN
2b85aa8a-6953-467e-a93d-6ab45f60c7bf	2026-07-14 18:08:49.088912	\N	2026-07-14 18:08:49.088912	\N	Default role: ROLE_EMPLOYEE	ROLE_EMPLOYEE
d7002bf9-8e3b-417c-bfe6-79e3a1a5a8be	2026-07-14 18:08:49.105444	\N	2026-07-14 18:08:49.105444	\N	Default role: ROLE_CUSTOMER	ROLE_CUSTOMER
43d8e6d7-cfa9-4e75-96e3-4d006f2521a5	2026-07-14 18:08:49.114735	\N	2026-07-14 18:08:49.114735	\N	Default role: ROLE_SUPPORT_AGENT	ROLE_SUPPORT_AGENT
\.


--
-- Data for Name: sales_reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_reports (id, created_at, created_by, updated_at, updated_by, active_customers, report_date, report_period, total_orders, total_revenue) FROM stdin;
\.


--
-- Data for Name: satisfaction_surveys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.satisfaction_surveys (id, created_at, created_by, updated_at, updated_by, feedback, rating, ticket_id) FROM stdin;
\.


--
-- Data for Name: sectors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sectors (id, enabled, name, district_id) FROM stdin;
c7e20fec-4cb2-4feb-8940-f13fa4b3cd3e	t	Bumbogo	889318f2-78b0-408b-9687-8f5948117ef7
7fd9760e-c470-4a0a-b1cf-f678b053d0e5	t	Gatsata	889318f2-78b0-408b-9687-8f5948117ef7
94dc0784-2fb8-4cf8-825c-138afe08517d	t	Gikomero	889318f2-78b0-408b-9687-8f5948117ef7
be06a851-7692-475d-8344-31cc21c79951	t	Gisozi	889318f2-78b0-408b-9687-8f5948117ef7
bc21f93b-e3c4-45b9-b75f-a88b547c3bab	t	Jabana	889318f2-78b0-408b-9687-8f5948117ef7
50a93f43-f428-460e-938d-a59451846a48	t	Jali	889318f2-78b0-408b-9687-8f5948117ef7
41114943-a4e3-4ac8-b65b-eaccc192fb47	t	Kacyiru	889318f2-78b0-408b-9687-8f5948117ef7
79c23033-66e8-4611-9c98-50fda178a30f	t	Kimihurura	889318f2-78b0-408b-9687-8f5948117ef7
5c9c02c9-cc0b-47c8-86f2-b9df1070c5d5	t	Kimironko	889318f2-78b0-408b-9687-8f5948117ef7
363e01ca-da5e-4657-a4a3-57ab71118396	t	Kinyinya	889318f2-78b0-408b-9687-8f5948117ef7
e982d12a-e873-4e36-991c-0dddf6e3374f	t	Ndera	889318f2-78b0-408b-9687-8f5948117ef7
09f67c22-bcf0-453f-b4d0-a2f697d9a5d8	t	Nduba	889318f2-78b0-408b-9687-8f5948117ef7
4172bf67-72a5-4133-ab2f-2e01c2846eeb	t	Remera	889318f2-78b0-408b-9687-8f5948117ef7
a47e6718-4042-47c0-8d4a-6c3359072fa3	t	Rusororo	889318f2-78b0-408b-9687-8f5948117ef7
3d050ca7-973e-464b-81fa-194194f0581b	t	Rutunga	889318f2-78b0-408b-9687-8f5948117ef7
9231ba6c-0456-492a-949c-b40040f8d28f	t	Gahanga	e95499e5-2001-483e-910a-87498359e4fb
7d0ca2ef-96b4-4e27-abe7-a0083b0f4279	t	Gatenga	e95499e5-2001-483e-910a-87498359e4fb
742d4dfc-52c7-4818-8798-b10a701b4683	t	Gikondo	e95499e5-2001-483e-910a-87498359e4fb
cb06f579-054e-4f2a-8882-2960581f7d2b	t	Kagarama	e95499e5-2001-483e-910a-87498359e4fb
a4b7d335-d039-4812-94b5-8d2089d50c78	t	Kanombe	e95499e5-2001-483e-910a-87498359e4fb
8c790f45-c6a5-4ed3-863b-136640d8507a	t	Kicukiro	e95499e5-2001-483e-910a-87498359e4fb
a60bdb67-7f24-490c-be58-4b2bfb7ebbab	t	Kigarama	e95499e5-2001-483e-910a-87498359e4fb
2eedcbc7-a7b4-489c-b235-87247c721e0d	t	Masaka	e95499e5-2001-483e-910a-87498359e4fb
9ea9e7ba-41d4-4760-ad17-468339c56f21	t	Niboye	e95499e5-2001-483e-910a-87498359e4fb
c4a2dbb5-db5e-4d80-88a0-2841f3b1d13e	t	Nyarugunga	e95499e5-2001-483e-910a-87498359e4fb
748edae7-919a-40bc-8e87-161a32959dad	t	Gitega	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
3d2e3e55-bd66-4e63-8e1c-fc877a39e141	t	Kanyinya	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
7d991248-dbb0-4d70-8cbe-8bdc3c4d92c8	t	Kigali	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
61bd8cf6-f71c-4927-ab81-fd1fef044e5b	t	Kimisagara	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
f27b11f9-27f9-491e-ae62-77d8bb95d65d	t	Mageragere	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
ce0c74fd-bfce-4b73-9cb0-81dc4bb167bf	t	Muhima	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
72926ace-63be-4d4a-a28e-0afe8e300356	t	Nyakabanda	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
78ffdb10-b17a-4017-b9e8-3eb4350ec0bb	t	Nyamirambo	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
7d4c2fad-0136-4415-942b-3d2778f49a18	t	Nyarugenge	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
68b6fbf6-0ddc-410a-a713-46a393fa01c9	t	Rwezamenyo	8bf1e693-a9ff-4574-8d06-d477f83e1ee9
33b3fe86-e7e7-4a8e-8b2c-27728b484930	t	Gikonko	9425aa03-feed-4bb9-bec9-89ea2363ff3c
c0258f8d-8cbd-4346-b30a-c69337a3a3f9	t	Gishubi	9425aa03-feed-4bb9-bec9-89ea2363ff3c
abf7b66f-6d00-430a-894c-37b8c93dd007	t	Kansi	9425aa03-feed-4bb9-bec9-89ea2363ff3c
452c6a96-2a92-4589-8aca-5a4409f48a31	t	Kibirizi	9425aa03-feed-4bb9-bec9-89ea2363ff3c
9337e292-08f0-4623-95f4-f4bdb25df587	t	Kigembe	9425aa03-feed-4bb9-bec9-89ea2363ff3c
8bc5233e-0dee-4ee5-a136-187584a8093f	t	Mamba	9425aa03-feed-4bb9-bec9-89ea2363ff3c
bdf96fbb-4001-44a5-b226-4a4f60920b14	t	Muganza	9425aa03-feed-4bb9-bec9-89ea2363ff3c
22e1a70b-affb-446f-83c0-e06423620678	t	Mugombwa	9425aa03-feed-4bb9-bec9-89ea2363ff3c
9fa822f8-560a-4fa4-a3c1-c8f4705b9054	t	Mukindo	9425aa03-feed-4bb9-bec9-89ea2363ff3c
5b6109a9-ba8a-4941-84ed-d9e0962f4b74	t	Musha	9425aa03-feed-4bb9-bec9-89ea2363ff3c
66d8fe23-850c-4cff-8ff8-a1eb0c218743	t	Ndora	9425aa03-feed-4bb9-bec9-89ea2363ff3c
91d933ab-9111-4021-9bc7-7b0d4acb3322	t	Nyanza	9425aa03-feed-4bb9-bec9-89ea2363ff3c
0516345f-416e-489d-ae76-c6bc492d2690	t	Save	9425aa03-feed-4bb9-bec9-89ea2363ff3c
1b7e723f-ec38-4ee4-b963-753ec38489e6	t	Gishamvu	7022d524-a71c-4fd5-b052-bc0d26dfb706
5609a27c-ab1d-4e97-b562-9ec7bdee0d6d	t	Huye	7022d524-a71c-4fd5-b052-bc0d26dfb706
bfe70125-877d-4ae0-ad21-7a829a9fa510	t	Karama	7022d524-a71c-4fd5-b052-bc0d26dfb706
c671bbc8-6a8a-450f-9b71-db1c2144ae3a	t	Kigoma	7022d524-a71c-4fd5-b052-bc0d26dfb706
a808e9fc-ca5d-4709-aae5-3791acfb09ed	t	Kinazi	7022d524-a71c-4fd5-b052-bc0d26dfb706
9a39aa33-b1e1-46a9-9323-e8301d7e2701	t	Maraba	7022d524-a71c-4fd5-b052-bc0d26dfb706
d89ea1f5-022e-43ea-aef7-537a36009d32	t	Mbazi	7022d524-a71c-4fd5-b052-bc0d26dfb706
8f903670-764d-4028-af4d-3ec7e266834e	t	Mukura	7022d524-a71c-4fd5-b052-bc0d26dfb706
fa644420-99b9-4557-ab52-008c9f31b73b	t	Ngoma	7022d524-a71c-4fd5-b052-bc0d26dfb706
18ee5d75-4a8a-44c6-be19-85f390057294	t	Ruhashya	7022d524-a71c-4fd5-b052-bc0d26dfb706
202ba27e-744c-422f-9e5f-bea4dc4f4423	t	Rusatira	7022d524-a71c-4fd5-b052-bc0d26dfb706
d8ec6d49-df34-4fd9-838d-b9795e889ae7	t	Rwaniro	7022d524-a71c-4fd5-b052-bc0d26dfb706
1a6da1f7-73b8-437b-a459-535b706968f0	t	Simbi	7022d524-a71c-4fd5-b052-bc0d26dfb706
8f1a4e10-c493-49f3-a7f6-88dbe2d6698f	t	Tumba	7022d524-a71c-4fd5-b052-bc0d26dfb706
9fafd273-e319-4fb2-9936-bc6680c230c0	t	Gacurabwenge	ceea3d82-4960-4991-9033-1b0ca2fa582e
b23701c1-5ef6-4681-a082-bce15b0d4619	t	Karama	ceea3d82-4960-4991-9033-1b0ca2fa582e
0797c8dc-32f4-4990-88ee-c25cb921ee69	t	Kayenzi	ceea3d82-4960-4991-9033-1b0ca2fa582e
bd758bbb-79b4-48e0-8152-9dfd4ec0d3f5	t	Kayumbu	ceea3d82-4960-4991-9033-1b0ca2fa582e
ac3649d0-4eb0-4019-b438-5bfa6c9d0362	t	Mugina	ceea3d82-4960-4991-9033-1b0ca2fa582e
fd1818c6-01a1-48b3-9b93-b1ba631395b7	t	Musambira	ceea3d82-4960-4991-9033-1b0ca2fa582e
c6e31311-3f88-487d-9ee8-df789fcd1e80	t	Ngamba	ceea3d82-4960-4991-9033-1b0ca2fa582e
95269822-969e-4d09-a17a-c3f69d5d829b	t	Nyamiyaga	ceea3d82-4960-4991-9033-1b0ca2fa582e
2dc44c68-a51d-4f48-b8e2-1ddee65b8c0c	t	Nyarubaka	ceea3d82-4960-4991-9033-1b0ca2fa582e
a6df88b4-cbe2-4657-9ce2-58f794416bff	t	Rugarika	ceea3d82-4960-4991-9033-1b0ca2fa582e
98581c1e-a901-4e6a-845b-f899f9ca7312	t	Rukoma	ceea3d82-4960-4991-9033-1b0ca2fa582e
23fefa45-4903-4bdb-baed-4e5ed72cfeb5	t	Runda	ceea3d82-4960-4991-9033-1b0ca2fa582e
91a429b1-17e3-483a-8ff9-b2b8c2724e4b	t	Cyeza	03f9750e-76c9-4e99-9581-c7a6af198da7
afe12030-3480-49a1-a95f-9e53b7f583fe	t	Kabacuzi	03f9750e-76c9-4e99-9581-c7a6af198da7
1cadfa01-47c0-4c40-96b6-cb9f99e3bf34	t	Kiyumba	03f9750e-76c9-4e99-9581-c7a6af198da7
72fc8034-1632-41e4-ac74-633d9a59451d	t	Muhanga	03f9750e-76c9-4e99-9581-c7a6af198da7
40a82a8e-53eb-474a-aee4-b64a62b9d940	t	Mushishiro	03f9750e-76c9-4e99-9581-c7a6af198da7
50ab7c13-a2c5-4648-92c3-fd47e8ee56ab	t	Nyabinoni	03f9750e-76c9-4e99-9581-c7a6af198da7
93adfb7c-847a-4afd-9428-03d46a039e08	t	Nyamabuye	03f9750e-76c9-4e99-9581-c7a6af198da7
96750d57-2939-4fc6-9a1d-3211ede6bbe5	t	Nyarusange	03f9750e-76c9-4e99-9581-c7a6af198da7
8d8fd022-3ef2-4bd3-b0b3-caac4990d62a	t	Rongi	03f9750e-76c9-4e99-9581-c7a6af198da7
f2787b2c-9243-493d-a153-def4a34e2050	t	Rugendabari	03f9750e-76c9-4e99-9581-c7a6af198da7
75a0c33d-b669-48b9-a80b-9b941ab737fd	t	Shyogwe	03f9750e-76c9-4e99-9581-c7a6af198da7
0d266d08-cd2d-4400-a4a4-4c669d7b51b1	t	Buruhukiro	7ddf0119-599a-4504-bdfb-62fc1c059b25
3e31fc8a-b1c0-4c6d-9117-d627a26c52e3	t	Cyanika	7ddf0119-599a-4504-bdfb-62fc1c059b25
c3515ddc-ab28-4b4b-bf99-bc9192b83abe	t	Gasaka	7ddf0119-599a-4504-bdfb-62fc1c059b25
cdeae1ba-0fd2-4d48-87af-4c41d7b14fed	t	Gatare	7ddf0119-599a-4504-bdfb-62fc1c059b25
9fede312-873b-42a9-909a-ca25ef46d292	t	Kaduha	7ddf0119-599a-4504-bdfb-62fc1c059b25
c61cc130-a989-4e2d-8b08-d0505fcff967	t	Kamegeri	7ddf0119-599a-4504-bdfb-62fc1c059b25
211ae6f6-7fd5-45e4-b9ed-d2f7ad8a04e7	t	Kibirizi	7ddf0119-599a-4504-bdfb-62fc1c059b25
41fdce21-a3c5-4a9f-89e1-79ae46eb9660	t	Kibumbwe	7ddf0119-599a-4504-bdfb-62fc1c059b25
4c95fa17-e992-439e-8548-57f63c1ca7a8	t	Kitabi	7ddf0119-599a-4504-bdfb-62fc1c059b25
b418293a-6763-4bf1-be97-7a14857e133b	t	Mbazi	7ddf0119-599a-4504-bdfb-62fc1c059b25
84b8dd0d-7b11-45ab-9793-81de101a4115	t	Mugano	7ddf0119-599a-4504-bdfb-62fc1c059b25
929467b3-e406-4ce3-88b1-efa783ca5989	t	Musange	7ddf0119-599a-4504-bdfb-62fc1c059b25
b0950938-261a-42f8-b1b5-a2edf4fd7b5c	t	Musebeya	7ddf0119-599a-4504-bdfb-62fc1c059b25
e48b71bf-daf1-43aa-aa2f-6d7aba822192	t	Mushubi	7ddf0119-599a-4504-bdfb-62fc1c059b25
2024f584-b6c1-48f5-a429-1e0e31399785	t	Nkomane	7ddf0119-599a-4504-bdfb-62fc1c059b25
a4fa0c53-6938-460b-a6c0-59c46c52317d	t	Tare	7ddf0119-599a-4504-bdfb-62fc1c059b25
d1185bfd-5ba7-4462-b7ea-4f37518c20e7	t	Uwinkingi	7ddf0119-599a-4504-bdfb-62fc1c059b25
29d9e667-7fbc-4b3b-8968-c6676479ba42	t	Busasamana	21d26823-c3e1-4e62-98df-bbb5b503ad32
e4b591e4-9b29-484c-b6be-5cd981d1d378	t	Busoro	21d26823-c3e1-4e62-98df-bbb5b503ad32
6930c77d-8bd4-4da6-b0d6-0212bebe7aa6	t	Cyabakamyi	21d26823-c3e1-4e62-98df-bbb5b503ad32
c5014200-c96d-41fc-bcdf-ba51112ee66f	t	Kibilizi	21d26823-c3e1-4e62-98df-bbb5b503ad32
17738460-dff7-4929-b6a1-c6c009b85f14	t	Kigoma	21d26823-c3e1-4e62-98df-bbb5b503ad32
2400d1bf-a158-4fa4-ba86-2d5028ae253d	t	Mukingo	21d26823-c3e1-4e62-98df-bbb5b503ad32
0c1b7678-7914-4e4a-b841-e401a5900575	t	Muyira	21d26823-c3e1-4e62-98df-bbb5b503ad32
fd6d44c6-a2ce-488b-998f-93784e65e65d	t	Ntyazo	21d26823-c3e1-4e62-98df-bbb5b503ad32
0f252f95-6397-4b6f-907b-cbf4b57921e9	t	Nyagisozi	21d26823-c3e1-4e62-98df-bbb5b503ad32
e34a9a1f-87a7-4413-8adc-5bfd8a7981ba	t	Rwabicuma	21d26823-c3e1-4e62-98df-bbb5b503ad32
515a8bd2-55df-479e-a104-b9439708c5ba	t	Busanze	d5c880e1-77ef-4587-a9fe-e19fdc56367d
7e9e90ce-0ea7-4c4c-8ec7-1254dd0ca855	t	Cyahinda	d5c880e1-77ef-4587-a9fe-e19fdc56367d
e23e4a47-4883-4b60-aa34-a9740e92fbae	t	Kibeho	d5c880e1-77ef-4587-a9fe-e19fdc56367d
92462c11-354b-450d-9e08-db8f9ce8ed3d	t	Kivu	d5c880e1-77ef-4587-a9fe-e19fdc56367d
67ba5d47-3c33-4595-b691-21f1155bd257	t	Mata	d5c880e1-77ef-4587-a9fe-e19fdc56367d
91b75011-c857-42a1-8f4f-e8cad83a8c5a	t	Muganza	d5c880e1-77ef-4587-a9fe-e19fdc56367d
96de5947-617d-4f16-8ee0-c820dfc128da	t	Munini	d5c880e1-77ef-4587-a9fe-e19fdc56367d
1ed2dd77-ed70-4645-8349-fa5f2d8ddd7e	t	Ngera	d5c880e1-77ef-4587-a9fe-e19fdc56367d
5fa5c972-51c8-4d0e-8b3e-fd020e7c17fe	t	Ngoma	d5c880e1-77ef-4587-a9fe-e19fdc56367d
337023c6-e6ae-4b7b-84cd-a5998b9c1a2e	t	Nyabimata	d5c880e1-77ef-4587-a9fe-e19fdc56367d
1c68b795-db2d-421e-89b4-9fa749820caa	t	Nyagisozi	d5c880e1-77ef-4587-a9fe-e19fdc56367d
835c392d-c535-4ada-91da-7dbb72cc3caf	t	Ruheru	d5c880e1-77ef-4587-a9fe-e19fdc56367d
49ca94b6-c62b-41f3-8021-9a7c5b3b6a98	t	Ruramba	d5c880e1-77ef-4587-a9fe-e19fdc56367d
292db683-7f04-4814-8ccb-49fa837677cc	t	Rusenge	d5c880e1-77ef-4587-a9fe-e19fdc56367d
12f366a2-df19-40bb-b408-5d122be402d5	t	Bweramana	297891ef-4f24-430a-8d49-b09c7165d822
15d2db0c-036b-4465-bf37-274ccb1e8f3c	t	Byimana	297891ef-4f24-430a-8d49-b09c7165d822
8516ee2a-5761-40e6-8de7-b08530d90691	t	Kabagali	297891ef-4f24-430a-8d49-b09c7165d822
8e271e8b-ae56-4e2a-875d-c7ae066fe581	t	Kinazi	297891ef-4f24-430a-8d49-b09c7165d822
38d55516-d5bd-49ce-810f-7ba45e70815f	t	Kinihira	297891ef-4f24-430a-8d49-b09c7165d822
0558b2f6-f15f-4d37-963f-7badbbf955c7	t	Mbuye	297891ef-4f24-430a-8d49-b09c7165d822
ceff3955-8f86-49a8-bebc-acd98a6fac59	t	Mwendo	297891ef-4f24-430a-8d49-b09c7165d822
19cb0de3-5b9c-40ee-9ba2-a8ec0d43c886	t	Ntongwe	297891ef-4f24-430a-8d49-b09c7165d822
6dc00eb3-7153-4cb1-a79f-61cc58bf73e9	t	Ruhango	297891ef-4f24-430a-8d49-b09c7165d822
9a653bfd-5a18-431b-b656-48bb7c909f5e	t	Bwishyura	965ce8e7-1249-4270-a967-73c2780fdb63
5911f2e1-a558-4c12-981b-26e749eae8d2	t	Gashari	965ce8e7-1249-4270-a967-73c2780fdb63
fd790dff-bab4-44df-8484-26c51637e2e9	t	Gishyita	965ce8e7-1249-4270-a967-73c2780fdb63
6e4dad51-97a5-4813-9f3e-31d4ee7f3281	t	Gitesi	965ce8e7-1249-4270-a967-73c2780fdb63
d56ba155-8fb7-4997-ba05-7193e279a130	t	Mubuga	965ce8e7-1249-4270-a967-73c2780fdb63
8518e8ed-dfea-463f-a5a6-167c43f61d36	t	Murambi	965ce8e7-1249-4270-a967-73c2780fdb63
51190007-fdf7-4f06-8ad5-7f189f807240	t	Murundi	965ce8e7-1249-4270-a967-73c2780fdb63
c7328e24-41d0-4d35-a35c-6a3a19ecd2ae	t	Mutuntu	965ce8e7-1249-4270-a967-73c2780fdb63
c850f18c-280d-423a-bb09-8e91817f3f77	t	Rubengera	965ce8e7-1249-4270-a967-73c2780fdb63
efd77379-27fd-4a7d-8d77-98e30bfe9ab5	t	Rugabano	965ce8e7-1249-4270-a967-73c2780fdb63
ee6fd9d5-856b-4e53-9ab1-7db9326bc0df	t	Ruganda	965ce8e7-1249-4270-a967-73c2780fdb63
b65e4899-8d71-43fc-b42d-44ae417ca61d	t	Rwankuba	965ce8e7-1249-4270-a967-73c2780fdb63
ffb75e43-ace4-439c-9dc8-b7cc72558068	t	Twumba	965ce8e7-1249-4270-a967-73c2780fdb63
74bf8232-8107-4d82-b79f-d598e84295fc	t	BWIRA	982bc8c3-1efb-40ce-ab74-83c51ff1416d
56a61911-7500-4aa0-b818-dd897228c6e4	t	GATUMBA	982bc8c3-1efb-40ce-ab74-83c51ff1416d
7f7a0d09-fcb2-43f0-b941-39b4507e9517	t	HINDIRO	982bc8c3-1efb-40ce-ab74-83c51ff1416d
b4bc0bd4-6443-4f06-9db9-78b37acbc229	t	KABAYA	982bc8c3-1efb-40ce-ab74-83c51ff1416d
193ca3fc-f8eb-4352-99b8-f53ebcf58f8b	t	KAGEYO	982bc8c3-1efb-40ce-ab74-83c51ff1416d
61f242f5-9aaa-47b9-9edb-73620c006450	t	KAVUMU	982bc8c3-1efb-40ce-ab74-83c51ff1416d
6965f5aa-f8ff-43ec-9cae-bcbe750190b7	t	MATYAZO	982bc8c3-1efb-40ce-ab74-83c51ff1416d
23f40805-ab2f-4768-8f48-91d4c5cc43e5	t	MUHANDA	982bc8c3-1efb-40ce-ab74-83c51ff1416d
644f7cef-a4a8-4370-b9eb-3240fc7555f8	t	MUHOROR	982bc8c3-1efb-40ce-ab74-83c51ff1416d
fd1a8786-e39f-4288-ac47-b43aedfa495f	t	NDARO	982bc8c3-1efb-40ce-ab74-83c51ff1416d
708e5663-3723-4647-b57f-55bbe91e191a	t	NGORORE	982bc8c3-1efb-40ce-ab74-83c51ff1416d
fd1840bc-0860-49ca-8325-d9e80e00164f	t	NYANGE	982bc8c3-1efb-40ce-ab74-83c51ff1416d
ebf96b6a-29ac-44a4-8054-7cf797b03864	t	SOVU	982bc8c3-1efb-40ce-ab74-83c51ff1416d
e32e40e9-8223-4bae-a68d-8bdd1d05d6b2	t	Bigogwe	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
fbf4749d-236b-40db-8a61-cfc3efa869b4	t	Jenda	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
b8da4b24-2672-4223-abcf-bb658b27dc38	t	Jomba	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
14daa264-063c-4fdd-8b6d-d3aae7ad5d59	t	Kabatwa	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
9931f4e8-2853-49f3-9c13-b2d854897dea	t	Karago	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
ad66fdd4-2952-4761-a1cf-bb0096e3e490	t	Kintobo	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
cc6d039b-1941-4908-ba77-bef631d02965	t	Mukamira	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
db8c7792-42e9-407e-8573-4b6b812cf7e3	t	Muringa	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
126befa4-d54f-4e49-b2cd-ea0359b78401	t	Rambura	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
8a02a194-8892-47dc-ab56-52b47d4d9f2a	t	Rugera	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
df94e984-95d6-4f30-a76f-16e8b11331c3	t	Rurembo	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
a0b10518-fd4b-4c80-a9cf-a7066644387e	t	Shyira	c3eb2998-7bdd-4afe-8fa8-6c050f83a047
d28c93c1-5fc3-4d54-908c-81ee515d5b09	t	Bushekeri	f7715340-99f1-4d53-9348-8b70b4ab3315
ea43d49f-44bd-477e-8d7e-c4a1d28b4586	t	Bushenge	f7715340-99f1-4d53-9348-8b70b4ab3315
cc21ac7e-c429-41b7-8bfc-dcb5c6306ad0	t	Cyato	f7715340-99f1-4d53-9348-8b70b4ab3315
79845127-f4ad-4f86-a4c2-5b2b623ebc6e	t	Gihombo	f7715340-99f1-4d53-9348-8b70b4ab3315
ab942cf3-68d3-4a58-abfe-814a8b9ca1e8	t	Kagano	f7715340-99f1-4d53-9348-8b70b4ab3315
e36cef8f-da9f-4a78-a084-49579b0964cb	t	Kanjongo	f7715340-99f1-4d53-9348-8b70b4ab3315
5689e1f2-00d3-4114-8367-ba30365c9a8e	t	Karambi	f7715340-99f1-4d53-9348-8b70b4ab3315
f9329ad8-a9d8-4658-8b1e-1eceafbee1b4	t	Karengera	f7715340-99f1-4d53-9348-8b70b4ab3315
339e0ff4-0995-44a4-bf5a-a7297ef190bf	t	Kirimbi	f7715340-99f1-4d53-9348-8b70b4ab3315
276e4ec4-9f0b-4b34-a2d8-1bd759fc15ab	t	Macuba	f7715340-99f1-4d53-9348-8b70b4ab3315
8b7a3720-bbba-4f5e-80ed-8814bf26ad05	t	Mahembe	f7715340-99f1-4d53-9348-8b70b4ab3315
0fc55ad8-332e-4e80-af44-01bd3e56feb0	t	Nyabitekeri	f7715340-99f1-4d53-9348-8b70b4ab3315
210d7da6-fdc8-41d7-b364-368d43a39e75	t	Rangiro	f7715340-99f1-4d53-9348-8b70b4ab3315
05ce52d0-d04a-47d9-b420-34f9bbd0bd21	t	Ruharambuga	f7715340-99f1-4d53-9348-8b70b4ab3315
c0115f65-a5a4-4ab2-8921-97e419e7b03d	t	Shangi	f7715340-99f1-4d53-9348-8b70b4ab3315
8dfa9c68-f2d3-494a-b8f7-4ea75e79d213	t	Bugeshi	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
22fd172e-63a0-4b03-b99f-982321be7280	t	Busasamana	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
bb917d4c-97d5-436f-9cc7-88f6c8bddf3f	t	Cyanzarwe	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
9603998b-259d-495e-a4b7-7c195e2c8400	t	Gisenyi	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
bb42e1ef-d6cf-4f11-b250-d6dbb79277f0	t	Kanama	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
0776c9d8-43a7-4141-a1d1-a0de08271e4f	t	Kanzenze	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
4d7c0a6b-68a3-4849-85f0-36767d24ba82	t	Mudende	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
a734fdf4-a4c8-4a28-91b1-df69d65780d9	t	Nyakiriba	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
7f31ee0a-80b2-49f0-8e73-deb3c001d084	t	Nyamyumba	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
78d05a76-f7a4-4d44-88fa-ca99949f77d5	t	Nyundo	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
ee5b3f65-7dcc-4072-bff7-6f453d500bab	t	Rubavu	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
076d4594-298f-4208-b16a-f5279992e238	t	Rugerero	7c1609fa-f1b7-4451-8d3e-cf1cbcddb41f
9fe3f36b-bd02-4903-83d7-8259e55dd67b	t	Bugarama	09e6c3c4-1a53-421d-aeb9-059f26d5af84
a73feb4d-d301-4d44-bed3-34aa21db5a94	t	Butare	09e6c3c4-1a53-421d-aeb9-059f26d5af84
3302b3af-c98e-42e4-8653-bc4c63ef7b3c	t	Bweyeye	09e6c3c4-1a53-421d-aeb9-059f26d5af84
89f996f6-22ab-441a-92e5-e6af24910c8b	t	Gashonga	09e6c3c4-1a53-421d-aeb9-059f26d5af84
3ebb96e6-4d9c-4edb-90ec-fd93637b9ac7	t	Giheke	09e6c3c4-1a53-421d-aeb9-059f26d5af84
31e4b0a6-9e35-4ba2-893b-10e3ee24e263	t	Gihundwe	09e6c3c4-1a53-421d-aeb9-059f26d5af84
a829d7e8-0071-4d4c-baad-089636b585a9	t	Gikundamvu	09e6c3c4-1a53-421d-aeb9-059f26d5af84
124e22d4-7c48-400a-898b-b5b19b600426	t	Gitambi	09e6c3c4-1a53-421d-aeb9-059f26d5af84
62e83fa7-22b5-42ab-b9a3-3656f9988139	t	Kamembe	09e6c3c4-1a53-421d-aeb9-059f26d5af84
52a2753d-ca83-4cc5-99de-2544b2346d71	t	Muganza	09e6c3c4-1a53-421d-aeb9-059f26d5af84
0bd400d1-f84b-457b-8829-1972656bb220	t	Mururu	09e6c3c4-1a53-421d-aeb9-059f26d5af84
ff56ce36-b8b8-4c78-a92a-2048e42e1f96	t	Nkanka	09e6c3c4-1a53-421d-aeb9-059f26d5af84
65e3dcdb-a97b-4127-ad7e-5c4e9b3d5a2d	t	Nkombo	09e6c3c4-1a53-421d-aeb9-059f26d5af84
4aba17c9-5b01-4565-999d-d8f2f2e03c39	t	Nkungu	09e6c3c4-1a53-421d-aeb9-059f26d5af84
34cc2600-4ceb-427a-9eaa-1c18993abd56	t	Nyakabuye	09e6c3c4-1a53-421d-aeb9-059f26d5af84
639c7b47-3d30-4cc9-b64f-d37ee53e1478	t	Nyakarenzo	09e6c3c4-1a53-421d-aeb9-059f26d5af84
ab3f7c99-5ba5-44bb-94b6-0e49821150ea	t	Nzahaha	09e6c3c4-1a53-421d-aeb9-059f26d5af84
665a0cf0-4697-4522-9a95-e2f8721b785c	t	Rwimbogo	09e6c3c4-1a53-421d-aeb9-059f26d5af84
98622ef7-801a-41b3-b75e-f3a073d8ae6b	t	Boneza	6b34fbc4-e056-463d-a218-f919d1fd581b
361f9950-f9ec-44a9-a532-4b984c8cb85e	t	Gihango	6b34fbc4-e056-463d-a218-f919d1fd581b
20fcf846-0926-43e9-85ed-339f8f932d36	t	Kigeyo	6b34fbc4-e056-463d-a218-f919d1fd581b
ef678a65-d6e7-4ddc-9688-a29eb10248ac	t	Kivumu	6b34fbc4-e056-463d-a218-f919d1fd581b
99ce2fe7-f9ac-4dd4-ab31-cf8132b73368	t	Manihira	6b34fbc4-e056-463d-a218-f919d1fd581b
4cab0e9c-48f5-4440-aacf-c274dce9acf4	t	Mukura	6b34fbc4-e056-463d-a218-f919d1fd581b
919820f3-5f06-417a-b391-44b7b65ce0af	t	Murunda	6b34fbc4-e056-463d-a218-f919d1fd581b
496bb22b-c43f-454b-bbb8-bb5b28ed2cde	t	Musasa	6b34fbc4-e056-463d-a218-f919d1fd581b
de08e844-c4ad-465c-9d64-cd2051295cc1	t	Mushonyi	6b34fbc4-e056-463d-a218-f919d1fd581b
c52405ca-9c31-44f1-a756-d492427b0ae4	t	Mushubati	6b34fbc4-e056-463d-a218-f919d1fd581b
399e0bb5-3365-4137-bfaf-6f964370dee2	t	Nyabirasi	6b34fbc4-e056-463d-a218-f919d1fd581b
ec251632-1d13-4809-9be5-f673a6e9f0b0	t	Ruhango	6b34fbc4-e056-463d-a218-f919d1fd581b
70c5f2db-ffb6-441f-8279-88cfb2f37dd9	t	Rusebeya	6b34fbc4-e056-463d-a218-f919d1fd581b
d804aaa5-e041-4738-b8e8-daede2140bc1	t	Bungwe	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
5ecac098-afe6-41dc-99e9-e8c14e5a4952	t	Butaro	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
97762696-25e6-47cc-b288-243b9ce4fc15	t	Cyanika	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
df5beef4-1981-420b-9c1f-997c6401f1d1	t	Cyeru	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
5f67a7ae-76eb-49aa-8243-694bb50bfc1a	t	Gahunga	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
24697f74-e2c1-49f3-8511-f3fa4ad0a58e	t	Gatebe	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
911f8775-6549-4231-a04d-6db28562c70c	t	Gitovu	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
2d1a4c15-0187-4bad-969d-b2a64d10e529	t	Kagogo	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
9baefc88-0d84-43c4-a7d8-2063302f7cd9	t	Kinoni	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
eb07f0dd-1c52-4007-8ba7-16baf7f781a2	t	Kinyababa	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
7bc7c6a9-17f7-4b49-9199-8104b077067c	t	Kivuye	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
9b641c16-6cec-44a5-ace3-6abb1efddc91	t	Nemba	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
90260d6c-70b2-49e8-815c-90bea963f8e0	t	Rugarama	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
a6ed8d1f-5cc8-4c18-a09d-ea67ad4c7d17	t	Rugengabari	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
5d8a2c28-76f1-4611-8efd-f3723f936002	t	Ruhunde	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
2089e3c2-0673-4670-9db1-3938d57dc2cb	t	Rusarabuye	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
cc23038b-3bef-400f-b384-356fdaaa27e5	t	Rwerere	5e84cb9b-c57a-45d6-b604-9d31b439dbf5
c0c1f2d8-d3e8-4704-9792-2b7e5c57f27f	t	Busengo	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
b2d7ce0c-b8c9-4129-8baf-e2bc1ab19bce	t	Coko	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
136f17f1-9bde-4cff-a4ce-49896cd2809f	t	Cyabingo	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
fe04fa71-c18a-4a44-9a7a-d784483807f5	t	Gakenke	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
06858286-92f1-4a9b-bf9f-b022b247b62d	t	Gashenyi	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
c7464505-55f6-4874-8c67-2391c7e61440	t	Janja	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
48d11048-5727-4d2c-8b99-54d1cd033c71	t	Kamubuga	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
743dcdbd-c3a5-4528-a36d-bf08bfd24880	t	Karambo	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
1c5855fb-bc6b-44ab-b820-45263e5cf780	t	Kivuruga	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
c327bb4e-9b28-4c0a-989e-ef7b083489b7	t	Mataba	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
8533de75-57c9-4bc7-8a4c-59281e4fb123	t	Minazi	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
d8ab76ed-6cb9-4f30-b94a-00ae4b87aa47	t	Mugunga	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
12caa727-bce5-4be4-888c-5577a33858d8	t	Muhondo	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
4b0aa0e7-3f6e-43f2-b35d-18e276fae83b	t	Muyongwe	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
7ad7d1a4-41c0-4fe6-ac31-af9be219d869	t	Muzo	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
3c40b986-c6eb-4466-88bd-63abb5238637	t	Nemba	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
654097ca-e1ac-4ee1-b591-c663a0358220	t	Ruli	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
49e8d762-42b5-49c0-95ad-a6eb8c62faaa	t	Rusasa	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
4782aba3-07b9-42f4-8b26-0f4054461021	t	Rushashi	79c8eea7-122c-4c51-aa2a-6a2bb50a8eb4
a9c59fa8-343b-450c-9e84-54d68d4e9283	t	Bukure	65323863-6675-4a80-b30d-a9249cc93bbb
d035b1ee-bdc8-4944-a843-78cb939631e0	t	Bwisige	65323863-6675-4a80-b30d-a9249cc93bbb
9bc4afdf-e1b5-424b-ab8e-95f07e6f0de8	t	Byumba	65323863-6675-4a80-b30d-a9249cc93bbb
c0d640f6-1a2e-42d1-981a-8cce91b88501	t	Cyumba	65323863-6675-4a80-b30d-a9249cc93bbb
a728c87f-aee0-4f62-9118-5a783d2c91c4	t	Giti	65323863-6675-4a80-b30d-a9249cc93bbb
a64ed6b2-8119-4a89-9231-995e35a10eaf	t	Kageyo	65323863-6675-4a80-b30d-a9249cc93bbb
c40db82d-5a07-406c-9644-9e9427795cc6	t	Kaniga	65323863-6675-4a80-b30d-a9249cc93bbb
09eef9c8-6170-4db9-9889-9356ce6d22b4	t	Manyagiro	65323863-6675-4a80-b30d-a9249cc93bbb
25633821-a7f4-4f81-9101-3b6d0a844da4	t	Miyove	65323863-6675-4a80-b30d-a9249cc93bbb
24c03381-7025-4516-990c-b37ecad3cdae	t	Mukarange	65323863-6675-4a80-b30d-a9249cc93bbb
bf6c7627-e266-48ed-ab1f-3c45f5ffc07d	t	Muko	65323863-6675-4a80-b30d-a9249cc93bbb
4603bf6b-c990-474e-a2c2-89a1725bba09	t	Mutete	65323863-6675-4a80-b30d-a9249cc93bbb
03f1c959-1e38-4cdc-93d5-87f652389772	t	Nyamiyaga	65323863-6675-4a80-b30d-a9249cc93bbb
9184d6a1-9af4-4f46-94ed-428c92e49dc9	t	Nyankenke	65323863-6675-4a80-b30d-a9249cc93bbb
55856b79-635d-4f51-9b33-9d4743b72e93	t	Rubaya	65323863-6675-4a80-b30d-a9249cc93bbb
d8b5c397-0da9-4970-9c76-538fab8d78b3	t	Rukomo	65323863-6675-4a80-b30d-a9249cc93bbb
09af53ad-27c1-46c6-a4cb-913d025f942e	t	Rushaki	65323863-6675-4a80-b30d-a9249cc93bbb
eacb7101-ebaa-4ee0-bdaf-22f16e820e4e	t	Rutare	65323863-6675-4a80-b30d-a9249cc93bbb
1c61869f-e949-4de1-9b62-58e31799e7d6	t	Ruvune	65323863-6675-4a80-b30d-a9249cc93bbb
b34a0d83-a29b-4ba1-98ee-6256da7ad7ed	t	Rwamiko	65323863-6675-4a80-b30d-a9249cc93bbb
1beabf1a-e57f-4555-9040-3ec701b7537a	t	Shangasha	65323863-6675-4a80-b30d-a9249cc93bbb
5c5d8594-5c8a-4faf-9c62-791b1a7e7999	t	Busogo	15d178d2-e99e-4db0-9080-6d484e5e8fe6
a6f5901e-98ed-4bb7-b93f-a4af02f4089d	t	Cyuve	15d178d2-e99e-4db0-9080-6d484e5e8fe6
d057edca-63c4-43c0-b66a-cf00917f0f92	t	Gacaca	15d178d2-e99e-4db0-9080-6d484e5e8fe6
f83d62e0-e0e2-4ee3-b6b0-09f3ba39628a	t	Gashaki	15d178d2-e99e-4db0-9080-6d484e5e8fe6
ffe8dea5-cf77-4cd8-b338-4adde6c77d29	t	Gataraga	15d178d2-e99e-4db0-9080-6d484e5e8fe6
a11ed3c1-6b6a-4b4b-a5d4-2df986766d98	t	Kimonyi	15d178d2-e99e-4db0-9080-6d484e5e8fe6
d35402e8-2fd2-4ad8-ba41-08f9df59c178	t	Kinigi	15d178d2-e99e-4db0-9080-6d484e5e8fe6
f2d29deb-78e4-47c5-8af1-0814ddd0ee60	t	Muhoza	15d178d2-e99e-4db0-9080-6d484e5e8fe6
29d3ebe2-91ba-4a8c-8ffb-685fa5c133b0	t	Muko	15d178d2-e99e-4db0-9080-6d484e5e8fe6
1d20a106-838e-405f-9293-d6d959170d3f	t	Musanze	15d178d2-e99e-4db0-9080-6d484e5e8fe6
42c3d202-9453-4fde-95f9-10826c3e334a	t	Nkotsi	15d178d2-e99e-4db0-9080-6d484e5e8fe6
33411e35-0ea0-4074-aed0-df17ae5b8759	t	Nyange	15d178d2-e99e-4db0-9080-6d484e5e8fe6
38909dcd-a47c-451d-a2e7-1487b503777b	t	Remera	15d178d2-e99e-4db0-9080-6d484e5e8fe6
22f4c8e8-3437-43ef-96fe-dea49651544f	t	Rwaza	15d178d2-e99e-4db0-9080-6d484e5e8fe6
f2865c2a-d92a-4182-800d-05f89c9ddcec	t	Shingiro	15d178d2-e99e-4db0-9080-6d484e5e8fe6
ede3131d-4674-4c49-9466-dc5bb316ba08	t	BASE	c81995c8-e629-459d-88a0-a211ccd02d70
72d94312-6c08-4428-b20d-c2dc61f1ac77	t	BUREGA	c81995c8-e629-459d-88a0-a211ccd02d70
d493e9f1-72d9-420a-89a9-c099b4ff4843	t	BUSHOKI	c81995c8-e629-459d-88a0-a211ccd02d70
f277633f-cee0-4ea3-8972-815e2bc2eb9d	t	BUYOGA	c81995c8-e629-459d-88a0-a211ccd02d70
8fba04dc-66ef-4dc3-b219-3661320e3001	t	CYINZUZI	c81995c8-e629-459d-88a0-a211ccd02d70
b7978f69-db90-4f08-b822-726e6684fa77	t	CYUNGO	c81995c8-e629-459d-88a0-a211ccd02d70
654e79d5-0ffb-41d1-9f68-c28ef7e1b79a	t	KINIHIRA	c81995c8-e629-459d-88a0-a211ccd02d70
cc27274a-1a75-4b85-af7c-5cf42c9ba5e9	t	KISARO	c81995c8-e629-459d-88a0-a211ccd02d70
aa32b891-488a-4f4a-baff-572aaec48669	t	MASORO	c81995c8-e629-459d-88a0-a211ccd02d70
34f8e971-791d-4c9d-890c-3022188f04fe	t	MBOGO	c81995c8-e629-459d-88a0-a211ccd02d70
248f4b69-a749-45f6-9bab-a10095eac21d	t	MURAMBI	c81995c8-e629-459d-88a0-a211ccd02d70
646b3351-d51b-4b42-b145-0fb509512724	t	NGOMA	c81995c8-e629-459d-88a0-a211ccd02d70
f2630f14-2e89-49f0-8d75-a502386fd818	t	NTARABA	c81995c8-e629-459d-88a0-a211ccd02d70
e8b17e24-19c4-444f-a732-d6091b72a85a	t	RUKOZO	c81995c8-e629-459d-88a0-a211ccd02d70
f888772a-eb27-4991-8d25-303a4f16a104	t	RUSIGA	c81995c8-e629-459d-88a0-a211ccd02d70
74c407ee-3c0b-4fae-ae8e-d05f96389c92	t	SHYORONG	c81995c8-e629-459d-88a0-a211ccd02d70
df9e755b-f545-40f8-9113-b6f42487a28b	t	TUMBA	c81995c8-e629-459d-88a0-a211ccd02d70
\.


--
-- Data for Name: security_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.security_settings (id, created_at, created_by, updated_at, updated_by, lockout_duration_minutes, max_failed_login_attempts, mfa_required, password_min_length, password_require_digit, password_require_lowercase, password_require_special_character, password_require_uppercase, session_timeout_minutes) FROM stdin;
\.


--
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipments (id, created_at, created_by, updated_at, updated_by, actual_delivery_date, carrier, estimated_delivery_date, status, tracking_number, order_id) FROM stdin;
\.


--
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stock_movements (id, created_at, created_by, updated_at, updated_by, quantity, reason, reference_id, type, inventory_item_id) FROM stdin;
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.suppliers (id, created_at, created_by, updated_at, updated_by, active, address, contact_email, contact_phone, name, notes, performance_rating) FROM stdin;
\.


--
-- Data for Name: support_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.support_messages (id, created_at, created_by, updated_at, updated_by, message, sender_id, ticket_id) FROM stdin;
\.


--
-- Data for Name: support_tickets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.support_tickets (id, created_at, created_by, updated_at, updated_by, description, priority, status, title, assigned_agent_id, customer_id) FROM stdin;
\.


--
-- Data for Name: system_backups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.system_backups (id, created_at, created_by, updated_at, updated_by, completed_at, file_path, message, name, restored_at, size_bytes, status) FROM stdin;
\.


--
-- Data for Name: system_configurations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.system_configurations (id, created_at, created_by, updated_at, updated_by, category, config_key, config_value, description, sensitive) FROM stdin;
\.


--
-- Data for Name: tax_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_rates (id, created_at, created_by, updated_at, updated_by, active, code, description, name, rate) FROM stdin;
cbf4665a-0bf6-45dd-873b-1609d3b3d960	2026-07-14 18:08:49.798546	\N	2026-07-14 18:08:49.798546	\N	t	VAT_18	Standard VAT rate	VAT 18%	0.1800
cf5b98fc-0a65-4b49-a500-7f02a8e2c6ea	2026-07-14 18:08:49.808019	\N	2026-07-14 18:08:49.808019	\N	t	REDUCED_10	Reduced tax rate	Reduced tax 10%	0.1000
f6ce6f9a-94b1-4298-8995-c25688cebccf	2026-07-14 18:08:49.812025	\N	2026-07-14 18:08:49.812025	\N	t	NO_VAT	Tax exempt	No VAT	0.0000
\.


--
-- Data for Name: tax_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_records (id, created_at, created_by, updated_at, updated_by, amount, filing_date, order_id, order_number, reference_id, status, tax_date, tax_rate, tax_type, taxable_amount) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_roles (user_id, role_id) FROM stdin;
725ccd1c-49f8-44f7-aca8-8a2ee029e390	df33d37d-ce52-4f2b-84bf-b89035ef8807
69547bb2-cba5-4005-ac3e-bbc57b98c2ae	df33d37d-ce52-4f2b-84bf-b89035ef8807
10698358-9e6e-48b7-b0e8-d22504e0543b	2b85aa8a-6953-467e-a93d-6ab45f60c7bf
f328248f-d2c8-4323-b5d9-474da66c1554	d7002bf9-8e3b-417c-bfe6-79e3a1a5a8be
c9103dce-c791-4060-917d-81f952bf8b51	43d8e6d7-cfa9-4e75-96e3-4d006f2521a5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, created_at, created_by, updated_at, updated_by, address, email, email_verified, enabled, first_name, force_password_change, last_login_date, last_name, locked, password, phone_number) FROM stdin;
725ccd1c-49f8-44f7-aca8-8a2ee029e390	2026-07-14 18:08:49.236567	\N	2026-07-14 18:08:49.236567	\N	\N	admin@luztech.com	t	t	System	f	\N	Administrator	f	$2a$10$TLI5AhNdWkoJ.lW.g69bmeqCZpKxwbnXBAUFATNnWLVWdHnyKeTGy	\N
69547bb2-cba5-4005-ac3e-bbc57b98c2ae	2026-07-14 18:08:49.368447	\N	2026-07-14 18:08:49.379584	\N	\N	ishimwedivin2@gmail.com	t	t	Divin	f	\N	Ishimwe	f	$2a$10$enOXUaCUdo2Nw9iJXG4Equel7RCBQ/FAnlti.oiQDUZiPGfewy4.S	\N
10698358-9e6e-48b7-b0e8-d22504e0543b	2026-07-14 18:08:49.499491	\N	2026-07-14 18:08:49.499491	\N	\N	ishimwedivin01@gmail.com	t	t	Divin	f	\N	Ishimwe	f	$2a$10$TBLJa9V1bO7/98FOBB0zmOwaGupvMb5EYXWKwT97TVDcQNT1kjTTy	\N
f328248f-d2c8-4323-b5d9-474da66c1554	2026-07-14 18:08:49.619879	\N	2026-07-14 18:08:49.619879	\N	\N	ishimdivin2019@gmail.com	t	t	Divin	f	\N	Ishimwe	f	$2a$10$MLQ6FyJEYIwQC7RNisz5rOfMeJKnQRXnZLS6f8XMZxUnp6L9whgrG	\N
c9103dce-c791-4060-917d-81f952bf8b51	2026-07-14 18:08:49.736431	\N	2026-07-14 18:08:49.736431	\N	\N	idivin44@gmail.com	t	t	Divin	f	\N	Ishimwe	f	$2a$10$Vwrk5c32/2Tj5pgLi0viDexXA5woHW5dqL0xmYBwBmyu6bigV8Sve	\N
\.


--
-- Data for Name: villages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.villages (id, enabled, name, cell_id) FROM stdin;
2a5ea20c-58a6-467a-a12a-332a316dbe34	t	Akakaza	6759e184-d434-4c83-8043-cd2b2c6fb8b3
698a248a-eeee-4972-bbc6-5d263d98bd5c	t	Muhozi	6759e184-d434-4c83-8043-cd2b2c6fb8b3
66aeb4d9-940a-44b5-a0e5-630b700dd0b5	t	Rubungo	6759e184-d434-4c83-8043-cd2b2c6fb8b3
d0348f75-c98e-42d1-8067-317bd2187fcc	t	Ryakigogo	6759e184-d434-4c83-8043-cd2b2c6fb8b3
4983f7ad-7d2c-4785-a889-78eb9ee64e4f	t	Zindiro	6759e184-d434-4c83-8043-cd2b2c6fb8b3
51152181-fe2c-4f65-8e32-f1b062826ede	t	Kagarama	81909b62-f2b4-4136-8475-15dbdeabd020
3b09ff52-285f-46e2-8b96-3f5a9903b697	t	Kayumba	81909b62-f2b4-4136-8475-15dbdeabd020
2b7e578a-8b26-4208-98a6-b90a4d289d9b	t	Ramba	81909b62-f2b4-4136-8475-15dbdeabd020
f3a8a5c4-b0d1-4e96-87bb-42ed8d0386ad	t	Rebero	81909b62-f2b4-4136-8475-15dbdeabd020
64936ecc-dd36-450e-b601-532cd7f588f5	t	Rugando	81909b62-f2b4-4136-8475-15dbdeabd020
ac71542e-66ef-4dae-89da-556940397d4c	t	Kigabiro	85fbdbd6-20e0-4c54-af66-60adac60c92d
415782d5-e064-42df-8625-cf3cb5dd569a	t	Kiyoro	85fbdbd6-20e0-4c54-af66-60adac60c92d
36a5b336-b720-4850-aab7-4a7c567b03c4	t	Murarambo	85fbdbd6-20e0-4c54-af66-60adac60c92d
a53764a2-c6a0-43a8-9b42-48f50cfe43e8	t	Nkona	85fbdbd6-20e0-4c54-af66-60adac60c92d
ff9713d8-b414-494e-b113-d577fdd47575	t	Nyakabingo	85fbdbd6-20e0-4c54-af66-60adac60c92d
8028e3e4-256b-4967-befa-cd196ff71e82	t	Rukoma	85fbdbd6-20e0-4c54-af66-60adac60c92d
9496bf60-2762-4466-9c4d-a39b4f16d606	t	Birembo	ddf6579c-855c-4bc2-974a-2d09e7a3a5ad
73ff6bc7-2cac-40d8-8bbe-59627191bbc0	t	Gisasa	ddf6579c-855c-4bc2-974a-2d09e7a3a5ad
9dacf231-be96-4ec1-b610-2a0e5408b8da	t	Munini	ddf6579c-855c-4bc2-974a-2d09e7a3a5ad
5aaecae1-6f91-4105-9447-2c6dba5e6666	t	Ruhinga	ddf6579c-855c-4bc2-974a-2d09e7a3a5ad
208f10cf-b118-4d83-b8c8-0393d8e7a9b2	t	Uwaruraza	ddf6579c-855c-4bc2-974a-2d09e7a3a5ad
47f6f5be-1cf1-4b0c-8df1-ee2904e21643	t	Akabenejuru	aa5f71b7-f9b5-4eb8-b9f5-d6f87152fa98
fb01f799-b453-4efb-986d-2db23a66e99a	t	Akasedogo	aa5f71b7-f9b5-4eb8-b9f5-d6f87152fa98
68450b40-da42-472b-8bbf-c75c069aedd6	t	Akimpama	aa5f71b7-f9b5-4eb8-b9f5-d6f87152fa98
0f6551d0-ceab-46e7-81f0-161689b343f5	t	Burima	aa5f71b7-f9b5-4eb8-b9f5-d6f87152fa98
3b434996-92ca-4053-8f2a-920b1c5f92d9	t	Kityazo	aa5f71b7-f9b5-4eb8-b9f5-d6f87152fa98
fc02c6d9-6390-4b32-afaf-5095218c3edf	t	Bushya	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
cbad8e70-d4f9-4d1b-bebc-739fc6745ee9	t	Gikumba	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
899b9e3c-5b02-4500-aef5-969b089174fe	t	Kamutamu	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
f2a80588-35a4-4800-afb1-76f978ef8f98	t	Karama	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
b8111846-2ed4-4758-bd53-b2a211bc654b	t	Kayenzi	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
922e3615-42e6-4023-a25b-6328ca1fc9ee	t	Kigara	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
95111dc3-4a02-4573-8eda-d312ce8bab61	t	Kiriza	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
742c5579-b965-4ed4-8244-9f3d11c48767	t	Masizi	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
7fd19008-0c63-4be3-976c-4b2752b8a2ac	t	Mbogo	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
5c12255a-f150-4bf7-8658-3c5df44663e2	t	Nyampamo	5bd5b73f-5f49-4dd5-b32f-7e338ddb0dc7
68bb4cd0-7e83-432a-adc3-dffd13b86747	t	Akanyiramuga	9435deff-6922-47a2-b7c7-d5e4b0c3501e
4af9ba31-002b-406a-97f1-5f60d6bb6f8d	t	Akigabiro	9435deff-6922-47a2-b7c7-d5e4b0c3501e
ed5f5926-a826-4db3-aef9-af9e914ab2b2	t	Gishaka	9435deff-6922-47a2-b7c7-d5e4b0c3501e
92766199-9afd-4b3e-bcc6-fd2937c67803	t	Kabuye	9435deff-6922-47a2-b7c7-d5e4b0c3501e
920b453d-d39d-4c8c-8d8e-73307358926c	t	Mpabwa	9435deff-6922-47a2-b7c7-d5e4b0c3501e
e1a46a79-41ad-48f8-ab8e-22625e22d86d	t	Nyagasambu	9435deff-6922-47a2-b7c7-d5e4b0c3501e
1b5cd219-e5e3-4ebd-8a5e-fc463bae6202	t	Urutarishonga	9435deff-6922-47a2-b7c7-d5e4b0c3501e
806532e4-daef-432d-a2cd-d855217cb28c	t	Akamamana	fe3ed661-5e9b-4d18-8d38-fb59bce00443
f442f312-975a-4f66-bbf2-a59ac6375c9c	t	Akimihigo	fe3ed661-5e9b-4d18-8d38-fb59bce00443
5114ba95-e0dd-4828-a7ef-1b05db1f7883	t	Bigega	fe3ed661-5e9b-4d18-8d38-fb59bce00443
bae2c743-aa80-4fec-b4bc-f3bb56fcb9a2	t	Busasamana	fe3ed661-5e9b-4d18-8d38-fb59bce00443
904dc5be-f001-482d-94a0-4e03838c48e6	t	Kingasire	fe3ed661-5e9b-4d18-8d38-fb59bce00443
fe7af534-f525-4893-bdf0-2b85a64f2818	t	Kumuyange	fe3ed661-5e9b-4d18-8d38-fb59bce00443
8ec7d919-610a-4c38-9f68-ed61cdcd12a8	t	Muremera	fe3ed661-5e9b-4d18-8d38-fb59bce00443
26015906-594c-42e8-aec5-8d98de939081	t	Nyagasozi	fe3ed661-5e9b-4d18-8d38-fb59bce00443
e9d4933b-3b37-4dc5-b925-76605f1405f1	t	Rugoro	fe3ed661-5e9b-4d18-8d38-fb59bce00443
ad5706d3-8139-4ec8-b200-51b36a6f2a3a	t	Rwesero	fe3ed661-5e9b-4d18-8d38-fb59bce00443
e2d81d68-791e-4328-985e-f233e77240a8	t	Tetero	fe3ed661-5e9b-4d18-8d38-fb59bce00443
6363e1a2-682f-41f8-bcbe-53e5d2227be8	t	Agakomeye	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
7b07bf58-0bf3-4496-9508-9cfb5f9c066d	t	Gashubi	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
4ca9bf22-a6fc-44eb-8bf0-60d062b59731	t	Gisiza	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
0c47c09f-0aec-4b23-8869-a8d303b0d57a	t	Hanika	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
a80865fa-51cd-4101-9471-80534d9d29c4	t	Juru	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
610beac9-c493-452a-9c56-bd426a574e7d	t	Kibaya	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
2480079d-d168-4804-aa8a-2630bc2b4bbd	t	Mpakabavu	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
4d5c609e-55b4-4a18-b44c-eaf6e8e519ba	t	Musango	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
914a8ab5-b3ab-4c75-b097-9ef2846f2e48	t	Ndengo	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
84d7a378-1fdc-4e1a-bea2-95560dfde8f5	t	Nyakabande	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
2bf1e278-5a7b-445e-8046-a36d7ba18b27	t	Nyakanunga	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
a1ab929b-a592-422a-acb4-e14e5bc2b489	t	Rubonobono	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
b8c29850-4d46-45a9-b45d-34a612aa9e38	t	Runyonza	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
696433a2-2f12-454b-80d4-831d9df2fb91	t	Rusoro	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
ad85dd1d-f354-4557-b35a-64900af498bc	t	Ruvumero	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
8c926658-2a79-4c79-8c16-3a08f485c8da	t	Uwagatovu	afe0af55-e1e5-4b6d-86a2-9874dc95ed03
b44217c9-6dbe-4269-af6b-878a12e706f0	t	Agataramo	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
8b2e67f4-e856-4f51-ba3e-25943d18132b	t	Akamwunguz	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
949b1ccb-17e3-4b37-8833-12927cdd93dc	t	Akarubimbura	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
38f4edf5-1616-4dd0-9eff-cf790e2f1794	t	Akisoko	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
3248e68a-3994-4221-beaf-2354df76fdf8	t	Amarembo	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
82a5da96-2ddf-4f05-93a9-ecc641b413ab	t	Amizero	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
f0b9f9dc-0fcf-4ef6-8d59-f5abd3e7827a	t	Bwiza	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
b363e98b-7cad-45e9-8bb2-1e11c931a6e5	t	Ihuriro	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
03b3cd50-80d1-48af-a1d9-67d4c6fe36f1	t	Isangano	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
32c75802-4ca8-4671-bade-12d8b0fe811d	t	Kanyonyomba	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
4dcf27b2-ce22-4c1f-b942-d78a10bd12f3	t	Nyakariba	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
a0c75f44-9daf-4eb1-af43-6e8e619736ac	t	Rwakarihejuru	0e8ca805-bcb1-4c08-8e40-9bcdfb1e60da
c90ba995-5536-4a03-bdf1-01a39e4f9c07	t	Bwimiyange	6efe4f9f-643e-42e4-b7af-238cafac4a7c
a5a61113-9f6e-4beb-9952-34b31ccc105e	t	Bwingeyo	6efe4f9f-643e-42e4-b7af-238cafac4a7c
a8f900e0-a1dc-4284-9127-6ba68bf8621f	t	Gasagara	6efe4f9f-643e-42e4-b7af-238cafac4a7c
1ddad488-cf40-4d4b-8689-0d925aab8b76	t	Rugwiza	6efe4f9f-643e-42e4-b7af-238cafac4a7c
497d8a79-fe29-4621-86bb-056acc59f28e	t	Ntaganzwa	deb83c82-2496-4236-be11-ceafa977749d
5dced644-599a-47c0-a6af-b00146ce4e8c	t	Nyagasozi	deb83c82-2496-4236-be11-ceafa977749d
cd17a789-3b0b-4f96-90fa-c8a020305c51	t	Nyagisozi	deb83c82-2496-4236-be11-ceafa977749d
d8985b39-464c-42aa-bfdc-efee3a6aa3a9	t	Ruganda	deb83c82-2496-4236-be11-ceafa977749d
1eb7e1bb-fc3c-4111-88fc-699f7152e6f0	t	Gahinga	0dc92e40-6ec2-45c4-9654-630ce33e034d
3102585b-f753-4dbb-a3e8-c0325e7608d4	t	Gasharu	0dc92e40-6ec2-45c4-9654-630ce33e034d
e663b044-be75-48e2-b440-8473e3b08dc8	t	Kibobo	0dc92e40-6ec2-45c4-9654-630ce33e034d
20ecdcf1-472c-43b9-827a-95056b60444f	t	Nombe	0dc92e40-6ec2-45c4-9654-630ce33e034d
38c5ed45-6e57-4cee-a6ac-887144f43c40	t	Munini	c0bb5133-a728-47fa-89d6-e2b776205baf
048d828c-5eb9-4fa6-9143-ee957bf8beea	t	Mutokerezwa	c0bb5133-a728-47fa-89d6-e2b776205baf
e404931d-1ecd-41fe-9b85-c8a6fa4ce4b7	t	Rudakabukirwa	c0bb5133-a728-47fa-89d6-e2b776205baf
719886c1-97b1-4922-85b7-ba1ed24eb99f	t	Runyinya	c0bb5133-a728-47fa-89d6-e2b776205baf
771d63bb-84c2-428b-b005-e4c9ca8bf8f9	t	Kimisebeya	25d22e52-ea37-43dd-baeb-21c6b8523888
7ba8ed8c-dd72-404a-92d7-852056393573	t	Kivugiza	25d22e52-ea37-43dd-baeb-21c6b8523888
1ddbe9e2-08ff-405f-b091-9733255d2312	t	Rugarama	25d22e52-ea37-43dd-baeb-21c6b8523888
8bfdc127-02cf-4f0f-9843-37e493f3f70d	t	Twina	25d22e52-ea37-43dd-baeb-21c6b8523888
1f10708c-731c-433b-96aa-80761f4ecb6c	t	Amajyambere	7b844444-a2d1-49a9-9183-eafe2ceae406
947796df-f220-4c77-856b-a4d4ef9438d8	t	Amarembo	7b844444-a2d1-49a9-9183-eafe2ceae406
02a450f1-84de-4bd1-9637-9fe8d8d45897	t	Byimana	7b844444-a2d1-49a9-9183-eafe2ceae406
a8f05397-fcb6-4b11-a1f0-d192106bc0b8	t	Gasave	7b844444-a2d1-49a9-9183-eafe2ceae406
d2e22de9-007a-474d-8a5b-dc14ffff8b9c	t	Gasharu	7b844444-a2d1-49a9-9183-eafe2ceae406
b8797fd7-242f-4773-8692-4dc780b0ee52	t	Kagara	7b844444-a2d1-49a9-9183-eafe2ceae406
833d55fe-f31a-4538-bb79-e655dbad245f	t	Nyakariba	7b844444-a2d1-49a9-9183-eafe2ceae406
7a331472-53cf-4c8f-8e3c-b37a62e8e548	t	Rwinyana	7b844444-a2d1-49a9-9183-eafe2ceae406
a2582cf3-44ce-41ac-8a49-a02a02bf2e21	t	Masoro	12820992-f140-4fc5-af35-7bd5524238b6
66382fd6-1990-4a3e-86d3-f08faa5daac0	t	Kanyinya	7a64eee5-9359-4652-98ef-db2a901c2a49
2f504f5b-c83f-4b74-9da0-7a420bd3ab0a	t	Kumukenke	7a64eee5-9359-4652-98ef-db2a901c2a49
8484c1c6-2a4a-46f4-b010-374f6c1384a7	t	Murambi	7a64eee5-9359-4652-98ef-db2a901c2a49
0cde745a-3557-4608-96f6-64cfb3865ea7	t	Ntora	7a64eee5-9359-4652-98ef-db2a901c2a49
2fbb46d7-fdb6-4e0b-a4f1-6e81f8bd8f88	t	Rukeri	7a64eee5-9359-4652-98ef-db2a901c2a49
ab56b689-0d12-457d-9e2f-2f6b47d69c22	t	Umurava	7a64eee5-9359-4652-98ef-db2a901c2a49
5e20c6b2-aac9-42f3-9132-f4b86a655ce9	t	Akamatamu	d4aeb524-59f4-4db5-8b05-a523e4ce74f4
71b52691-63be-49dc-b7d6-ebf1942ee770	t	Cyeyere	d4aeb524-59f4-4db5-8b05-a523e4ce74f4
8d5c1b72-b408-4b4c-b580-20df5f71774b	t	Murehe	d4aeb524-59f4-4db5-8b05-a523e4ce74f4
84e494df-eba8-4a7f-b437-e154421bbdca	t	Nyacyonga	d4aeb524-59f4-4db5-8b05-a523e4ce74f4
5b37646e-fb89-4ace-9479-cdfc93f8344b	t	Nyagasozi	d4aeb524-59f4-4db5-8b05-a523e4ce74f4
9951221d-7f54-4c05-84d7-5cb21f52e771	t	Nyarukurazo	d4aeb524-59f4-4db5-8b05-a523e4ce74f4
f3b23529-ffb2-465e-9197-e3a4430358a2	t	Agakenke	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
e23d420e-66ae-466c-845c-a6e8bf65c457	t	Agatare	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
53c05d1a-9c9d-4520-bb43-a8ebdb52e2a4	t	Akinyana	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
be671470-ca6c-4e19-90af-5dbccfffd6db	t	Gikingo	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
bb3287d1-2be2-4a2b-be32-28cf7af16f4c	t	Gitega	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
006af664-e393-462d-8b51-e9c0373e15c9	t	Gitenga	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
2d6c969a-2eae-4405-84e5-34c83a14149f	t	Nyakabingo	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
7318d235-59a9-4ad1-9c6a-22642bbbad87	t	Nyarurama	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
361557d4-c4a1-4927-b27a-d651539c6f4a	t	Rugogwe	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
17c73b6f-238c-425a-b8a7-ff9eb9d57e34	t	Taba	a2e90909-fcea-47e4-b00a-5a90c1f80f7d
c2fe8550-5f73-4a23-8ffd-8919f65f024b	t	Amakawa	dff1710d-664e-462d-a634-34fdd4061c0f
61f26c68-063d-4882-a52c-09e212c48832	t	Amasangano	dff1710d-664e-462d-a634-34fdd4061c0f
2f2aebd2-7a55-45ca-bca7-d5d5939ba026	t	Buliza	dff1710d-664e-462d-a634-34fdd4061c0f
c0abd3d8-30cf-4966-b802-53373857eec7	t	Ihuriro	dff1710d-664e-462d-a634-34fdd4061c0f
90688fa8-49b8-4bf5-b989-f0c91f60848d	t	Kabeza	dff1710d-664e-462d-a634-34fdd4061c0f
dec4520a-1200-4c97-8f88-b72111de53a2	t	Karuruma	dff1710d-664e-462d-a634-34fdd4061c0f
de370690-2f07-4b93-b08f-96876e1d3e55	t	Murama	dff1710d-664e-462d-a634-34fdd4061c0f
6e99d597-a3dd-4333-90d7-f5b32d53ff6f	t	Nyagasozi	dff1710d-664e-462d-a634-34fdd4061c0f
aa117b06-5556-4941-9677-50cec7b6eda9	t	Rebero	dff1710d-664e-462d-a634-34fdd4061c0f
9a2aeb77-23a1-4638-acc5-32a5108e319c	t	Rugarama	dff1710d-664e-462d-a634-34fdd4061c0f
833f58d2-c457-4b7a-97dd-42e810181f24	t	Tetero	dff1710d-664e-462d-a634-34fdd4061c0f
35b0a487-36a5-415c-ad15-142cfecf4bc5	t	Agasekabuye	95432bf5-a6a0-4dec-ad5d-f72f11d79e29
5f94727f-c1ac-4613-baf4-b13e30822721	t	Agatare	95432bf5-a6a0-4dec-ad5d-f72f11d79e29
26940970-f3b2-48b5-ae62-ac81af2f4ada	t	Amasangano	95432bf5-a6a0-4dec-ad5d-f72f11d79e29
289c6656-5314-4a74-ad87-34fb1b5d6aad	t	Mubuga	95432bf5-a6a0-4dec-ad5d-f72f11d79e29
ec90c10e-058a-4f5e-b7ca-25e6bbccf3e1	t	Nyamweru	95432bf5-a6a0-4dec-ad5d-f72f11d79e29
7eff8407-e218-485d-8d19-fe086ae86050	t	Agahama	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
cce2dbe5-dad4-4717-98cb-7a4f7974e2e3	t	Agasharu	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
901acc35-7f33-4f08-9aac-fd29b33c61d4	t	Akabuga	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
5ca5976a-894c-4490-950f-470b8980456c	t	Jurwe	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
e4f79269-9d4c-4e04-a804-bfc8db325f4c	t	Kiberinka	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
bca3594f-fef0-4d35-9d5c-6f5ea6d56c05	t	Nyakirehe	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
69e7b3cd-0030-4ba4-94e1-c565e7dec674	t	Nyarubuye	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
a7f8dda4-b702-4b49-9360-2bf67417d5ce	t	Rubona	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
a1606caf-3572-4533-a115-5d908495c633	t	Rwanyanza	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
0bded5f1-6584-496a-bbd7-c48f98f538c9	t	Uwanyange	0edc5c63-2ce9-413a-b594-b1cfdb3dc795
b2ae2140-33fe-4a67-b033-95536369e7c4	t	Bugarama	8109bd4a-5a35-424c-9084-596af7295c64
ce67870b-dce7-47d1-b426-fae0e0e8d7d9	t	Bukamba	8109bd4a-5a35-424c-9084-596af7295c64
aee14d19-66c3-4b81-87f1-bd1e7d5dbe0b	t	Byimana	8109bd4a-5a35-424c-9084-596af7295c64
9722c3dc-ef0a-4fb1-aedc-f4b6fb4decec	t	Kabizoza	8109bd4a-5a35-424c-9084-596af7295c64
6cbb1ed4-e787-45a3-b020-370be6b6ac26	t	Kinunga	8109bd4a-5a35-424c-9084-596af7295c64
6b9b0061-7f84-4e4b-a362-bae051314f65	t	Urunyinya	8109bd4a-5a35-424c-9084-596af7295c64
a1272f4a-b286-4799-befb-d35861c80873	t	Rwankuba	8109bd4a-5a35-424c-9084-596af7295c64
300edc7d-e739-4421-b4c2-d5e881e1f525	t	Kabande	db837d38-0545-4cd1-ac2c-02e5d887767a
b926078d-bae3-41f3-a2ea-57b6ec5d1573	t	Gatare	db837d38-0545-4cd1-ac2c-02e5d887767a
d94914da-7e00-4171-b00a-5ff5ce1ef3a3	t	Nyamugali	db837d38-0545-4cd1-ac2c-02e5d887767a
0acf730a-c966-47bd-a78c-a74f927ab389	t	Nyarubuye	db837d38-0545-4cd1-ac2c-02e5d887767a
8e7018f7-c2de-4d21-ae9a-411e1312ed7d	t	Gahinga	da0bc312-b7c8-43b1-97c2-7c819eec6ad8
78157763-0c76-48f8-9bc8-f5a44c28ec94	t	Gatare	da0bc312-b7c8-43b1-97c2-7c819eec6ad8
c2276e01-e7ef-407e-90ef-6b83c24bf288	t	Umunyinya	da0bc312-b7c8-43b1-97c2-7c819eec6ad8
d7371771-8990-456b-94f7-004d7c679223	t	Agatwa	dea4ca75-7e3a-48e4-8a90-e5034020f625
fba8d7a7-10cd-4847-8dc9-51cb9eb6b14e	t	Kabagina	dea4ca75-7e3a-48e4-8a90-e5034020f625
27065117-32c0-4142-83f4-186e42b53e51	t	Kajevuba	dea4ca75-7e3a-48e4-8a90-e5034020f625
adee4f86-61f4-4c84-8d6c-bcb3aae671c6	t	Kigarama	dea4ca75-7e3a-48e4-8a90-e5034020f625
33ee92ba-9fca-4311-b929-ac08f32855e0	t	Nyagasayo	dea4ca75-7e3a-48e4-8a90-e5034020f625
2644fcd8-d2e4-4ae1-a971-a74626f2c2f0	t	Nyaburira	112185d1-abcf-4201-9fa5-d66173cf6507
c6d5be7d-39df-4580-8ca9-39ae3c6fdcd9	t	Kirehe	112185d1-abcf-4201-9fa5-d66173cf6507
811210d8-1a94-4efd-8a04-ab4a59dfcf43	t	Mataba	112185d1-abcf-4201-9fa5-d66173cf6507
a3a9a508-29b0-46dd-8208-86158ec658b9	t	Nyarurembo	112185d1-abcf-4201-9fa5-d66173cf6507
50434d28-3288-45fa-a3e0-daca0fd3289e	t	Rubona	112185d1-abcf-4201-9fa5-d66173cf6507
cc1fcb23-f01d-4865-98e2-b674fac9ee7e	t	Bwocya	2fe92806-f904-4a6e-954a-b51069523604
04288bcf-86ad-485b-a511-9b4a40e2cc56	t	Gitaba	2fe92806-f904-4a6e-954a-b51069523604
1e9fd942-9232-4fcd-9076-8704256c2d45	t	Karenge	2fe92806-f904-4a6e-954a-b51069523604
f8974052-1df5-4c5d-82e4-c08c8a13a185	t	Rugina	2fe92806-f904-4a6e-954a-b51069523604
59495721-f822-44d3-9455-6141c51e3d64	t	Ruhihi	2fe92806-f904-4a6e-954a-b51069523604
4cff8701-f17b-446f-b8a2-3b1b8817e22d	t	Agasharu	d0c3087a-310b-4758-8149-4778135ae5c4
5e1a2e2c-5190-4366-9d87-e1f89d145525	t	Agatare	d0c3087a-310b-4758-8149-4778135ae5c4
29b52c0d-a6d4-4618-a22a-fef6713c5a30	t	Kabuga	d0c3087a-310b-4758-8149-4778135ae5c4
b853ff57-02f1-427a-b471-144040b3ca7e	t	Runyinya	d0c3087a-310b-4758-8149-4778135ae5c4
790d1cbf-f775-43b8-ac73-70f6f47b1ac3	t	Amajyambere	7ae3b7b7-50b0-450e-b808-37beb9714c47
11f3ea6a-cacd-451d-afff-6cf48f581799	t	Bukinanyana	7ae3b7b7-50b0-450e-b808-37beb9714c47
bc32ca22-968a-4209-a111-4ed2c399986e	t	Cyimana	7ae3b7b7-50b0-450e-b808-37beb9714c47
7a022cc9-f0e5-4e58-9ff8-df50124c64db	t	Gataba	7ae3b7b7-50b0-450e-b808-37beb9714c47
80ef3ac4-2a9e-4be5-a5f3-6f8ec639525f	t	Itetero	7ae3b7b7-50b0-450e-b808-37beb9714c47
8bdef466-63b3-4cbe-801a-b2fa6032fe94	t	Kabare	7ae3b7b7-50b0-450e-b808-37beb9714c47
7c7c17c3-b2ba-48ad-98aa-64e4c858ca4b	t	Kamuhire	7ae3b7b7-50b0-450e-b808-37beb9714c47
6aee2bc6-b232-4988-a275-f9203f3ef244	t	Karukamba	7ae3b7b7-50b0-450e-b808-37beb9714c47
b46bc45f-172c-4912-be6e-7fe4e440aa07	t	Nyagacyamo	7ae3b7b7-50b0-450e-b808-37beb9714c47
34f5fab0-321c-4251-aa3b-f0a1eb2eade7	t	Rwinzovu	7ae3b7b7-50b0-450e-b808-37beb9714c47
81207e69-b82d-4db7-a99e-9c879658526a	t	Urugwiro	7ae3b7b7-50b0-450e-b808-37beb9714c47
5199695b-14c0-4bb5-aa29-3033b7fe3689	t	Uruhongore	7ae3b7b7-50b0-450e-b808-37beb9714c47
87f7408a-041c-4d8a-95d6-99c0904e9186	t	Agasaro	3066f588-da13-4cc5-b233-4869caab03b3
574db6cf-c2b6-4b0d-867f-7bdd23827c79	t	Gasharu	3066f588-da13-4cc5-b233-4869caab03b3
7492586a-8363-4394-94bb-e1ff45128855	t	Inkingi	3066f588-da13-4cc5-b233-4869caab03b3
10cc8f33-1ad6-4047-8155-630e39616f6a	t	Kanserege	3066f588-da13-4cc5-b233-4869caab03b3
9d5506df-0d69-427e-b9ff-c81fb4e586bc	t	Kigugu	3066f588-da13-4cc5-b233-4869caab03b3
d0211624-530c-4060-9da5-d9902014a5d4	t	Ruganwa	3066f588-da13-4cc5-b233-4869caab03b3
16501bc2-e7d4-481d-a9c3-a2ec1faf093d	t	Umuco	3066f588-da13-4cc5-b233-4869caab03b3
8a16b411-f9cb-4a24-bb1d-6edc21e6d128	t	Urugero	3066f588-da13-4cc5-b233-4869caab03b3
3b8e9731-80ac-474f-84bd-a059e8653f29	t	Urwibutso	3066f588-da13-4cc5-b233-4869caab03b3
c50d5588-2cad-4103-8107-9086532f29b2	t	Amahoro	df9b10af-ae70-45c7-b368-5f853699e909
313777a7-64fb-42d0-a17a-5832e04d84d0	t	Bwiza	df9b10af-ae70-45c7-b368-5f853699e909
0a041c8e-953c-40f6-83b0-fde82544f180	t	Ihuriro	df9b10af-ae70-45c7-b368-5f853699e909
959b889d-3ac6-4b2c-8f8d-5efc48dc5777	t	Ineza	df9b10af-ae70-45c7-b368-5f853699e909
d792ab33-8195-40e1-b94d-04d1d87841ca	t	Inyange	df9b10af-ae70-45c7-b368-5f853699e909
88e7858b-6e12-43ba-84fd-ad8e990adaec	t	Iriba	df9b10af-ae70-45c7-b368-5f853699e909
93849c11-2cef-4dc5-a554-aba2ca696719	t	Kabagari	df9b10af-ae70-45c7-b368-5f853699e909
aa49ede8-a076-4847-b1b4-9fb1c4b371bc	t	Ubumwe	df9b10af-ae70-45c7-b368-5f853699e909
32cc284d-966f-408c-820c-7c706e813871	t	Umutako	df9b10af-ae70-45c7-b368-5f853699e909
cd9b7fd5-ef1d-45f7-a86c-053c3813bcc8	t	Urukundo	df9b10af-ae70-45c7-b368-5f853699e909
54c82f60-e22d-4545-8d89-53cba9a49f28	t	Virunga	df9b10af-ae70-45c7-b368-5f853699e909
5a772061-4233-48be-802b-c11a102633c0	t	Inyamibwa	416b7934-2083-4019-b11c-5db6030bd89a
facc7202-ce44-4acc-8bff-c713842fdfa3	t	Isangano	416b7934-2083-4019-b11c-5db6030bd89a
6b3ec192-7df3-4424-a107-c3553bdd690f	t	Isano	416b7934-2083-4019-b11c-5db6030bd89a
b5dd3988-92d2-4b55-8172-29473a814585	t	Ituze	416b7934-2083-4019-b11c-5db6030bd89a
bf55f97c-0f96-41e3-9d94-92e7492e7c2a	t	Izuba	416b7934-2083-4019-b11c-5db6030bd89a
2da1347a-9e03-4e96-807f-8d9104eb954b	t	Juru	416b7934-2083-4019-b11c-5db6030bd89a
1c89c31d-fedd-4b61-ad7c-4baf2943342e	t	Nyenyeri	416b7934-2083-4019-b11c-5db6030bd89a
6407cc3d-a931-44d0-b03c-c41a5225ca42	t	Umurava	416b7934-2083-4019-b11c-5db6030bd89a
263e63fb-99bb-4320-8daa-6d8e08ebeb17	t	Urumuri	416b7934-2083-4019-b11c-5db6030bd89a
04d93c8e-b806-4ef9-ad6d-2792f7bfe6bd	t	Amahoro	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
2a95897a-9d18-4f89-9696-2d8cc146ddc4	t	Amajyambere	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
6ea44ae4-8d6a-4e99-85da-ce3335a7702e	t	Imihigo	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
985a8a5e-0903-4de6-9476-2c919c416592	t	Intambwe	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
8035b4e6-962d-4aeb-b3ba-e2ba73c0e70a	t	Mutara	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
c1baa19b-50c6-4677-88cc-f8fadfdfb994	t	Rugarama	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
7f014209-b6db-4b4b-b0c5-760d5fb1d73d	t	Ubumwe	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
4b4e0027-7296-4881-8630-2a862620ae5b	t	Umutekano	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
79a01baf-1440-4a1b-8a92-78ddd3fa514e	t	Urwego	1aaf0262-a7fb-48f7-b7d9-544a4e620cf5
b44e264a-f4b3-4fe5-a72b-022a1be6d780	t	Gasange	de5e86c0-9b0d-4949-8a08-14e373b76a52
31ae62dd-a82e-480d-8d31-d38c2d2d99dc	t	Gasasa	de5e86c0-9b0d-4949-8a08-14e373b76a52
0d977057-d934-4b9b-a31c-b1f777d12415	t	Rebero	de5e86c0-9b0d-4949-8a08-14e373b76a52
04b84fe0-7731-460a-baaf-0080635eaac6	t	Taba	de5e86c0-9b0d-4949-8a08-14e373b76a52
8ff1d3c4-b683-4604-9aa2-116356f1da03	t	Abatuje	a1e88071-9d4e-4dbc-9200-5f7c9898387d
c56f03aa-6014-46ca-8838-a9536d9a0c7c	t	Amariza	a1e88071-9d4e-4dbc-9200-5f7c9898387d
ff730fb3-7f3c-4e9b-9b86-1657ac186219	t	Imanzi	a1e88071-9d4e-4dbc-9200-5f7c9898387d
8cf60ee3-b982-48a0-a7c7-cb36ccfc137f	t	Imena	a1e88071-9d4e-4dbc-9200-5f7c9898387d
9268a595-1660-45f9-b7df-ccd99e32677f	t	Imitari	a1e88071-9d4e-4dbc-9200-5f7c9898387d
75c92eaa-8952-4fc0-b8c4-ae160506a744	t	Inganji	a1e88071-9d4e-4dbc-9200-5f7c9898387d
ac24be05-d233-47eb-a00d-7b0d1d245261	t	Ingenzi	a1e88071-9d4e-4dbc-9200-5f7c9898387d
6829b315-5350-45e2-8744-cea2f144da7b	t	Ingeri	a1e88071-9d4e-4dbc-9200-5f7c9898387d
25b81590-cb1d-414e-bcbc-1c54699fb3fd	t	Inshuti	a1e88071-9d4e-4dbc-9200-5f7c9898387d
d1ddc5bb-10dd-4413-b7f8-2767d2381a62	t	Intashyo	a1e88071-9d4e-4dbc-9200-5f7c9898387d
4ef56fec-267a-4131-a2d3-eeb08034f2c4	t	Intwari	a1e88071-9d4e-4dbc-9200-5f7c9898387d
0e810c9e-74e2-4441-b560-127f41ce41eb	t	Inyamibwa	a1e88071-9d4e-4dbc-9200-5f7c9898387d
5ad72d79-7351-4f74-9035-e9c41e7bcaa9	t	Inyange	a1e88071-9d4e-4dbc-9200-5f7c9898387d
5f0d3193-2793-40e9-bc5d-7c224aaceb77	t	Ubwiza	a1e88071-9d4e-4dbc-9200-5f7c9898387d
b26a015d-6e4b-40f9-843d-be66be41163a	t	Umwezi	a1e88071-9d4e-4dbc-9200-5f7c9898387d
9679a60c-6494-47a8-a699-ef05222be860	t	Akintwari	10bb9683-1653-4956-857d-c498acb80005
fc4390b3-cf29-4837-af52-430f94ba2ca1	t	Buranga	10bb9683-1653-4956-857d-c498acb80005
26ccb54a-dc3b-407e-b7a4-f4ec2c143c89	t	Gasharu	10bb9683-1653-4956-857d-c498acb80005
7e672b85-950e-4d19-b48c-0bf0d67fe4a0	t	Ibuhoro	10bb9683-1653-4956-857d-c498acb80005
56216606-74cc-47e8-afd8-ac55f3d5bbb4	t	Kageyo	10bb9683-1653-4956-857d-c498acb80005
3b0d53e9-53d3-4f8c-8489-34815d160b18	t	Kamahinda	10bb9683-1653-4956-857d-c498acb80005
cb135fc2-0647-46e2-ba7e-f25610dcfd94	t	Karisimbi	10bb9683-1653-4956-857d-c498acb80005
bf959bd4-0694-4238-8ffe-ab077ab57d7b	t	Karongi	10bb9683-1653-4956-857d-c498acb80005
900a4f4a-01a4-46a5-9a29-2a43d2f25ec7	t	Nyirabwana	10bb9683-1653-4956-857d-c498acb80005
e2f4ef6a-3c35-4d3a-8778-e67fe8957d68	t	Ramiro	10bb9683-1653-4956-857d-c498acb80005
06e590c7-d1d1-497c-9650-bacc909400be	t	Rindiro	10bb9683-1653-4956-857d-c498acb80005
99abf71c-dff6-4096-96e6-c5392e0d7d31	t	Rugero	10bb9683-1653-4956-857d-c498acb80005
3db78c61-d7ec-4cd3-ba43-d0c1f880142e	t	Rukurazo	10bb9683-1653-4956-857d-c498acb80005
c7c7e22c-70a4-466d-87ee-c4a24006905e	t	Urumuri	10bb9683-1653-4956-857d-c498acb80005
0d17220c-7845-438f-94e9-b6a8363cf3d4	t	Ibukinanyana	16fbe457-0661-457c-98f1-d72ab9b1c03a
fd23e42f-1f4b-434a-adb7-6ba25c14bafe	t	Ibuhoro	16fbe457-0661-457c-98f1-d72ab9b1c03a
eece5e9b-f747-4b63-bc13-4fb6c89e77dc	t	Ijabiro	16fbe457-0661-457c-98f1-d72ab9b1c03a
1ae9cb3c-fef7-417c-9d7f-1e63b954968f	t	Isangano	16fbe457-0661-457c-98f1-d72ab9b1c03a
588d72be-3853-4ed9-a1b1-b12806c0330b	t	Itetero	16fbe457-0661-457c-98f1-d72ab9b1c03a
4f94de1c-8e95-4a8b-b3a1-adcf4f76ea15	t	Urugwiro	16fbe457-0661-457c-98f1-d72ab9b1c03a
cee8afa7-0c20-47bd-9b63-ccd94b25c38e	t	Akarambo	b2b2649d-b7ea-4985-a598-7bf1fac36d16
7ccccb82-60c1-4d01-b90a-42d92f6b08ae	t	Akaruvusha	b2b2649d-b7ea-4985-a598-7bf1fac36d16
daa0317e-923a-493e-b0c3-383cf96fb019	t	Estate 2020	b2b2649d-b7ea-4985-a598-7bf1fac36d16
95cea1a2-1da8-421f-b612-30110b826e2b	t	Kabuhunde II	b2b2649d-b7ea-4985-a598-7bf1fac36d16
b29aa0ee-f725-4c87-a2f6-21b1ab9911bd	t	Urugarama	b2b2649d-b7ea-4985-a598-7bf1fac36d16
ceecc5d4-29a0-4737-b3e5-48cf90dcd83f	t	Ururembo	b2b2649d-b7ea-4985-a598-7bf1fac36d16
d6daabe2-3f35-44f5-a42c-11c64b41a3e9	t	Umucyo	b2b2649d-b7ea-4985-a598-7bf1fac36d16
ce92fc02-4720-4d0f-92a2-bd9c50d46bfd	t	Agatare	acfbeedf-3adb-497f-95ba-fdeb979f6f47
e0a1b1f7-f196-4000-b7fe-13bdb67234e8	t	Gasharu	acfbeedf-3adb-497f-95ba-fdeb979f6f47
d3ec21ee-95c0-4e61-8bc3-185bd61d3baa	t	Kami	acfbeedf-3adb-497f-95ba-fdeb979f6f47
2822b5a3-389c-48e3-be89-d7f557f331f6	t	Rwankuba	acfbeedf-3adb-497f-95ba-fdeb979f6f47
b9281d53-8f55-48e2-94f7-ebbd592fee74	t	Dusenyi	16132b92-fa4e-4764-802e-315f7dbafec9
15f881dc-f856-4118-bee8-aedfb13a307d	t	Gicikiza	16132b92-fa4e-4764-802e-315f7dbafec9
527524a8-61d3-4b50-ae1f-ba3d96c54cd5	t	Giheka	16132b92-fa4e-4764-802e-315f7dbafec9
4f69227c-0b5f-428b-836c-ae73e8fed9c1	t	Kabuhunde I	16132b92-fa4e-4764-802e-315f7dbafec9
75f3d858-7e38-4bfe-88ce-7ffcb540081a	t	Kadobogo	16132b92-fa4e-4764-802e-315f7dbafec9
e62b411b-5eeb-4e95-b51e-a7093dec3e8f	t	Kagarama	16132b92-fa4e-4764-802e-315f7dbafec9
27f3f047-5338-43a7-8a95-31eb4d7a4190	t	Muhororo	16132b92-fa4e-4764-802e-315f7dbafec9
0998f61d-9bb6-4577-b757-201a314a4706	t	Nyakabungo	16132b92-fa4e-4764-802e-315f7dbafec9
aab41604-2d61-4db6-8626-7d72e7dad816	t	Rukingu	16132b92-fa4e-4764-802e-315f7dbafec9
7640b30f-4e74-4ef2-b1ff-15c5ca57116e	t	Binunga	e5db1a8c-5874-49ac-91f4-c7dd302a691f
401494f2-91a1-43b4-bf5e-bb64b2954f87	t	Ngaruyinka	e5db1a8c-5874-49ac-91f4-c7dd302a691f
86c90275-e5e0-4cf8-8e05-7e53aa2a239f	t	Rusenyi	e5db1a8c-5874-49ac-91f4-c7dd302a691f
51fd631b-17af-4ae8-b9d2-9f199c81ed43	t	Taba	e5db1a8c-5874-49ac-91f4-c7dd302a691f
35b28d23-6e27-43fa-aa09-30cbcfb94cb0	t	Akarwasa	39849947-31d8-4972-856d-2ad020ddca55
7ea11d33-14a2-4950-ac8f-3f4728df1a60	t	Akasemurombo	39849947-31d8-4972-856d-2ad020ddca55
db202e6a-1f47-4996-97ec-193bd0f118fb	t	Bucyemba	39849947-31d8-4972-856d-2ad020ddca55
b1db618a-974d-4c85-b10f-c6a65f8f0984	t	Gasharu	39849947-31d8-4972-856d-2ad020ddca55
b8980bd8-8c35-4a5c-965a-9e463194a0eb	t	Mukagarama	39849947-31d8-4972-856d-2ad020ddca55
83426a18-e594-4d13-b4b6-37bef3bd4f9d	t	Ruhangare	39849947-31d8-4972-856d-2ad020ddca55
d27b46f2-6807-4cc2-b2fe-210b226b2766	t	Ayabakora	fe1d6a72-6852-4e14-b5d4-81863715891f
2d3e0f6c-030e-4bfb-a984-0d5fc6887cba	t	Cyaruzinge	fe1d6a72-6852-4e14-b5d4-81863715891f
e9868ccc-c44e-4c13-b0c1-48bd0071618b	t	Gashure	fe1d6a72-6852-4e14-b5d4-81863715891f
a1f7ffd7-8672-4b7b-914e-abe0fb16ef03	t	Gatare	fe1d6a72-6852-4e14-b5d4-81863715891f
bd740fc7-91fa-4d6d-9fb7-0676d92db009	t	Gisura	fe1d6a72-6852-4e14-b5d4-81863715891f
31400108-7340-4b5c-bfd9-431c4995213b	t	Karubibi	fe1d6a72-6852-4e14-b5d4-81863715891f
b45ee540-b4cc-476d-9b56-d55122b4b307	t	Mulindi	fe1d6a72-6852-4e14-b5d4-81863715891f
e4213556-8970-47b9-bb22-f8070e1f5d62	t	Bahoze	9f915fa1-b418-47c9-bf19-ba60140c1ea8
56144484-64bc-414a-a0b0-47af8ec2b2aa	t	Berwa	9f915fa1-b418-47c9-bf19-ba60140c1ea8
95ba7580-2ea3-40fb-8dc9-e0340168e14e	t	Buhoro	9f915fa1-b418-47c9-bf19-ba60140c1ea8
d52a10cc-3bc7-4c34-b075-1e4a8bf2fa43	t	Burunga	9f915fa1-b418-47c9-bf19-ba60140c1ea8
4e4306d5-57f1-4bd2-9b88-5b21bb1ee782	t	Gitaraga	9f915fa1-b418-47c9-bf19-ba60140c1ea8
c7826143-5bcf-4833-b5a2-5634d45b530f	t	Kira	9f915fa1-b418-47c9-bf19-ba60140c1ea8
0cf1977e-32c5-47ea-9311-39b0bab4a9de	t	Nezerwa	9f915fa1-b418-47c9-bf19-ba60140c1ea8
5c185baa-85e5-46ef-bb9f-2dbfad0781f6	t	Rugazi	9f915fa1-b418-47c9-bf19-ba60140c1ea8
f8c703ee-aecb-4c64-a3ad-328fdf75ba9f	t	Runyonza	9f915fa1-b418-47c9-bf19-ba60140c1ea8
36cee34a-6b6d-4669-a57b-402451c7fed1	t	Tumurere	9f915fa1-b418-47c9-bf19-ba60140c1ea8
2c84a9f0-6bc4-4bc1-910c-0be25d605bf9	t	Ururembo	9f915fa1-b418-47c9-bf19-ba60140c1ea8
0058156e-2d4d-4c31-9e78-067da0496287	t	Byimana	12820992-f140-4fc5-af35-7bd5524238b6
2edf2a5d-4934-4ef9-816f-16f855db12cd	t	Kabeza	12820992-f140-4fc5-af35-7bd5524238b6
ce4ce65e-2303-4e6a-8619-c666bc1f98c2	t	Matwari	12820992-f140-4fc5-af35-7bd5524238b6
a1c1263b-2a37-47bb-b949-f1118b73b74f	t	Mubuga	12820992-f140-4fc5-af35-7bd5524238b6
658765c7-7a91-4afb-b0d0-f97290754bdf	t	Munini	12820992-f140-4fc5-af35-7bd5524238b6
14fa2996-c59a-4832-ac78-bb11e6db4cb2	t	Akamusare	bcee783b-773a-492f-98cb-c1826a4a5288
10d8add4-41f3-47ea-8e9f-3497a441dfb8	t	Akimana	bcee783b-773a-492f-98cb-c1826a4a5288
f37b77bd-f56a-4055-90ce-68dae1479197	t	Gasharu	bcee783b-773a-492f-98cb-c1826a4a5288
218432dd-6875-4cc6-8ac5-c6767364c2f5	t	Jurwe	bcee783b-773a-492f-98cb-c1826a4a5288
30d4f762-7901-44be-96d5-37c35685e2fa	t	Karambo	bcee783b-773a-492f-98cb-c1826a4a5288
2ce1317b-d060-4226-8386-04969cf3348d	t	Kigabiro	bcee783b-773a-492f-98cb-c1826a4a5288
41e63290-d31d-4257-88ec-0af3d199863b	t	Ruseno	bcee783b-773a-492f-98cb-c1826a4a5288
cb74364f-a349-4dc0-b170-2a3bb64f0476	t	Kacyinyaga	cad56407-add8-46b1-938d-0beb8e4ee6b7
543d06d3-2777-4b73-bbf0-6f2c4d7119c9	t	Kamahoro	cad56407-add8-46b1-938d-0beb8e4ee6b7
c0e4b603-4c9b-4740-b706-dc142720fc15	t	Munini	cad56407-add8-46b1-938d-0beb8e4ee6b7
ede5c7f2-0aac-4549-952b-c53f8fda393e	t	Nyakagezi	cad56407-add8-46b1-938d-0beb8e4ee6b7
e3cb9ce1-4d39-4278-81c9-7857627fa240	t	Ruhangare	cad56407-add8-46b1-938d-0beb8e4ee6b7
bd34a6c3-24fd-4c48-8a65-bece60933066	t	Ruhogo	cad56407-add8-46b1-938d-0beb8e4ee6b7
90897ba0-37de-499b-a946-6eb39bc0c90a	t	Kanani	d81a81e1-747c-4418-997c-cf8873cd43b7
98902283-9f27-4f2f-b612-46d61499080e	t	Kidahe	d81a81e1-747c-4418-997c-cf8873cd43b7
589fa537-18d8-4330-8cb8-ca13416a1f36	t	Kigabiro	d81a81e1-747c-4418-997c-cf8873cd43b7
30fae619-9d27-460f-9423-ddc5ed0c16ff	t	Nyamurambi	d81a81e1-747c-4418-997c-cf8873cd43b7
f673ae83-75a6-42a2-baac-a08e721f74a4	t	Nyarubuye	d81a81e1-747c-4418-997c-cf8873cd43b7
31f71822-3f12-4bc2-a050-bb6845d772e1	t	Nyura	d81a81e1-747c-4418-997c-cf8873cd43b7
9e377340-ef74-4064-90ee-1e705cbe3192	t	Gatagara	5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178
5eefbfda-a30a-4f40-9288-d12c62edcd1a	t	Kagarama	5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178
ba7a83a7-565e-49f2-83cb-b8586a1d2e57	t	Nyabitare	5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178
7562797f-3dec-4630-b0cb-f21c8f0b845d	t	Nyakabungo	5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178
dcb902a1-d848-40e3-84e7-c655c9d9b608	t	Nyarubande	5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178
caf31c29-23c8-4b2c-9b2d-d236f0fd3948	t	Uruhetse	5ef0c6d7-ae7a-4178-9f1b-b46c8e4c9178
96d7122e-cf98-4520-adb4-cb687a8c1a7e	t	Agacyamo	89be6674-f1e9-45c4-8bf1-16a63aea40b7
bcd5f80b-08e7-466c-bd8d-2ee145be9829	t	Gashinya	89be6674-f1e9-45c4-8bf1-16a63aea40b7
74dd48d4-2493-4b55-8529-8c0a0307b5c6	t	Gikombe	89be6674-f1e9-45c4-8bf1-16a63aea40b7
9142ef69-f818-41e2-aefb-7b3d932b4bbe	t	Kazi	89be6674-f1e9-45c4-8bf1-16a63aea40b7
66d09eb2-f9eb-4411-9023-258eca98e168	t	Kigufi	89be6674-f1e9-45c4-8bf1-16a63aea40b7
a73b5808-1aa1-4539-991a-2f058dc66116	t	Nyirakibehe	89be6674-f1e9-45c4-8bf1-16a63aea40b7
a51a472d-19d3-467f-886e-cc03a113bdda	t	Uruhahiro	89be6674-f1e9-45c4-8bf1-16a63aea40b7
8e5914a0-2f42-492e-ae32-2fc00a9400a5	t	Agasharu	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
30b68218-2177-45b3-96c7-76e5bb873fb2	t	Amataba	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
e9e5f495-d0d5-49b4-82d4-27a5f904b34c	t	Burungero	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
78a1c2b1-0d66-4b05-82cd-27f8fdd2fea5	t	Karama	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
e1fe9f3e-a584-48c5-a88c-eb51c0b7a570	t	Nyange	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
e42dfade-7c0f-49a0-aac5-c6d14df12735	t	Rebero	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
493e7ee8-b127-48f7-86ce-c4c50cde7a9c	t	Uruyange	33cf975e-c1cd-4d42-9214-2ccb28f80ee0
15d9f3f5-3b0b-4831-a614-5047e234883b	t	Gatobotobo	c21ee15d-ac58-4d70-840e-6dab526a384f
7b7811d2-8aee-456c-96f9-ee38c06d7ace	t	Kibungo	c21ee15d-ac58-4d70-840e-6dab526a384f
43c68de9-8064-4636-8cda-e0eac6339081	t	Musezero	c21ee15d-ac58-4d70-840e-6dab526a384f
b6c02ee3-b77e-42b0-bbe0-59a2c4698257	t	Nyaburoro	c21ee15d-ac58-4d70-840e-6dab526a384f
1667ce23-e632-4ee0-9d82-19f8da4eb399	t	Taba	c21ee15d-ac58-4d70-840e-6dab526a384f
c99717d2-535e-405a-be1f-817d615ae585	t	Bikumba	5016cb46-c0da-42e5-b790-c3034c674bf7
a5b5e0ec-f6d0-4381-a7c7-0df859b45f20	t	Gakizi	5016cb46-c0da-42e5-b790-c3034c674bf7
f1bcbea3-3653-4bda-b5d4-6769abce59a7	t	Gatare	5016cb46-c0da-42e5-b790-c3034c674bf7
6b9c5d04-140d-4912-86e9-ef3120a18ce9	t	Kamuyange	5016cb46-c0da-42e5-b790-c3034c674bf7
e730e5c9-5b9a-432b-b982-576bc9ca1e21	t	Kigarama	5016cb46-c0da-42e5-b790-c3034c674bf7
f6e461e5-3663-409a-989b-3e0e957eb835	t	Ngara	5016cb46-c0da-42e5-b790-c3034c674bf7
5c8c5112-1056-444d-9003-101b3489522e	t	Akazi	5b64dc88-5551-4536-a3b9-634fe9e0dce3
b55a2b0a-0cc4-431c-89cd-d7ace0b489f8	t	Kaduha	5b64dc88-5551-4536-a3b9-634fe9e0dce3
8688fa25-7c5a-4c4e-87a4-05487134d88c	t	Kamuhoza	5b64dc88-5551-4536-a3b9-634fe9e0dce3
1d3029a3-2ead-4198-9ede-a38492a53645	t	Mirambi	5b64dc88-5551-4536-a3b9-634fe9e0dce3
632a10bb-19c2-41a4-8b96-f9b87ee36d0b	t	Munini	5b64dc88-5551-4536-a3b9-634fe9e0dce3
83a4353c-4f0c-491d-a617-d3bce29b8aed	t	Ndanyoye	5b64dc88-5551-4536-a3b9-634fe9e0dce3
22041773-076b-442c-b80c-341b02a2bdd5	t	Nyamigina	5b64dc88-5551-4536-a3b9-634fe9e0dce3
d755da21-791d-41eb-a93b-dda4f1a6de55	t	Rugarama	5b64dc88-5551-4536-a3b9-634fe9e0dce3
75fd74da-ae17-41e2-b4e2-88efa64dd7d9	t	Amarembo I	9b740834-26b3-4ed8-a952-17351a59db15
0c6bef74-2c0f-4b2e-8592-4712ab742928	t	Amarembo II	9b740834-26b3-4ed8-a952-17351a59db15
0d1239cd-03db-4251-aa44-a61cbbeaf3f7	t	Gihogere	9b740834-26b3-4ed8-a952-17351a59db15
9252af71-0a12-4166-a487-877b896592d4	t	Kagara	9b740834-26b3-4ed8-a952-17351a59db15
167af764-0634-4c21-b564-851921a53fcd	t	Kinunga	9b740834-26b3-4ed8-a952-17351a59db15
94a021cd-e7ba-4a9c-9c59-64c6dff70859	t	Nyabisindu	9b740834-26b3-4ed8-a952-17351a59db15
6f8f5771-8ff8-4b5c-a0b2-2d29a6445c93	t	Rugarama	9b740834-26b3-4ed8-a952-17351a59db15
680d7c17-e116-4cf4-9b94-919a7b7344ef	t	Gishushu	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
825c0524-1a8d-428a-9669-4babfc20b3f5	t	Juru	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
3092a8f5-cb1e-4def-a7a0-c891120cf5a4	t	Kamahwa	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
59dbea84-dea1-4ca1-9dfe-0b754b55ad1e	t	Kangondo I	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
847b9732-f358-4256-8054-90b6040936b2	t	Kangondo II	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
4270c71f-b068-491e-80fe-11fe0cb0a149	t	Kibiraro I	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
34ec56e6-26a3-496c-ba53-24f2b5ec5326	t	Kibiraro II	63ff094b-3d6c-409c-9f96-5cc1ab4054e8
fe739350-b26c-4cea-a479-402d556882db	t	Agashyitsi	761abb54-4b4e-4f30-ae09-24a2f4646c2e
bf3dd8d8-3010-451c-bebe-554243d8ff6e	t	Amajyambere	761abb54-4b4e-4f30-ae09-24a2f4646c2e
5b5dabff-a8c3-4f92-b3b0-efcd5cd31491	t	Izuba	761abb54-4b4e-4f30-ae09-24a2f4646c2e
3c90c9f8-ca05-4f81-b55c-14e1f80bc9e5	t	Gisimenti	761abb54-4b4e-4f30-ae09-24a2f4646c2e
ac3fbaee-94e9-4e0f-a577-248f1f2ecf10	t	Ubumwe	761abb54-4b4e-4f30-ae09-24a2f4646c2e
c6b2d7f9-5a24-4ff3-ac63-5d1567b0860e	t	Ukwezi	761abb54-4b4e-4f30-ae09-24a2f4646c2e
61ba3d11-def6-4e40-8391-7f3f429d415d	t	Urumuri	761abb54-4b4e-4f30-ae09-24a2f4646c2e
4e57c396-34ef-472d-b8a4-f6bb6494568d	t	Amahoro	c2b57c5f-7989-4e23-a772-2574a2efcaa5
4e9f39f8-0c68-4017-b02a-75abc4fffd3d	t	Rebero	c2b57c5f-7989-4e23-a772-2574a2efcaa5
23717948-2e0e-4c51-bdca-9f61aeb41fdf	t	Ruturusu I	c2b57c5f-7989-4e23-a772-2574a2efcaa5
45c570a6-c4d7-48f4-b93a-2206fe165a07	t	Ruturusu II	c2b57c5f-7989-4e23-a772-2574a2efcaa5
24cd11db-7f54-4b9e-a629-24269e3b1a5c	t	Ubumwe	c2b57c5f-7989-4e23-a772-2574a2efcaa5
253f4207-288a-4505-873d-0f619925cae3	t	Bisenga	ef6332ef-4500-4804-885e-817bd7c6952e
25b809b6-0c00-48de-bac7-0b8be46c4702	t	Gakenyeri	ef6332ef-4500-4804-885e-817bd7c6952e
d0b5deb4-c79f-4caa-9720-b16672ef200b	t	Gasiza	ef6332ef-4500-4804-885e-817bd7c6952e
a517a918-2491-4862-bb9b-3eba30e006b0	t	Kidogo	ef6332ef-4500-4804-885e-817bd7c6952e
97c84d9f-5e50-49cc-9d88-761f4f41583c	t	Agatare	225bedb8-bfd4-46ff-8859-1ed7a39ab987
f69f18fb-b535-4dc6-bf69-b95e608819fc	t	Gasagara	225bedb8-bfd4-46ff-8859-1ed7a39ab987
3e0d8441-33c6-4b22-bf2a-2316a09e97e0	t	Kamasasa	225bedb8-bfd4-46ff-8859-1ed7a39ab987
4de766a7-d168-4421-a250-5e52d7488c57	t	Rugagi	225bedb8-bfd4-46ff-8859-1ed7a39ab987
876785cc-adc5-4b0f-8af9-da88cd6ed1fa	t	Ryabazana	225bedb8-bfd4-46ff-8859-1ed7a39ab987
0b6e2d8c-2c4a-4b05-bbc0-e04b262a05c9	t	Abatangampu	18214639-095e-4b05-9b81-e76f64fc9123
cf8a363a-801b-47bf-be64-a4e2c80b8826	t	Amahoro	18214639-095e-4b05-9b81-e76f64fc9123
9e2a944e-7a74-4fd0-a756-d93b79fbcb40	t	Isangano	18214639-095e-4b05-9b81-e76f64fc9123
98673dba-2160-4e0d-9b8a-e64db81b28bc	t	Kabeza	18214639-095e-4b05-9b81-e76f64fc9123
b74a0505-f459-4999-bb40-5f6f0a154235	t	Kalisimbi	18214639-095e-4b05-9b81-e76f64fc9123
4fcd4bd7-87f7-4d8d-ad5e-6fce3aacc839	t	Masango	18214639-095e-4b05-9b81-e76f64fc9123
1613975d-1cd6-496e-bf41-07f6256abc2f	t	Bwiza	070e2064-d913-4052-a84f-a6001d9e26fd
2c7e58b3-8fcd-4292-b38b-02be167d16ae	t	Cyanamo	070e2064-d913-4052-a84f-a6001d9e26fd
e5901861-c998-45bc-a7db-1f5fffc437b3	t	Gatare	070e2064-d913-4052-a84f-a6001d9e26fd
98a27d1a-9a66-4b04-aab4-bfb63069b719	t	Kamashashi	070e2064-d913-4052-a84f-a6001d9e26fd
cab2f0c1-277e-4c26-a304-25320d5cb349	t	Mataba	070e2064-d913-4052-a84f-a6001d9e26fd
9b999f33-c0c6-45bb-a9a2-005977c94b31	t	Nyagakombe	070e2064-d913-4052-a84f-a6001d9e26fd
500ad93d-1408-4753-bdaf-0f2587661f4b	t	Ruhangare	070e2064-d913-4052-a84f-a6001d9e26fd
9e0bc197-a763-42a0-b622-1928072d21a7	t	Busenyi	c31b54ac-5689-41a5-9297-d15ced8ae618
81a180ca-43de-48e5-9884-76209f9c5eda	t	Kigabiro	c31b54ac-5689-41a5-9297-d15ced8ae618
6182b613-b7bc-4226-9723-11eb68e858e8	t	Kinyana	c31b54ac-5689-41a5-9297-d15ced8ae618
e70ae141-7c9e-4773-a896-7546d75f0662	t	Nyagisozi	c31b54ac-5689-41a5-9297-d15ced8ae618
75c583bd-e004-4083-b3e4-bd8e829ee267	t	Cyeru	46c11105-6b4d-4970-8d62-ba9e6cf54a69
4b46434d-5e86-40f9-b333-d2eaa3dda476	t	Karambo	46c11105-6b4d-4970-8d62-ba9e6cf54a69
5a721219-b262-4bbc-af89-02c240260ede	t	Kataruha	46c11105-6b4d-4970-8d62-ba9e6cf54a69
310435cb-596f-48fb-a05c-c7cf9e50141b	t	Mugeyo	46c11105-6b4d-4970-8d62-ba9e6cf54a69
40a94501-3a03-44ea-822e-d667af0885a2	t	Rugarama	46c11105-6b4d-4970-8d62-ba9e6cf54a69
44dac4b3-8b48-4cf1-bcfe-f79f3fcf5a8b	t	Samuduha	46c11105-6b4d-4970-8d62-ba9e6cf54a69
4daf26e4-6e9b-4472-b84f-4cebb6cb93bb	t	Gisharara	d691907c-173a-43bf-a4dc-16d3662278a6
3002895a-5cbf-43cd-b0ed-d0270b0881d0	t	Kabutare	d691907c-173a-43bf-a4dc-16d3662278a6
fc122643-6cd4-4224-9ff4-7a59475531e0	t	Kanyinya	d691907c-173a-43bf-a4dc-16d3662278a6
b4d6ab87-fa23-496c-9f65-61c45c9e1555	t	Kigarama	d691907c-173a-43bf-a4dc-16d3662278a6
92979569-a83e-45fc-93d3-b352f8120e77	t	Nyarucundura	d691907c-173a-43bf-a4dc-16d3662278a6
c3406bc7-d3d8-4fc4-aa2c-9139f46626be	t	Runyonza	d691907c-173a-43bf-a4dc-16d3662278a6
14a4aeed-f205-4b52-80e7-8ff5c52a2279	t	Urumuri	d691907c-173a-43bf-a4dc-16d3662278a6
6ccf2212-3707-4881-96ab-5beb654cf7dd	t	Kinyaga	6fab92d7-8ae9-4ae8-acea-f465a37a6981
45fbf2ac-beef-4e16-870f-fb8565f9e120	t	Mirama	6fab92d7-8ae9-4ae8-acea-f465a37a6981
05b4e30f-6aca-40d7-a557-dadcd38f1492	t	Nyagacyamo	6fab92d7-8ae9-4ae8-acea-f465a37a6981
c313588e-19a9-441c-b97b-ca6f1484e197	t	Rugende	6fab92d7-8ae9-4ae8-acea-f465a37a6981
fe4cdb73-aecd-47e4-8631-912337f49de5	t	Ruhanga	6fab92d7-8ae9-4ae8-acea-f465a37a6981
a2e9da6c-5eda-4329-bccb-5469a55b31e5	t	Gasharu	721b1e90-ec70-4e5f-9d44-3ffd72df1272
afcb1c39-0289-48ee-8820-83d13fc78697	t	Mulindi	721b1e90-ec70-4e5f-9d44-3ffd72df1272
f5c33ae4-7492-4760-9b8c-caee7b0cd212	t	Vugavuge	721b1e90-ec70-4e5f-9d44-3ffd72df1272
9dd616cb-3d36-4c5d-aa1d-60f1d17cf074	t	Kabarera	9e43e4a8-5d11-416f-867a-2327e3d2ccf3
8f1ee5aa-e6af-4bd2-8725-2e024aa678a3	t	Kamusengo	9e43e4a8-5d11-416f-867a-2327e3d2ccf3
94e92bb2-0696-48a1-ba85-bed5f5182944	t	Karekare	9e43e4a8-5d11-416f-867a-2327e3d2ccf3
08a2f93f-1b4b-45c7-9c71-73998e65c30c	t	Karuranga	9e43e4a8-5d11-416f-867a-2327e3d2ccf3
a34340ec-f162-4284-b0b8-ef3796240f56	t	Nyakabande	9e43e4a8-5d11-416f-867a-2327e3d2ccf3
7e007c5d-f2ec-4d51-a4db-6b47ecbb9b0c	t	Kabaliza	745b47ae-7f3d-4196-bdf7-bd44ed5d1480
80c0ba48-5bb1-453b-bf5d-afe18cf73c58	t	Nyamise	745b47ae-7f3d-4196-bdf7-bd44ed5d1480
098f2d28-0de8-4328-86da-d777dc2f9a52	t	Rwanyanza	745b47ae-7f3d-4196-bdf7-bd44ed5d1480
68e6c791-5cc4-45d2-b6a4-d1e33375bdee	t	Cyili	c7af1a7b-0d0b-49cf-9e59-04380e8a1625
bce536da-4c91-44a1-8431-ff885a2b12bd	t	Kacyatwa	c7af1a7b-0d0b-49cf-9e59-04380e8a1625
1fe9d3b8-2bc9-4b66-b4f6-66fd4df4aa39	t	Kandamira	c7af1a7b-0d0b-49cf-9e59-04380e8a1625
2200784f-88db-40b0-98ba-ddefd7293922	t	Kantabana	c7af1a7b-0d0b-49cf-9e59-04380e8a1625
0de0667c-47ae-4a96-a7b3-b6c914e3c44e	t	Munini	c7af1a7b-0d0b-49cf-9e59-04380e8a1625
d0fe0f19-3ffc-4608-86ae-c7b9f6a78f8b	t	Abanyangeyo	3503e128-81d1-49e3-a606-b19ca811aa24
b0fc8958-a13b-42d5-82c2-7c6f4d4f1b25	t	Kibenga	3503e128-81d1-49e3-a606-b19ca811aa24
88e59944-f125-44d0-9946-be9cdbcd3995	t	Nyamvumvu	3503e128-81d1-49e3-a606-b19ca811aa24
3e3f5bf9-043c-4cd4-b27d-93569ec20f86	t	Kamusare	48b9052b-a0c2-4622-b0ac-4941bb0316aa
a01367b8-f28c-4f54-a5c0-c94711d2c2df	t	Karwiru	48b9052b-a0c2-4622-b0ac-4941bb0316aa
36323566-1bf8-4819-b233-e177f22581cb	t	Kigabiro	48b9052b-a0c2-4622-b0ac-4941bb0316aa
4a25b2db-f929-408d-95ab-32096dcc1a51	t	Rukerereza	48b9052b-a0c2-4622-b0ac-4941bb0316aa
693af004-c6a9-4d75-9732-ea19eca2ac98	t	Rwintare	48b9052b-a0c2-4622-b0ac-4941bb0316aa
3b9c0b45-fb1c-424b-9af3-419cf939b30d	t	Gahanga	5111b16a-1d8b-4f61-ac3d-fad22d79e4b8
d5526cf4-1b3f-48ac-b315-decca2f95e74	t	Gatare	5111b16a-1d8b-4f61-ac3d-fad22d79e4b8
4cb02848-2afe-409c-bf33-cf76d0cb68e8	t	Gatovu	5111b16a-1d8b-4f61-ac3d-fad22d79e4b8
361099f3-a3cc-415d-9a04-e8fe60dfeb71	t	Rinini	5111b16a-1d8b-4f61-ac3d-fad22d79e4b8
a2370ba7-e2f6-4e8a-9e24-c3c561762508	t	Rwinanka	5111b16a-1d8b-4f61-ac3d-fad22d79e4b8
a085d30c-3afa-44b8-b209-e498dac390d5	t	Ubumwe	5111b16a-1d8b-4f61-ac3d-fad22d79e4b8
f5f70521-d17a-454f-b3c4-41489b207fa6	t	Kabeza	9d4abea4-7850-40e9-a04d-11806341fb5a
c672e387-4047-4f1b-9d66-64f2df1afeed	t	Kabidandi	9d4abea4-7850-40e9-a04d-11806341fb5a
b740d622-40b0-4179-98e9-ce791959e58f	t	Kiyanja	9d4abea4-7850-40e9-a04d-11806341fb5a
538fdd4a-2638-45c3-8a5b-d5df7e32caec	t	Nyacyonga	9d4abea4-7850-40e9-a04d-11806341fb5a
5196c4bd-6cb7-4751-a4ed-350344d8b8bb	t	Nyagafunzo	9d4abea4-7850-40e9-a04d-11806341fb5a
7b8e4678-80cb-4bdd-ae62-0dc7c24b8cc4	t	Nyakuguma	9d4abea4-7850-40e9-a04d-11806341fb5a
28c40200-253c-4b02-8194-eaa67a7cb23f	t	Rugando II	9d4abea4-7850-40e9-a04d-11806341fb5a
245df982-e6a6-4321-b3d0-d74900457446	t	Amahoro	834fac3a-68cd-4861-b685-32c5789b0eaa
0bbfe963-6d80-47e7-b4ee-9f0c8f2fb388	t	Bigo	834fac3a-68cd-4861-b685-32c5789b0eaa
3ec2a971-3702-425c-a132-6fc5da9a8e9c	t	Kabeza	834fac3a-68cd-4861-b685-32c5789b0eaa
7bf49d9a-3d82-4fa9-ae96-e28dadc3bd54	t	Kamuyinga	834fac3a-68cd-4861-b685-32c5789b0eaa
d50ba58e-791b-418c-947d-94cc988105db	t	Karembure	834fac3a-68cd-4861-b685-32c5789b0eaa
a72b4085-2051-4a5d-85d8-7e25205aec4a	t	Kimena	834fac3a-68cd-4861-b685-32c5789b0eaa
7f09b0cc-3839-4777-ac66-d36d7baa442b	t	Mubuga	834fac3a-68cd-4861-b685-32c5789b0eaa
076517a3-c962-4a31-87b6-667f20276ac7	t	Rwamaya	834fac3a-68cd-4861-b685-32c5789b0eaa
f04df420-1aba-4a7c-af38-8baa428af71e	t	Kampuro	1913a49d-3258-4d3f-ab98-197c46962e1a
0719978b-98d0-434f-9a8a-8a9d1083e58f	t	Kigasa	1913a49d-3258-4d3f-ab98-197c46962e1a
faf80ee4-148d-4819-b18c-3e5f50ad4ff2	t	Mashyiga	1913a49d-3258-4d3f-ab98-197c46962e1a
ea3b92d8-416b-48f7-b2d7-0a5181eecedc	t	Nyabigugu	1913a49d-3258-4d3f-ab98-197c46962e1a
ad954478-a96b-4efd-abf1-bc39625e545d	t	Nyamuharaza	1913a49d-3258-4d3f-ab98-197c46962e1a
1619c847-8af1-4f4c-b528-0e30cd486569	t	Rukore	1913a49d-3258-4d3f-ab98-197c46962e1a
2ce6e622-cc7d-4b52-b535-6903f60c07e7	t	Runyoni	1913a49d-3258-4d3f-ab98-197c46962e1a
11e366ec-c85f-4262-9e56-e83903fa773d	t	Sabununga	1913a49d-3258-4d3f-ab98-197c46962e1a
132edf4e-dfad-4519-9744-3ebd47808787	t	Kigarama	ece5314d-d371-4696-b070-b8c14ccc1f9d
fb0ab4d7-8647-47fe-b280-14a9ec24f4e7	t	Kinyana	ece5314d-d371-4696-b070-b8c14ccc1f9d
ed57758f-c953-418e-8aff-a1369f194e1c	t	Mugendo	ece5314d-d371-4696-b070-b8c14ccc1f9d
68cad59b-60f3-45d2-8939-9fce4c1fbc3e	t	Nunga I	ece5314d-d371-4696-b070-b8c14ccc1f9d
03610e1d-96a2-41df-b58b-14170c0e93d1	t	Nunga II	ece5314d-d371-4696-b070-b8c14ccc1f9d
a254adee-6708-427e-aa30-071bc732d5a0	t	Rugasa	ece5314d-d371-4696-b070-b8c14ccc1f9d
b000145b-e0c5-4a27-8775-a1fec104d6b4	t	Gahosha	c7d0004b-cf73-4aca-90b1-4b92ea8c964f
6a7ca6d4-cabb-4ea9-9cd4-a3b559a57a23	t	Gashubi	c7d0004b-cf73-4aca-90b1-4b92ea8c964f
39d3bebe-4c67-490d-b7d8-9b289171f246	t	Kaboshya	c7d0004b-cf73-4aca-90b1-4b92ea8c964f
83bdc66d-ab6c-45da-8aa2-6f56269313cf	t	Karambo	c7d0004b-cf73-4aca-90b1-4b92ea8c964f
4e90a0ec-b504-4c9a-980b-01d00c4da158	t	Rebero	c7d0004b-cf73-4aca-90b1-4b92ea8c964f
bcde0ecb-b7fb-48de-9481-63c64eb3ea58	t	Rugando I	c7d0004b-cf73-4aca-90b1-4b92ea8c964f
6cdf3da1-5f40-41ef-be52-9bbd52092086	t	Amahoro	25dda704-2d18-4de0-8a10-48cf64dd2619
df896cd6-af47-447a-afc1-cdc05efdf7fa	t	Gakoki	25dda704-2d18-4de0-8a10-48cf64dd2619
b1f8a7d2-6740-484a-b7f5-4ec7604a0273	t	Gatenga	25dda704-2d18-4de0-8a10-48cf64dd2619
25a95485-a3c1-4225-96c0-c114dc5aa929	t	Ihuriro	25dda704-2d18-4de0-8a10-48cf64dd2619
309f5a97-7453-473a-a811-3c86b440bde7	t	Isangano	25dda704-2d18-4de0-8a10-48cf64dd2619
f164b832-b76b-4fd6-81f8-f39ff4d23adb	t	Rugari	25dda704-2d18-4de0-8a10-48cf64dd2619
1ae5a93c-7148-46ff-b625-d78f1eb356be	t	Gwiza	bac895f1-e234-4c2a-9bc3-9cb6238aa203
98f5bce2-91fc-4998-bbf4-acd9084fdfec	t	Ihuriro	bac895f1-e234-4c2a-9bc3-9cb6238aa203
6f5b3585-c2ef-49a0-834c-2b8c2076b56a	t	Jyambere	bac895f1-e234-4c2a-9bc3-9cb6238aa203
cb91b93c-c48f-4254-b619-199652150903	t	Kamabuye	bac895f1-e234-4c2a-9bc3-9cb6238aa203
7ec31145-7e8f-4934-b52b-f5cfd48c6d22	t	Mahoro	bac895f1-e234-4c2a-9bc3-9cb6238aa203
5c5dfa7b-6c82-4ee7-b22b-b9608cb4bb44	t	Ramiro	bac895f1-e234-4c2a-9bc3-9cb6238aa203
1f15737b-e788-4e61-ab5d-c430a4b11051	t	Rebero	bac895f1-e234-4c2a-9bc3-9cb6238aa203
364c854e-357e-4896-b57f-525f31003a9b	t	Rugwiro	bac895f1-e234-4c2a-9bc3-9cb6238aa203
4214a744-0fbf-463f-bdc3-cb437a878301	t	Ruhuka	bac895f1-e234-4c2a-9bc3-9cb6238aa203
d524cd0d-7e44-479e-b737-2deb4f6794e6	t	Sangwa	bac895f1-e234-4c2a-9bc3-9cb6238aa203
b53162e3-21e0-4f7e-b33c-18ac894543a7	t	Bwiza	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
6e5f970e-cc18-4b10-b805-7c175c1efac8	t	Cyeza	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
ae4492e9-e8d6-4b24-936b-78819dcfe5dc	t	Gasabo	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
cd504dd0-b6db-485a-9cf5-f4d7f9180217	t	Ihuriro	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
72dddbff-5ae4-4f7d-93ba-03455a95dc11	t	Isonga	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
b36fa61f-1d61-4b97-805a-b68ebb2855ba	t	Juru	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
952d3acf-2327-4299-9ccf-9cdd10f957e4	t	Marembo	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
fd437f48-d14e-4bf5-9d16-119d601d9068	t	Murambi	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
9eb4cf62-b254-43e9-86a2-25670c99ba9f	t	Nyanza	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
e42864c0-80d1-4cf5-b8b8-eac9f23f59ee	t	Rebero	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
5fc55913-fdfe-4f6f-83fe-c0a45005d505	t	Rusororo	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
cb456653-8287-492d-bba3-53ea1c722b2d	t	Sabaganga	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
66ad526d-7941-4c89-b3d2-0f539fafc868	t	Taba	ac6edb10-3d5e-4a79-a4ac-4d92b8edbc79
e699b687-025e-4bf5-9a6a-d829e4c78e60	t	Bigo	c4932dbf-f249-4805-87e4-90b916443139
60c4d641-a7c8-472b-96c9-05241f1fd467	t	Bisambu	c4932dbf-f249-4805-87e4-90b916443139
0cec8b1c-1cc3-4cce-a66b-d020bbc131aa	t	Kabeza	c4932dbf-f249-4805-87e4-90b916443139
c20d5594-eb3c-400a-abea-39c28b03bdf5	t	Nyabikenke	c4932dbf-f249-4805-87e4-90b916443139
4f8b0010-d724-43d7-8958-3b28e3a8a099	t	Gatare	c6a7032a-c783-4f78-8528-0eb994cf8714
feba809e-edb3-443d-8069-0c4ed87ed044	t	Kabuye I	c6a7032a-c783-4f78-8528-0eb994cf8714
147ef41b-48e3-4923-9a80-2f06fff999e7	t	Kabuye II	c6a7032a-c783-4f78-8528-0eb994cf8714
cb07a1b7-9800-48e5-aff8-f7a90f0474b4	t	Kagunga I	c6a7032a-c783-4f78-8528-0eb994cf8714
df74603b-1b92-4c6d-a7c8-0f1b32bb312f	t	Kagunga II	c6a7032a-c783-4f78-8528-0eb994cf8714
a988eec5-9988-4984-be0d-bd943f84635d	t	Rebero	c6a7032a-c783-4f78-8528-0eb994cf8714
14b8e607-3334-4ee1-ae19-1813274066bf	t	Kanserege I	f1c6078b-2004-4c7a-8764-68d2a40db1cd
ffb2539a-dc74-42f5-b749-a1fa34e797f1	t	Kanserege II	f1c6078b-2004-4c7a-8764-68d2a40db1cd
025074ac-925a-445a-8c25-14173dbf99b1	t	Kanserege III	f1c6078b-2004-4c7a-8764-68d2a40db1cd
da993e26-3bd5-4929-b3bb-f8c1c0b81431	t	Marembo I	f1c6078b-2004-4c7a-8764-68d2a40db1cd
ddd09a74-a300-4a82-8e36-3d917f23d379	t	Marembo II	f1c6078b-2004-4c7a-8764-68d2a40db1cd
c6e5eec0-354b-409d-bb9f-c025857bf55d	t	Marembo III	f1c6078b-2004-4c7a-8764-68d2a40db1cd
5063a685-5722-4294-bcca-0d3c4261694a	t	Kigugu I	a5800276-f729-46bd-b830-6c9f32ba0472
f27f7df7-cb31-4027-ba9f-a73bbd33a921	t	Kigugu II	a5800276-f729-46bd-b830-6c9f32ba0472
c28a9922-7c1e-4686-ae87-fcfd79498205	t	Kigugu III	a5800276-f729-46bd-b830-6c9f32ba0472
67427d6c-a759-494c-8b84-bb60a1c6199d	t	Kinunga	a5800276-f729-46bd-b830-6c9f32ba0472
8e0d6dc8-0389-4039-bba2-df399e99c4cc	t	Ruganwa I	a5800276-f729-46bd-b830-6c9f32ba0472
ab4d159d-8e8a-40ff-b247-c640eb9f6060	t	Ruganwa II	a5800276-f729-46bd-b830-6c9f32ba0472
26385e6d-2267-4aa6-82e0-57fa366fbea2	t	Ruganwa III	a5800276-f729-46bd-b830-6c9f32ba0472
12e48f4c-8f99-4af5-8802-05834792b6c4	t	Bwiza	8b4940b6-0bcd-44e9-8fa9-acbd544b6a46
37a85dbe-af05-452d-a5d2-4f23a3348745	t	Byimana	8b4940b6-0bcd-44e9-8fa9-acbd544b6a46
f428d03f-b850-4cef-99bf-2158d899cb67	t	Ituze	8b4940b6-0bcd-44e9-8fa9-acbd544b6a46
0d58076d-05e0-4f5a-bb58-954b90c5b668	t	Kanserege	8b4940b6-0bcd-44e9-8fa9-acbd544b6a46
f54ba407-1a54-49f9-ae0e-39c315e2aaf6	t	Kinunga	8b4940b6-0bcd-44e9-8fa9-acbd544b6a46
973e4650-c47b-44c9-ab9f-301399a7d640	t	Kamuna	1c4ea082-386f-4c68-95ea-1f89ebbc95e3
e7d6ef75-814f-4fc3-91d7-bf325b346e9e	t	Mugeyo	1c4ea082-386f-4c68-95ea-1f89ebbc95e3
8c21cacd-ab27-4a36-90e4-d649c7cfdb82	t	Muyange	1c4ea082-386f-4c68-95ea-1f89ebbc95e3
c86ef52b-580a-47d7-ba48-e0a24226cdb6	t	Rugunga	1c4ea082-386f-4c68-95ea-1f89ebbc95e3
262093b3-740a-4351-9d9d-98850a3b8a12	t	Inshuti	97b86bc1-da69-4b6d-a2c5-22cd1da0604b
9fb6dada-1b25-4627-bea9-b22282a17784	t	Mpingayanya	97b86bc1-da69-4b6d-a2c5-22cd1da0604b
add5df95-9a3f-408f-b638-51fe4ae478d4	t	Nyacyonga	97b86bc1-da69-4b6d-a2c5-22cd1da0604b
4b044d22-7a48-4257-b060-1cb1a972a2f9	t	Nyanza	97b86bc1-da69-4b6d-a2c5-22cd1da0604b
bf874892-4d4e-4cab-bb87-96b7e8aedc0a	t	Rukatsa	97b86bc1-da69-4b6d-a2c5-22cd1da0604b
45db6ee3-2753-4a1c-9a32-c699e0ae4d3b	t	Taba	97b86bc1-da69-4b6d-a2c5-22cd1da0604b
5e22717a-8d08-4597-b709-ef2e635f075b	t	Amahoro	60afba48-cc47-433a-86e0-4355137af6ca
8a9509a7-6f38-4966-9a2c-f0b2ba93c7b4	t	Antene	60afba48-cc47-433a-86e0-4355137af6ca
a4c7b526-1315-4886-9389-b109760cd4e1	t	Bamporeze I	60afba48-cc47-433a-86e0-4355137af6ca
7fe3baa1-7a02-428f-965f-b08b76671088	t	Bamporeze II	60afba48-cc47-433a-86e0-4355137af6ca
5c7514f5-cba5-4465-a741-e7c0d37b1b6e	t	Gashyushya	60afba48-cc47-433a-86e0-4355137af6ca
8e10a843-17e2-45d4-9fe5-2179130cce67	t	Gishikiri	60afba48-cc47-433a-86e0-4355137af6ca
a97ae1f4-9ecf-49ff-9e50-639ab71a3c62	t	Hope	60afba48-cc47-433a-86e0-4355137af6ca
35667211-4236-44d2-be70-745548e58a39	t	Kariyeri	60afba48-cc47-433a-86e0-4355137af6ca
5ee29b27-258a-4955-9b30-3e6f8c04df93	t	Nyarugugu	60afba48-cc47-433a-86e0-4355137af6ca
72ef6552-b52c-4ea8-86c4-44bf567bce3b	t	Radari	60afba48-cc47-433a-86e0-4355137af6ca
fdd7ca95-9a67-44e6-9b3a-79b19d5c3dbc	t	Rukore	60afba48-cc47-433a-86e0-4355137af6ca
494248b6-78ae-46ee-87e1-49972b99f49c	t	Akagera	068bed37-0668-412b-9368-1a050e4b0dea
a0dc01a8-c7cc-412c-bd3c-fd3e8b1a69ec	t	Bwiza	068bed37-0668-412b-9368-1a050e4b0dea
f4b10871-4f0f-4121-8e2e-acf237026666	t	Gasabo	068bed37-0668-412b-9368-1a050e4b0dea
3ecb1c1a-0e50-4a36-af37-18e685993066	t	Giporoso I	068bed37-0668-412b-9368-1a050e4b0dea
3e48527e-dc4f-42d1-a652-898f0cc09e1d	t	Giporoso II	068bed37-0668-412b-9368-1a050e4b0dea
dfb47dc9-0b1e-4784-aec2-479fc8a79056	t	Juru	068bed37-0668-412b-9368-1a050e4b0dea
e8c9aac3-fe6b-43f1-b9d0-4304fa010a63	t	Kabeza	068bed37-0668-412b-9368-1a050e4b0dea
3a39ea33-e2cd-4429-b214-6e354b25c0a8	t	Karisimbi	068bed37-0668-412b-9368-1a050e4b0dea
991c66c4-5921-480f-8719-2d23485ec1b8	t	Muhabura	068bed37-0668-412b-9368-1a050e4b0dea
eee011e8-3147-4bcc-849c-a16375639157	t	Mulindi	068bed37-0668-412b-9368-1a050e4b0dea
377b7087-7f0d-48e5-b3ad-2e15e99e4242	t	Nyarurembo	068bed37-0668-412b-9368-1a050e4b0dea
37d20c8d-130e-4384-bbdf-dc9d5e7ffd22	t	Nyenyeri	068bed37-0668-412b-9368-1a050e4b0dea
aa8bfb3f-a241-44d1-86af-ff01db11598f	t	Rebero	068bed37-0668-412b-9368-1a050e4b0dea
15d7b1f2-3cd4-432f-a8f6-8a4eaab6b82e	t	Bitare	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
142434dd-6b74-48c3-9a4b-b6b4f19140f4	t	Byimana	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
393bff27-b973-4c94-9cca-5b6edd3e8d36	t	Cyurusagara	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
70f0a19a-e7c6-4bad-9cda-b2742acc798d	t	Gakorokombe	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
dd6dc2f9-d281-49d0-bad4-803a0f49533c	t	Gikundiro	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
43f29956-6c54-42c9-8409-8e9819ef5d50	t	Gitarama	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
fafac8f5-b950-42d5-a38d-404b0a14f46b	t	Karama	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
c9f53973-8c12-48aa-b3aa-a6df6f3cb145	t	Nyabyunyu	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
f00bf970-c769-4c77-afe9-fa63af2c25bb	t	Nyarutovu	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
a3151ed8-606f-4209-9d08-1549541cd67d	t	Urukundo	2b02dcb0-b0ff-4f4d-bc33-69ed9920f291
4ec129ab-90cc-4cd2-844e-3c7846d13e34	t	Beninka	203b64e1-78ec-4ecd-b425-aa64b133fed0
c7ceb1e0-d414-49be-bd0c-c89e140c352e	t	Bukunzi	203b64e1-78ec-4ecd-b425-aa64b133fed0
a49e889e-034d-4384-a00f-406167b7e540	t	Cyeru	203b64e1-78ec-4ecd-b425-aa64b133fed0
6ae299fc-77f2-4cb5-b227-cc585739d2c7	t	Intwari	203b64e1-78ec-4ecd-b425-aa64b133fed0
e3a1f16f-983b-4492-a445-0282d2f36e3b	t	Itunda	203b64e1-78ec-4ecd-b425-aa64b133fed0
053fc1ae-7d4e-4183-9e30-7680bae11c68	t	Kavumu	203b64e1-78ec-4ecd-b425-aa64b133fed0
91ce86f1-18df-4c8d-8ec1-5ad4b347eefc	t	Susuruka	203b64e1-78ec-4ecd-b425-aa64b133fed0
531c1e64-d832-42a6-b9b9-8cfbaf65fe35	t	Ubumwe	203b64e1-78ec-4ecd-b425-aa64b133fed0
178d2650-11bc-4d3e-84ee-443f83e580af	t	Umunara	203b64e1-78ec-4ecd-b425-aa64b133fed0
c72d79a0-c4c2-4d69-9e0e-612894c0a7b8	t	Uwabarezi	203b64e1-78ec-4ecd-b425-aa64b133fed0
fe9972ad-9c8d-4078-b242-dd9d65a1c48a	t	Zirakamwa	203b64e1-78ec-4ecd-b425-aa64b133fed0
821ac4e0-6701-4f91-9e66-4ad8d9aab589	t	Amajyambere	6c7853d4-8543-41f9-9c78-f3a58b9cf802
22ef5262-ef01-4fdf-8740-997ca723d396	t	Gasharu	6c7853d4-8543-41f9-9c78-f3a58b9cf802
dd3d67f1-a390-4950-8be8-06de5420a036	t	Sakirwa	6c7853d4-8543-41f9-9c78-f3a58b9cf802
69693335-d113-4c7f-b5e0-c524482bf115	t	Umunyinya	6c7853d4-8543-41f9-9c78-f3a58b9cf802
f5ae9f9b-0ae8-44f1-8349-9568fb193762	t	Gashiha	29a87583-acb7-4057-9fd6-f0afea7a68c1
1abbdaf8-9d59-4e85-9d83-32da78844a01	t	Iriba	29a87583-acb7-4057-9fd6-f0afea7a68c1
1c6d0ef5-6d71-489a-80dc-6c03e3675536	t	Multimedia	29a87583-acb7-4057-9fd6-f0afea7a68c1
b81c9d6a-c435-4d6c-9edc-1abe2b5b6739	t	Umunyinya	29a87583-acb7-4057-9fd6-f0afea7a68c1
873e3c56-8c7f-43df-81b1-32342b56dc2b	t	Umuremure	29a87583-acb7-4057-9fd6-f0afea7a68c1
72e999f0-3d25-44b3-b9bd-d1e2a6cf5a8d	t	Urugero	29a87583-acb7-4057-9fd6-f0afea7a68c1
f4def5c8-a6f2-4324-9561-9b5eeec3e0cd	t	Gasave	dfb56bac-533a-430f-ae2e-b6d65ef9c75d
0768349a-dfbe-4e8c-89ab-7bb6011c139b	t	Isoko	dfb56bac-533a-430f-ae2e-b6d65ef9c75d
14fa6ed8-e182-43ea-a27f-81475cf68fa7	t	Karisimbi	dfb56bac-533a-430f-ae2e-b6d65ef9c75d
339c9de6-c618-4f22-93a6-604481c6af7c	t	Kicukiro	dfb56bac-533a-430f-ae2e-b6d65ef9c75d
936cd365-4509-4ad1-89c6-116007663e72	t	Triangle	dfb56bac-533a-430f-ae2e-b6d65ef9c75d
5917bcbf-80c0-4f1a-95b9-2a011de57146	t	Ubumwe	dfb56bac-533a-430f-ae2e-b6d65ef9c75d
95fb0529-1c25-4684-b643-4d48c999aa3b	t	Ahitegeye	ed8d0204-e3f6-477d-b7da-84e686048e1d
f9748630-e829-468a-8566-1e7cdd64a373	t	Intaho	ed8d0204-e3f6-477d-b7da-84e686048e1d
c01fab95-e017-40ee-b9b7-8e427da6a16e	t	Iriba	ed8d0204-e3f6-477d-b7da-84e686048e1d
50de7cb0-37a8-473b-9248-5ba84c9edd88	t	Isangano	ed8d0204-e3f6-477d-b7da-84e686048e1d
932e8c74-59d1-4d45-8efe-768375175147	t	Urugero	ed8d0204-e3f6-477d-b7da-84e686048e1d
3882e057-26f6-40b4-8450-c45cfe906462	t	Gakokobe	67997263-a6d4-4c97-a001-c09c827bcfd2
ba01f429-4260-43a0-8534-8b6a402088fc	t	Gatare	67997263-a6d4-4c97-a001-c09c827bcfd2
c020c50e-9ef1-4222-9ac5-b2f0ba3e0848	t	Imena	67997263-a6d4-4c97-a001-c09c827bcfd2
562628ed-8394-4cac-86f4-32e77e337c64	t	Ituze	67997263-a6d4-4c97-a001-c09c827bcfd2
3c7db100-c805-4ef8-acad-04135b421f76	t	Kabutare	67997263-a6d4-4c97-a001-c09c827bcfd2
618d95c4-d451-4a76-b6f3-dba0d74aacb5	t	Kimisange	67997263-a6d4-4c97-a001-c09c827bcfd2
7a87c08b-67c7-47b6-b49f-a649f81ca1fc	t	Nyenyeri	67997263-a6d4-4c97-a001-c09c827bcfd2
39b5292e-3f1c-4e5d-bd7b-abf9dfcf05dd	t	Ubumenyi	67997263-a6d4-4c97-a001-c09c827bcfd2
b7452988-bf10-4f12-ab79-0d26b261eb8f	t	Ibuga	2811c4a6-cd71-43f4-943e-30973b115c29
616c85b9-d7ed-467a-b789-27df4bec9023	t	Ihuriro	2811c4a6-cd71-43f4-943e-30973b115c29
a2554388-30d4-47ed-a978-b837211b2551	t	Murambi	2811c4a6-cd71-43f4-943e-30973b115c29
7ec398f5-a2fb-4092-80bf-f20ce3f5b883	t	Rutoki	2811c4a6-cd71-43f4-943e-30973b115c29
bc6a7d59-d4b1-4950-a03d-f36e7eb5c64f	t	Taba	2811c4a6-cd71-43f4-943e-30973b115c29
a2f25826-ac37-44b3-a74f-3a1c34a51e54	t	Terimbere	2811c4a6-cd71-43f4-943e-30973b115c29
33df6709-d7a5-43cc-87e0-79901578c8e2	t	Ubutare	2811c4a6-cd71-43f4-943e-30973b115c29
db7cf30f-d190-4567-9adf-12833656cc68	t	Umurimo	2811c4a6-cd71-43f4-943e-30973b115c29
6490cc01-cc6c-4293-8cde-9f2dd768c634	t	Akimana	513509b5-5eb7-4521-bb6c-65b60dc22834
501bd44c-24dd-4e8a-b169-4945c13ce865	t	Amahoro	513509b5-5eb7-4521-bb6c-65b60dc22834
77d9e785-d071-4dcd-865a-54e9e1767060	t	Byimana	513509b5-5eb7-4521-bb6c-65b60dc22834
370a872e-2dcc-4282-b510-6b8cbee3f8d7	t	Indatwa	513509b5-5eb7-4521-bb6c-65b60dc22834
f02a586f-5c1d-4313-98e4-9e63344e9c6f	t	Ingenzi	513509b5-5eb7-4521-bb6c-65b60dc22834
86fdbbd5-a3c9-436e-8b00-913d75bedd07	t	Kabeza	513509b5-5eb7-4521-bb6c-65b60dc22834
2d282e6d-4d60-4cec-9fde-79306594b50a	t	Karurayi	513509b5-5eb7-4521-bb6c-65b60dc22834
d35020c1-e748-42c7-b117-7c5265ca4d70	t	Mataba	513509b5-5eb7-4521-bb6c-65b60dc22834
8ee4d9ed-0f0b-4782-b94a-94539eb4c466	t	Umucyo	513509b5-5eb7-4521-bb6c-65b60dc22834
814fe06f-c3d6-4b5e-a4db-db1e59112935	t	Kamabuye	3d6b88fb-b979-46ca-8efa-220a95e2a3a6
ad6cd8a3-5207-4af3-9710-a37f3103904f	t	Karuyenzi	3d6b88fb-b979-46ca-8efa-220a95e2a3a6
4b66ceb4-e884-4534-ae2b-8e93d03131d3	t	Kivu	3d6b88fb-b979-46ca-8efa-220a95e2a3a6
f2785d09-8306-4cb7-b9a0-be4161f0e2e8	t	Rebero	3d6b88fb-b979-46ca-8efa-220a95e2a3a6
5fb39960-5bad-4312-abb1-b084690e4373	t	Twishorezo	3d6b88fb-b979-46ca-8efa-220a95e2a3a6
37fa3b5e-8827-4296-ba86-c6a352a2392b	t	Zuba	3d6b88fb-b979-46ca-8efa-220a95e2a3a6
192895d3-e28b-4f39-a81f-03389e990213	t	Amajyambere	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
86fe5236-3192-4ddb-b42c-db8d5dd29c5b	t	Bwiza	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
b685cf58-bf7e-4cce-8a02-254be6f4b30f	t	Nyarurembo	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
b5abb5e1-ca6f-4a12-9076-6de3e4f0eabf	t	Ubumwe	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
ea273271-8955-4fb1-8c8e-87a0ec6ecc53	t	Umutekano	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
044a22bc-7caf-4685-b54f-e6f094cf45d8	t	Urumuri	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
a61df8ec-ec3e-4ae9-9113-82fc8e604642	t	Uwateke	69d52d7f-a9e6-4f94-8835-9dfc41fd7e7a
3c4428ab-4ac9-4d1c-a04f-db203c038a30	t	Kababyeyi	b7c68b21-4c82-4578-9c7a-19e766b8ed47
bc94695e-7b4c-4335-8c76-095d8d0e6ca5	t	Ayabaraya	b7c68b21-4c82-4578-9c7a-19e766b8ed47
2385f556-c5dc-46d7-9ddb-569e60ba3240	t	Nyamico	b7c68b21-4c82-4578-9c7a-19e766b8ed47
2b902a93-bd3e-4786-8944-e6acd0d01b18	t	Nyamyijima	b7c68b21-4c82-4578-9c7a-19e766b8ed47
02907c62-dde9-41ff-adc5-f17128858ff1	t	Nyirakavomo	b7c68b21-4c82-4578-9c7a-19e766b8ed47
4f179600-6482-488e-a993-8bc0eb0f6ef9	t	Rususa	b7c68b21-4c82-4578-9c7a-19e766b8ed47
6c97dfa1-b454-47cc-b7c5-2563be57caf1	t	Biryogo	32951129-bb87-403c-b6d1-97a43ba06ea2
70250b07-b68c-46b9-b052-503a0c3e193b	t	Bwiza	32951129-bb87-403c-b6d1-97a43ba06ea2
0385ed51-e5ea-46f3-b2a1-62b6d305f30f	t	Cyimo	32951129-bb87-403c-b6d1-97a43ba06ea2
913cfbb9-654a-49a4-8a4d-78ab4db39230	t	Kabeza	32951129-bb87-403c-b6d1-97a43ba06ea2
237959f8-5789-481c-aa30-af9d784afe87	t	Kiyovu	32951129-bb87-403c-b6d1-97a43ba06ea2
9c0bf839-7121-4e7d-a6be-0597cf46811a	t	Masaka	32951129-bb87-403c-b6d1-97a43ba06ea2
e0e38b76-7e2b-4f06-b58f-d7039dc85a57	t	Murambi	32951129-bb87-403c-b6d1-97a43ba06ea2
49dd5f8c-89f8-4c4c-8464-955b62497689	t	Nyakagunga	32951129-bb87-403c-b6d1-97a43ba06ea2
d5f895e3-bbbb-42b6-a5e5-50594bb14a97	t	Urugwiro	32951129-bb87-403c-b6d1-97a43ba06ea2
1bfd6cb6-5a43-4682-8d72-e44d85f7e058	t	Bamporeze	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
2006d840-1bdd-4501-a160-b7a9c7a7bd38	t	Butangampun	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
8c23d968-4af8-47da-9367-6122180d3df4	t	Butare	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
39199baa-5022-4420-b19f-4722bad50671	t	Cyugamo	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
64a50f38-d0a9-449b-ab6a-9ea171e14c98	t	Gicaca	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
55938462-e964-4c9f-89b2-493f17b96ed2	t	Gihuke	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
d91dde04-aeb3-4dcf-9e3f-017717ec8733	t	Kabeza	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
fb5b8286-44da-473d-970a-1fa6dab74f45	t	Kibande	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
108e0481-21e5-4d74-afdb-da27e3f75bf0	t	Rebero	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
34f936fb-00d0-4735-b508-0052e95cc4c1	t	Rugende	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
5b0dd381-688c-4719-b805-af2fd3ddc6d5	t	Ruyaga	f73d4083-91ae-4e37-8fd1-3183b16fe4c1
9e9f2f6e-4847-4f1a-92f1-6474a0b1b85b	t	Gitaraga	b60e2436-9b18-41e9-b12e-0b0232821128
936c7987-7bc3-4052-b9ef-35613a0e2b0e	t	Kabeza	b60e2436-9b18-41e9-b12e-0b0232821128
2dd29946-0284-4598-9f5e-55717cd81ca0	t	Kajevuba	b60e2436-9b18-41e9-b12e-0b0232821128
496ade95-e808-4bf6-8bf0-17d318018de9	t	Nyakarambi	b60e2436-9b18-41e9-b12e-0b0232821128
f4420386-02a7-41e9-a012-2d5987c03e9a	t	Nyange	b60e2436-9b18-41e9-b12e-0b0232821128
1ad0c247-b5ac-4f01-8c0a-2709d803db84	t	Ruhanga	b60e2436-9b18-41e9-b12e-0b0232821128
18459392-4317-4626-96b4-ec4ddd315c49	t	Rwintare	b60e2436-9b18-41e9-b12e-0b0232821128
617c2798-e5c4-4acc-b058-c6c3ba10591c	t	Kabeza	dc0a45fd-387c-4215-8627-f2bcf8e154b2
9deba73d-5abb-4cad-8158-a42503a42cee	t	Kamashashi	dc0a45fd-387c-4215-8627-f2bcf8e154b2
1ddec7fa-770e-4a57-a4d8-434bd4e0470a	t	Mbabe	dc0a45fd-387c-4215-8627-f2bcf8e154b2
a81b565c-d7a6-4b49-865f-0d3c033509c2	t	Murambi	dc0a45fd-387c-4215-8627-f2bcf8e154b2
545be9ce-5659-42c3-8733-8626b19f601d	t	Ngarama	dc0a45fd-387c-4215-8627-f2bcf8e154b2
52c8085f-12de-44e3-ae05-2877bfbba10a	t	Sangano	dc0a45fd-387c-4215-8627-f2bcf8e154b2
f3108f2f-0ace-41b0-acd2-5cf6bfb2ddfe	t	Cyankongi	b410463c-9f8e-42a2-a482-0e3c86b24bd7
67630d14-c60b-4454-8c32-688582c97002	t	Cyeru	b410463c-9f8e-42a2-a482-0e3c86b24bd7
6b76753e-a419-4e19-b6a2-9efc441f0253	t	Gatare	b410463c-9f8e-42a2-a482-0e3c86b24bd7
46c865f9-1ff4-410d-955a-bc1a8bcda0b0	t	Kagese	b410463c-9f8e-42a2-a482-0e3c86b24bd7
98809ebe-d047-4c33-b6d4-7661170a0a7d	t	Kanyetabi	b410463c-9f8e-42a2-a482-0e3c86b24bd7
c5e95a88-3c6d-4580-84b3-8bb17750ff1d	t	Mubano	b410463c-9f8e-42a2-a482-0e3c86b24bd7
468998bf-4449-42f9-986c-b2db87487eef	t	Ruhosha	b410463c-9f8e-42a2-a482-0e3c86b24bd7
08a99491-b115-4af2-93ac-33c1a704c039	t	Byimana	6a42723b-c9bf-446f-8791-f82edd2da5d1
7cd1b96c-05b4-4416-a01d-2dec6dd57021	t	Gatare	6a42723b-c9bf-446f-8791-f82edd2da5d1
fab3e365-bd03-4ee8-b597-c805514efa1b	t	Imena	6a42723b-c9bf-446f-8791-f82edd2da5d1
36eb018f-5598-4d4d-a1bb-c0c07b3f9e7e	t	Kamahoro	6a42723b-c9bf-446f-8791-f82edd2da5d1
af62f629-0679-4335-97f2-b2b2a80a79bf	t	Kigarama	6a42723b-c9bf-446f-8791-f82edd2da5d1
4dd4cb20-649a-43bf-88d0-89c3a2d2ffc6	t	Rugunga	6a42723b-c9bf-446f-8791-f82edd2da5d1
4f11c1f6-17c2-4a88-97d1-2ce5314a8ec3	t	Rurembo	6a42723b-c9bf-446f-8791-f82edd2da5d1
2e64b6fe-606e-4412-8cc7-9a3e3329b8a1	t	Taba	6a42723b-c9bf-446f-8791-f82edd2da5d1
0e7426ad-4136-4e75-b8cf-779a3c4709a7	t	Buhoro	934c071c-2dae-48b1-89d1-494a70547c7e
a1c29c04-9b63-4d24-97d3-fce6f252bf17	t	Gaseke	934c071c-2dae-48b1-89d1-494a70547c7e
952abdbf-5c01-4484-be80-ccfb993a2215	t	Gateke	934c071c-2dae-48b1-89d1-494a70547c7e
39b7e1cd-bd6e-4b0c-bfc6-d4206e12d270	t	Gorora	934c071c-2dae-48b1-89d1-494a70547c7e
22edcc91-12a8-4b25-beb4-4bd93d593307	t	Kigabiro	934c071c-2dae-48b1-89d1-494a70547c7e
fe9bd5b4-7ac3-435f-bf43-fd637507c45f	t	Kinunga	934c071c-2dae-48b1-89d1-494a70547c7e
661fa15e-6988-4740-a95d-e862d5d34fae	t	Kiruhura	934c071c-2dae-48b1-89d1-494a70547c7e
a1b5bc5a-2fae-4cf4-82f3-5f0b46ddac16	t	Munini	934c071c-2dae-48b1-89d1-494a70547c7e
95afd5b9-72be-4451-b558-e649f68eb431	t	Murehe	934c071c-2dae-48b1-89d1-494a70547c7e
f9d21c19-e4e4-4385-8951-27ed41ce2886	t	Mwijabo	934c071c-2dae-48b1-89d1-494a70547c7e
7ecf1adf-ebe4-44f5-98c7-c6ef12b5f2bd	t	Mwijuto	934c071c-2dae-48b1-89d1-494a70547c7e
35d17cc9-9915-41b5-8278-074443bf962c	t	Nyarubande	934c071c-2dae-48b1-89d1-494a70547c7e
cd73fa9c-3267-475b-bd80-d0eed8981ea6	t	Rwezamenyo	934c071c-2dae-48b1-89d1-494a70547c7e
3450633f-f9b0-4d30-b070-89670d854eac	t	Sovu	934c071c-2dae-48b1-89d1-494a70547c7e
512cd37c-0833-4c44-9d6b-e3a3dd5dbf8a	t	Taba	934c071c-2dae-48b1-89d1-494a70547c7e
1dffd5d6-9d42-441d-baa5-e5e2bb2e77fa	t	Amahoro	905f7bd2-258d-4e4f-933e-8577d644df40
f33163f6-16b3-4b13-9735-8818b952e150	t	Amarebe	905f7bd2-258d-4e4f-933e-8577d644df40
0c36c300-7677-4457-b8a2-a68ea2497c8b	t	Amarembo	905f7bd2-258d-4e4f-933e-8577d644df40
c2c952d8-b4de-4666-855c-b419cde04461	t	Bigabiro	905f7bd2-258d-4e4f-933e-8577d644df40
90205911-266b-4e57-839a-359fb7d75712	t	Bukinanyana	905f7bd2-258d-4e4f-933e-8577d644df40
2f59f928-18be-46a4-87dd-7eeaef372278	t	Bumanzi	905f7bd2-258d-4e4f-933e-8577d644df40
a4df2b3c-baa5-4f90-b97f-bba6fa60de57	t	Bwiza	905f7bd2-258d-4e4f-933e-8577d644df40
9ff99cfc-d9d8-4295-b45f-153bf652c160	t	Gatsibo	905f7bd2-258d-4e4f-933e-8577d644df40
344ab4d0-22f9-4790-b30f-c651fab811e1	t	Gikundiro	905f7bd2-258d-4e4f-933e-8577d644df40
db598b9b-9978-46ab-9970-1d3384a6e07a	t	Indakemwa	905f7bd2-258d-4e4f-933e-8577d644df40
b468506a-12ca-4767-aedd-f978c9a54208	t	Indamutsa	905f7bd2-258d-4e4f-933e-8577d644df40
4d74321c-89b4-4155-88d6-313fdf5527db	t	Indatwa	905f7bd2-258d-4e4f-933e-8577d644df40
afb2b08d-6c64-4bc5-aba0-6d10eb8d9ea3	t	Inyarurembo	905f7bd2-258d-4e4f-933e-8577d644df40
84d60feb-7901-419f-a052-845520d9a553	t	Isangano	905f7bd2-258d-4e4f-933e-8577d644df40
08900169-c248-4757-9aa8-32a98289f2c8	t	Karama	905f7bd2-258d-4e4f-933e-8577d644df40
8a3194ba-3382-46c3-98d9-4061a13f8c33	t	Kinyana	905f7bd2-258d-4e4f-933e-8577d644df40
67a9419f-307f-45a5-922c-5abb0c2ab412	t	Rugwiro	905f7bd2-258d-4e4f-933e-8577d644df40
46646cf4-d2cf-47cf-a9b0-cc4d386f1aca	t	Umurava	905f7bd2-258d-4e4f-933e-8577d644df40
a9a9eb25-bbaa-4ff7-b9a5-527cab8150a2	t	Akindege	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
6000b27b-eeba-4728-b0a7-56978302c756	t	Indatwa	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
afd12922-5313-434d-b55e-c6b8485f53e5	t	Intwari	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
048d5d0c-50eb-4c26-a456-91d5d2b51dd4	t	Kabagendwa	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
af5cfcc0-57e9-40f4-933b-9446ab494cae	t	Kibaya	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
2f180358-7648-44f3-a425-6f3b6593488b	t	Mukoni	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
07f65479-6fe7-42f7-887a-5b5f3dd1867e	t	Mulindi	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
96d9746e-1a8d-4895-aaa2-3c9c0fdbaf77	t	Umucyo	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
8941e827-6fcc-428b-8379-bfaf0252b147	t	Uruhongore	1ffef69c-760b-4c4a-a0bc-8e91b5279bf0
df82130b-4061-49b8-b341-a073b214225f	t	Gasaraba	75706ee4-8bc3-4d7a-bffb-d503891d71bb
af5b5e9f-3166-45f8-86da-a9c723c706d5	t	Gihanga	75706ee4-8bc3-4d7a-bffb-d503891d71bb
b75960a5-60be-44d3-99af-b472b23a78c5	t	Gitara	75706ee4-8bc3-4d7a-bffb-d503891d71bb
cebf9729-00d1-45ff-8adc-8d4b99310f71	t	Kavumu	75706ee4-8bc3-4d7a-bffb-d503891d71bb
8645ccef-7ad7-48fb-ae53-97054027689a	t	Mahoro	75706ee4-8bc3-4d7a-bffb-d503891d71bb
c34f44e5-472c-4588-b464-db4f2a6c6c8f	t	Nyarutovu	75706ee4-8bc3-4d7a-bffb-d503891d71bb
e3c79b7a-d182-4a8a-9402-3bc1bf499954	t	Rugali	75706ee4-8bc3-4d7a-bffb-d503891d71bb
4e6177a9-53e8-4399-af4e-a6d766ce90c9	t	Runyonza	75706ee4-8bc3-4d7a-bffb-d503891d71bb
7e1f311b-7af2-4dbc-81c2-c0e14ce4b87f	t	Gabiro	3d8a0009-adce-45ac-b99b-3ef908e42783
c45b9d37-057c-4c7e-ad03-35054b782367	t	Kabaya	3d8a0009-adce-45ac-b99b-3ef908e42783
2e734e00-2b38-4722-bd9e-35f1f1b6e788	t	Kanogo	3d8a0009-adce-45ac-b99b-3ef908e42783
621c348a-6207-4340-b516-8bb6bca1a073	t	Marembo	3d8a0009-adce-45ac-b99b-3ef908e42783
05ade653-54cf-417f-9e83-8c8ac8bd6e9b	t	Umushumba M	3d8a0009-adce-45ac-b99b-3ef908e42783
044fb831-d983-4be3-b11a-73838125de38	t	Nyandungu	3d8a0009-adce-45ac-b99b-3ef908e42783
0044ba57-8e47-42cb-8c1b-10c801cd5c6a	t	Ruragendwa	3d8a0009-adce-45ac-b99b-3ef908e42783
957ebb3b-8972-425e-9c1e-734c0374664a	t	Rwinyana	3d8a0009-adce-45ac-b99b-3ef908e42783
b32c226d-b809-479c-a29e-8e7581ef0e85	t	Rwinyange	3d8a0009-adce-45ac-b99b-3ef908e42783
bc0ebed9-3470-4863-88c0-2b2625022cb3	t	Rwiza	3d8a0009-adce-45ac-b99b-3ef908e42783
9ffb14d8-1c80-425d-bf9a-98c1bf32d6d3	t	Urwibutso	3d8a0009-adce-45ac-b99b-3ef908e42783
a858a10d-f8fe-4e0d-9833-c0dd3f48d430	t	Gihanga	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
fc429820-daea-4e2e-bf19-c7c11bfb4f2d	t	Iterambere	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
e7a1d4f5-4d28-4be5-8bf6-4606c95ec546	t	Izuba	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
05ce7414-06c2-45b0-9cc5-50a7e7502c8e	t	Nyaburanga	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
6d653afd-8c86-4341-a180-9344358fae82	t	Nyenyeri	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
c01c24d4-a7c4-47b3-b3ff-b78e4ae489eb	t	Ubukorikori	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
71d362ff-c010-49cf-8d27-64a594b77af6	t	Ubumwe	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
a527546c-0585-40bc-97e5-eed14e8f040c	t	Ubwiyunge	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
11f10e25-a95b-4142-96b4-801e3893c562	t	Umucyo	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
7671a7f7-8e65-4432-8e78-d6e740d53c06	t	Umurabyo	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
1a34a08d-1bbf-4976-b6fe-88a1751af06a	t	Umuseke	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
1f414c73-a081-4924-a7c1-dae8db3d63b7	t	Vugizo	1c9882e8-3b7f-41d5-b8e2-f9d9a59dc210
74902ab3-47a9-413a-a40b-d1807ce04f73	t	Akinyambo	43df8faa-4fab-4fdc-8f89-f93a4acdf4b7
b1c771f1-f27e-4ca7-a916-4524716df858	t	Amayaga	43df8faa-4fab-4fdc-8f89-f93a4acdf4b7
357c8554-f3bc-40e9-ac7e-2b98e3eb9ae2	t	Gitwa	43df8faa-4fab-4fdc-8f89-f93a4acdf4b7
fa80fcca-0fa9-4dc8-8c4f-0ad0b6c98231	t	Ituze	43df8faa-4fab-4fdc-8f89-f93a4acdf4b7
345222dd-6803-4b20-838a-ad09094e8367	t	Mpazi	43df8faa-4fab-4fdc-8f89-f93a4acdf4b7
98a6069c-e7af-4f5b-af4a-9ae1e80b5ed5	t	Amahoro	058a60be-85f4-460b-98ef-e5aa801c0e9a
e22110e1-e868-45bc-bffb-8082745ff3f1	t	Impuhwe	058a60be-85f4-460b-98ef-e5aa801c0e9a
29564ac0-7b3b-4b43-854b-1bb527d52814	t	Intsinzi	058a60be-85f4-460b-98ef-e5aa801c0e9a
da9b1f67-a2d5-4fbb-974b-c0e3bce48303	t	Kivumu	058a60be-85f4-460b-98ef-e5aa801c0e9a
b3a7d908-3d6f-4a6f-8e04-a33ca2601c98	t	Ubumwe	058a60be-85f4-460b-98ef-e5aa801c0e9a
87e129c9-5e18-4ef8-9ff7-843383a55405	t	Urukundo	058a60be-85f4-460b-98ef-e5aa801c0e9a
f08b0473-fc8f-43f2-9f9d-709dcc748b67	t	Ururembo	058a60be-85f4-460b-98ef-e5aa801c0e9a
113cb415-060a-43aa-bf36-5d838f498a46	t	Ingenzi	f0b6257b-2888-4fdb-bbb2-b05d29b7080e
1653a961-edd0-47d1-bdfb-aadede575425	t	Sangwa	f0b6257b-2888-4fdb-bbb2-b05d29b7080e
e6404358-4c8b-432f-a8c5-056f702cf105	t	Umubano	f0b6257b-2888-4fdb-bbb2-b05d29b7080e
4b4aa355-101c-4f7b-b77a-bf7e4fc8c450	t	Umucyo	f0b6257b-2888-4fdb-bbb2-b05d29b7080e
21eaa26c-6a14-44d6-85e0-aa8b8d831fea	t	Umuhoza	f0b6257b-2888-4fdb-bbb2-b05d29b7080e
79ab4332-c32b-4263-b84f-56f2c72c1db9	t	Umurava	f0b6257b-2888-4fdb-bbb2-b05d29b7080e
2747603b-c250-4336-ac82-575853142ce8	t	Akabugenewe	439e41ec-7c1c-462d-b39e-5e6874809e05
32607e0a-ddb8-4a59-bed3-c74604f8772f	t	Ihuriro	439e41ec-7c1c-462d-b39e-5e6874809e05
461d88fd-8571-46ca-aaa8-f677141b634d	t	Isangano	439e41ec-7c1c-462d-b39e-5e6874809e05
f51845d9-0645-43e6-9633-b47870fc96d0	t	Isano	439e41ec-7c1c-462d-b39e-5e6874809e05
2bbc5c14-3e19-4292-b01a-05dd0f152fa4	t	Karitasi	439e41ec-7c1c-462d-b39e-5e6874809e05
6d8d32c3-a507-4cde-b2a1-8e478deb84d5	t	Ubumanzi	439e41ec-7c1c-462d-b39e-5e6874809e05
8ebaf47e-5fa6-4ad3-87ee-f7e92e6d9307	t	Uburezi	439e41ec-7c1c-462d-b39e-5e6874809e05
338a786b-fedb-43f9-886e-95453390683b	t	Ubwiza	439e41ec-7c1c-462d-b39e-5e6874809e05
ea8dbc68-60ec-4542-a1c6-16989ffee1de	t	Umucyo	439e41ec-7c1c-462d-b39e-5e6874809e05
071b0226-9e87-41da-9f5a-e590d13bd937	t	Umwembe	439e41ec-7c1c-462d-b39e-5e6874809e05
e4a29615-bb03-4a37-a46c-ca4b1d289152	t	Urugano	439e41ec-7c1c-462d-b39e-5e6874809e05
78a08999-848d-4702-bc41-66f930652bc0	t	Isangano	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
627c3df0-4ad7-46d4-b944-95350713cd76	t	Kanunga	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
45ff0f30-401f-4a52-82f7-4b3b5267639d	t	Kinyambo	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
bd9cbbc9-3906-4146-8762-d7926085b3f3	t	Kivumu	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
97e37b9b-5e45-4c70-ad97-35d5de3ab99c	t	Kora	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
49bf8406-29d4-46fd-a264-f5f5b9ecd2fb	t	Mpazi	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
c6cd9483-bea3-46d3-bbc3-fc26c1a723f7	t	Rugano	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
735f4b64-9c3a-41e2-8aca-60713a2d7f55	t	Rugari	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
32dfc9e4-cad2-4962-9056-b413ce643cb6	t	Ubumwe	a404e92a-b1fe-4de9-bbd8-f56ff4f05b0b
62ba703d-81f8-41f6-90fd-7426c647853f	t	Bwimo	94feecd5-c53c-4c51-9580-954e073b41c5
71200e9b-3897-41fd-9e29-9514bc3efe2c	t	Gatare	94feecd5-c53c-4c51-9580-954e073b41c5
38080c1d-7816-4bf8-9f66-6060b491095a	t	Mubuga	94feecd5-c53c-4c51-9580-954e073b41c5
4ed05488-e38a-4384-b2a5-cfbdda95f519	t	Nyakirambi	94feecd5-c53c-4c51-9580-954e073b41c5
1793e176-487b-4bca-a2d4-7857268e2fd3	t	Nyamweru	94feecd5-c53c-4c51-9580-954e073b41c5
9f50435b-330e-481b-a9ac-059c7e7775f0	t	Ruhengeri	94feecd5-c53c-4c51-9580-954e073b41c5
030ea63c-ed8d-4d73-a499-5fe9f1761711	t	Bibungo	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
04ac4628-f196-4714-abfa-538cd2858277	t	Bwiza	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
7698704a-23d6-4f0c-9271-fc07fa740e11	t	Gateko	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
5c618cfa-a1ac-4113-bd20-75a66f43b38f	t	Kagasa	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
59f9739d-9446-4a27-8eee-d1f497812062	t	Nyabihu	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
398411c8-060b-469d-9614-d403582e8011	t	Rutagara I	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
de078cb7-4a18-43ae-b457-e47e3cc28cc6	t	Rutagara II	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
d3b1fe61-84f6-4747-950c-9c2a449062b5	t	Ruyenzi	4bedd313-c61e-4ac4-ac4c-0cfe373cc54c
f1b5f34f-c5a3-4459-afcb-bfcbb25c0cc9	t	Kagaramira	4ab06f0a-34ff-454c-9647-7ab6216651d1
b35617a1-278c-4d0a-968e-5d02c3f1a589	t	Ngendo	4ab06f0a-34ff-454c-9647-7ab6216651d1
9afc9761-9ef9-4100-b135-9b22166124d8	t	Nyarurama	4ab06f0a-34ff-454c-9647-7ab6216651d1
a712a6d3-08ae-4a34-ac4a-51959a30d6aa	t	Nyarusange	4ab06f0a-34ff-454c-9647-7ab6216651d1
02f6661a-a355-4b3b-9840-e58da6629c63	t	Rwakivumu	4ab06f0a-34ff-454c-9647-7ab6216651d1
837d2e1f-a02b-4034-adf7-b025cc286a89	t	Taba	4ab06f0a-34ff-454c-9647-7ab6216651d1
b05b940b-64db-4d22-92d3-c074f71dd0af	t	Akirwanda	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
670d7772-8617-44f6-b132-d494c984e5e1	t	Gisenga	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
2bd49246-b021-4c99-90ad-5a9dc80a7a9a	t	Kadobogo	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
876fbf9c-e319-4050-9f39-ac8cbca218a6	t	Kagarama	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
cf625c19-8fa1-43e8-8ac0-b963dc6e0b17	t	Kibisogi	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
15c28ff7-68aa-4a11-9f47-e85502f4f8aa	t	Muganza	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
07c3be30-62c9-4e73-b0b9-b60a07df5fb2	t	Murama	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
105910e9-b4bd-4c53-8455-b8b37d02d629	t	Rubuye	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
389871db-565e-48e7-9ba0-c503aeb16846	t	Ruhango	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
c6dcbe3b-911e-4a91-b0b5-e801cee4214d	t	Ryasharangabo	3e012ba5-4e8c-4cf1-b7a5-030c62aca126
23f27f32-ffcb-404a-9bf5-4e051cc95c0f	t	Agakomeye	af7dbb52-0bce-4986-810c-eac884888d74
6213be5d-b7bc-4cd9-be62-aed913990cb5	t	Akagugu	af7dbb52-0bce-4986-810c-eac884888d74
0a0f9f62-37f5-4d2a-b9c8-50d9cc621e0a	t	Amahoro	af7dbb52-0bce-4986-810c-eac884888d74
8dfecf9e-fed5-4847-b83e-c0d18578c3d0	t	Amajyambere	af7dbb52-0bce-4986-810c-eac884888d74
f25e6677-c4fb-4b55-90f9-fb647d0a6604	t	Birambo	af7dbb52-0bce-4986-810c-eac884888d74
8e967b25-c05f-4ae4-9e9f-d736cf1a7064	t	Isangano	af7dbb52-0bce-4986-810c-eac884888d74
2f07d755-43d5-45cc-82cd-f1b569871329	t	Kanyabami	af7dbb52-0bce-4986-810c-eac884888d74
fa9629b9-e69a-4006-b531-ff211a9cc63d	t	Karambo	af7dbb52-0bce-4986-810c-eac884888d74
55df9edb-9dfe-4c76-af0b-cd2e3ca6cfea	t	Mwendo	af7dbb52-0bce-4986-810c-eac884888d74
b96e24c1-aca3-43c5-92ab-961aa746830f	t	Ruhuha	af7dbb52-0bce-4986-810c-eac884888d74
cd656a80-2868-4564-a115-02a9fc601906	t	Ubuzima	af7dbb52-0bce-4986-810c-eac884888d74
c6ec48b0-708a-4c18-8d2d-4d43afda3f67	t	Umutekano	af7dbb52-0bce-4986-810c-eac884888d74
f3f74b0c-6b33-4e46-9149-ed2b177d0937	t	Gakoni	f94ea71b-58a2-4175-8412-787d5959c18a
25316ad7-753b-4e4f-8649-5d99a4ee73d0	t	Gatare	f94ea71b-58a2-4175-8412-787d5959c18a
e23b1cbd-c948-4562-9e7c-55e216730cc9	t	Giticyinyoni	f94ea71b-58a2-4175-8412-787d5959c18a
e28aa5c1-e153-49e9-b89d-9f472d7a9ed6	t	Kadobogo	f94ea71b-58a2-4175-8412-787d5959c18a
4a146f84-dde2-4374-a68f-06ea9b397511	t	Kamenge	f94ea71b-58a2-4175-8412-787d5959c18a
cd37debf-9330-4ee2-830d-b62213f801fb	t	Karama	f94ea71b-58a2-4175-8412-787d5959c18a
48acce2e-e4f7-405b-8dbd-bc8e09d400db	t	Kiruhura	f94ea71b-58a2-4175-8412-787d5959c18a
35b311a0-7239-49aa-a9f8-7eea08b36665	t	Nyabikoni	f94ea71b-58a2-4175-8412-787d5959c18a
2faf0bf9-4a6c-42f6-a02b-94bdbe01573b	t	Nyabugogo	f94ea71b-58a2-4175-8412-787d5959c18a
223231f5-feac-4116-9bb7-a59465fe9791	t	Ruhondo	f94ea71b-58a2-4175-8412-787d5959c18a
a53dff25-5abb-4fbd-87a8-8f47543174ef	t	Misibya	2db137bf-2c45-44bc-a4f5-4f8335601d81
da3ed92b-43a6-4de5-bbfe-ff0bbb5f2c5e	t	Nyabitare	2db137bf-2c45-44bc-a4f5-4f8335601d81
377cac9a-6792-4d04-8130-c8b9dc5f7944	t	Ruhango	2db137bf-2c45-44bc-a4f5-4f8335601d81
d3fd2c18-311a-42dd-b668-3b88167954ef	t	Ruharabuge	2db137bf-2c45-44bc-a4f5-4f8335601d81
b2a03808-a9cb-44b1-8cc7-53dbcd2f8a6b	t	Ruriba	2db137bf-2c45-44bc-a4f5-4f8335601d81
32f450c2-9578-4eb9-aa2a-12263887ce72	t	Ruzigimbogo	2db137bf-2c45-44bc-a4f5-4f8335601d81
2d70056c-78c3-4674-ae15-350b1a991e16	t	Ryamakomari	2db137bf-2c45-44bc-a4f5-4f8335601d81
0b113414-43ca-46ad-b7c0-ec83e16e9d75	t	Tubungo	2db137bf-2c45-44bc-a4f5-4f8335601d81
2e8a63ab-da4e-45a7-afc3-a2c2b3b1522b	t	Akanyamirambe	3d93669e-316a-4aab-a48e-e9578b7864a8
2c7beac0-90b4-4453-a68d-15b1ef13e75c	t	Akinama	3d93669e-316a-4aab-a48e-e9578b7864a8
ebc59c88-4313-4716-afba-0a1fd927300f	t	Makaga	3d93669e-316a-4aab-a48e-e9578b7864a8
2e20a187-7ae1-4e82-9323-96dccd6aef42	t	Musimba	3d93669e-316a-4aab-a48e-e9578b7864a8
ab83f178-996b-495c-9e47-c34a5d4205ec	t	Ruhogo	3d93669e-316a-4aab-a48e-e9578b7864a8
a537bac5-5c7c-4438-bc3c-edc06d3fb342	t	Rwesero	3d93669e-316a-4aab-a48e-e9578b7864a8
8ae84e65-1406-4053-b746-d341bd20d566	t	Rweza	3d93669e-316a-4aab-a48e-e9578b7864a8
d766a0dd-bc94-43d7-95b2-1866dd60b6a4	t	Vuganyana	3d93669e-316a-4aab-a48e-e9578b7864a8
cd006833-cc23-4781-8368-caf20d1a4852	t	Buhoro	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
a32abf02-f7b8-4d2a-9fac-25bf5a67320b	t	Busasamana	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
29e3f7fa-2c53-40fd-837c-61cabf7d988a	t	Isimbi	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
249f2171-01ae-46a2-bcf1-597fd636f5f8	t	Ituze	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
41e31c0c-efb9-43b4-87c9-411a6579d489	t	Karama	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
591d6cbd-d912-4812-b303-2e87f4af0183	t	Karwarugabo	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
b54c2c0e-efb1-4389-87df-aac4296f7c07	t	Kigabiro	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
b25f13f0-7b87-4962-abc1-97826cd99d53	t	Mataba	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
ad40374e-7143-4dff-b699-ca0bebae043f	t	Munini	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
8e3ca0c5-4f75-4581-a1f3-392dabab051a	t	Ntaraga	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
33796fcf-39f7-407f-bf67-e24d55c195f0	t	Nunga	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
cf46cc75-57f2-4562-84ef-a6f941c13578	t	Rurama	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
ea23b094-571e-4df0-a7ab-18a7442fc0ea	t	Rutunga	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
bf429478-ea49-433a-ab31-05a490bf1fe0	t	Tetero	c7f43c14-0c64-4f47-81ec-c89e283ee9a4
4f7c1e59-3430-4102-9bf1-696b9f87f448	t	Akamahoro	f31e72d1-63ee-4900-846b-82a8aecd665a
e0163ee9-2e5c-4abd-b920-fc954a25a1b9	t	Akishinge	f31e72d1-63ee-4900-846b-82a8aecd665a
347ecef1-ef6e-4a4c-890c-a9f24c9802d8	t	Akishuri	f31e72d1-63ee-4900-846b-82a8aecd665a
d055a69d-0e6f-4db6-a341-bc54d7dff5af	t	Amahumbezi	f31e72d1-63ee-4900-846b-82a8aecd665a
f626e7d3-8b12-425c-884f-6dfcc6f9535b	t	Inganzo	f31e72d1-63ee-4900-846b-82a8aecd665a
8f46d25e-f9f5-451a-817e-d50a6f857f05	t	Kigarama	f31e72d1-63ee-4900-846b-82a8aecd665a
056ef413-5c1e-448a-b30f-0aecb655206f	t	Mpazi	f31e72d1-63ee-4900-846b-82a8aecd665a
92a0c31a-a0ae-4fa8-ab12-89a6b38392a8	t	Mugina	f31e72d1-63ee-4900-846b-82a8aecd665a
32be3ffb-1004-4028-b63c-e0972e502bc8	t	Ubumwe	f31e72d1-63ee-4900-846b-82a8aecd665a
f26b3e45-47c6-4c41-827d-9fa0b5c38c37	t	Ubusabane	f31e72d1-63ee-4900-846b-82a8aecd665a
9e0fc99e-e507-4845-92b9-33370164fae6	t	Umubano	f31e72d1-63ee-4900-846b-82a8aecd665a
b9feed29-0dc3-49ea-9f3a-714656694ffb	t	Umurinzi	f31e72d1-63ee-4900-846b-82a8aecd665a
e1bcb065-b0f7-4ced-aa5a-48c18be40a97	t	Uruyange	f31e72d1-63ee-4900-846b-82a8aecd665a
405d14bf-9c69-4e75-91e2-5c0ed97f16b3	t	Akabeza	4856c90b-5e80-496c-ac34-21b5d5bc784b
64174e7a-1112-4c0c-a11d-8d37fd178cbf	t	Amahoro	4856c90b-5e80-496c-ac34-21b5d5bc784b
a63c4ee9-1449-4557-8616-3db1b3007002	t	Birama	4856c90b-5e80-496c-ac34-21b5d5bc784b
f9a3ea4a-ea26-4617-8ae4-c1bd04a147e0	t	Buhoro	4856c90b-5e80-496c-ac34-21b5d5bc784b
9f394b90-9bc6-4f0e-86bf-c60fc2a65fe3	t	Bwiza	4856c90b-5e80-496c-ac34-21b5d5bc784b
35061cb3-a136-4c3b-8479-ea41d5b07c6d	t	Byimana	4856c90b-5e80-496c-ac34-21b5d5bc784b
b24da37b-ae97-496f-8af1-23f286bb46e5	t	Gakaraza	4856c90b-5e80-496c-ac34-21b5d5bc784b
05f7c9b5-f74e-429a-9cc3-6aa1f3f04df2	t	Gaseke	4856c90b-5e80-496c-ac34-21b5d5bc784b
55c69842-8551-4f03-b92e-f118af9dcaf8	t	Ihuriro	4856c90b-5e80-496c-ac34-21b5d5bc784b
60a6c954-7125-49ee-8776-3cb329242e9c	t	Inkurunziza	4856c90b-5e80-496c-ac34-21b5d5bc784b
056b5d7e-e49e-471a-8df7-cd90e1736396	t	Karambi	4856c90b-5e80-496c-ac34-21b5d5bc784b
35e82218-3a2f-49f4-9cfd-7671426d9d50	t	Kigina	4856c90b-5e80-496c-ac34-21b5d5bc784b
55bb0ea3-d4bc-4e9a-a7a4-1ce52dbd67ea	t	Kimisagara	4856c90b-5e80-496c-ac34-21b5d5bc784b
2d530f22-462f-4e65-b8c0-cad6e15ff7cd	t	Kove	4856c90b-5e80-496c-ac34-21b5d5bc784b
ff4f8da6-a2db-464d-840d-ead049ff4570	t	Muganza	4856c90b-5e80-496c-ac34-21b5d5bc784b
12068f1d-ac9e-4a2a-96f3-5dd16549caad	t	Nyabugogo	4856c90b-5e80-496c-ac34-21b5d5bc784b
fa998f2f-fb77-494b-8c24-4cf0e8f7cf6a	t	Nyagakoki	4856c90b-5e80-496c-ac34-21b5d5bc784b
4ed34fb7-683d-45ce-b71e-c2e24029d3e2	t	Nyakabingo	4856c90b-5e80-496c-ac34-21b5d5bc784b
35d87a94-05d8-4ef9-894f-824ae66b0f93	t	Nyamabuye	4856c90b-5e80-496c-ac34-21b5d5bc784b
d4801e6c-8017-4ac3-98f9-69fe132d58bf	t	Sangwa	4856c90b-5e80-496c-ac34-21b5d5bc784b
7b974143-949b-4772-a5b5-90d49a22776b	t	Sano	4856c90b-5e80-496c-ac34-21b5d5bc784b
31689f7d-55e5-4cf7-b9e6-b5b701351433	t	Kamatamu	c139dbab-1585-4e8c-b5fa-04dfe864da9e
a9dd0eed-90c6-436c-acab-4de60f59029e	t	Kankuba	c139dbab-1585-4e8c-b5fa-04dfe864da9e
1a58d210-c7c5-49cc-811d-2e7f4bd2a9cf	t	Karukina	c139dbab-1585-4e8c-b5fa-04dfe864da9e
19a50f07-3b57-4cc4-a129-a936fc2cd996	t	Musave	c139dbab-1585-4e8c-b5fa-04dfe864da9e
514fcfe6-2b05-4a3d-a216-66adfec670b5	t	Nyarumanga	c139dbab-1585-4e8c-b5fa-04dfe864da9e
aaf591bf-e4d7-4c52-929d-59d181479fcf	t	Rugendabari	c139dbab-1585-4e8c-b5fa-04dfe864da9e
da55a510-5b29-43d5-9fa6-a264c3bc8489	t	Ayabatanga	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
735d5174-8f9d-4072-94c8-5ea94f36585f	t	Kankurimba	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
51270689-a71a-438e-ae42-480cc579249a	t	Kavumu	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
b7a35dfa-ef67-4fdb-86b6-2691f1f6eefe	t	Mubura	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
2e7267ae-809c-433b-af3a-bf58f01d94be	t	Murondo	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
be824a37-4516-4bf8-b486-a476a67782ff	t	Nyakabingo	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
30112248-a487-49ad-9633-611bc4e494f6	t	Nyarubuye	fa2d65c0-6c0b-4ab7-966e-539c3a9b877d
6fcb7c70-ccd7-4378-8d49-03965e126a43	t	Burema	a569f960-2a09-4f06-b936-d22c03de609f
63427604-09d4-46b5-981a-2fe5b7269ac6	t	Gahombo	a569f960-2a09-4f06-b936-d22c03de609f
86428645-8c15-47f8-b9a2-48b03a93d7be	t	Kabeza	a569f960-2a09-4f06-b936-d22c03de609f
b1015760-6d20-425c-bc56-823cb44b6ebb	t	Karambi	a569f960-2a09-4f06-b936-d22c03de609f
a1a0005f-0a86-4004-b5d3-0e65437717d8	t	Kwisanga	a569f960-2a09-4f06-b936-d22c03de609f
29072f5b-36b9-425c-8761-a6f7daec1db5	t	Mageragere	a569f960-2a09-4f06-b936-d22c03de609f
55121b53-e805-464f-9543-f2d520f14d0d	t	Mataba	a569f960-2a09-4f06-b936-d22c03de609f
d329c7fa-ff8c-43e7-9408-2842bfd0f3fb	t	Rushubi	a569f960-2a09-4f06-b936-d22c03de609f
02074075-9be6-4237-947d-7acdf751fe12	t	Akanakamage	3322caa7-347a-485b-8a85-6fca71a815c3
34cd778e-3ee1-43eb-8174-b208837e832e	t	Gatovu	3322caa7-347a-485b-8a85-6fca71a815c3
5c36d595-e94b-4a9a-a94d-c7e30578eb57	t	Nyabitare	3322caa7-347a-485b-8a85-6fca71a815c3
d3921849-2ede-41f8-bba4-08a5e0d68c93	t	Nyarubande	3322caa7-347a-485b-8a85-6fca71a815c3
753b5526-c00d-4291-860a-3f54f57c86d1	t	Rubungo	3322caa7-347a-485b-8a85-6fca71a815c3
1dc67722-f7bd-4b00-a620-adc7a048a87c	t	Rwindonyi	3322caa7-347a-485b-8a85-6fca71a815c3
a8796004-d7fc-451a-a5de-08d4bd1ed215	t	Akabungo	8d68880f-8c27-430e-9709-27142a866763
eae10226-5dc2-41dd-bd80-7e23c6191f29	t	Akamashinge	8d68880f-8c27-430e-9709-27142a866763
2645e2a7-cc75-41aa-aab6-ab96cd3df9bb	t	Maya	8d68880f-8c27-430e-9709-27142a866763
bb551086-626f-4353-a901-c1d3b57cd18a	t	Nyarufunzo	8d68880f-8c27-430e-9709-27142a866763
eff0217c-692b-459d-ad54-8b37de0eda6f	t	Nyarurama	8d68880f-8c27-430e-9709-27142a866763
af9c5051-c409-4731-abf3-ec0cb5ab5532	t	Rubete	8d68880f-8c27-430e-9709-27142a866763
7cb5bfc6-6a6e-47e5-acd6-fe68a38f4252	t	Amahoro	d04ff060-261f-45c9-9c82-7d8316c58a8e
36af17dc-1558-4159-a504-517ecf0908c5	t	Ayabaramba	d04ff060-261f-45c9-9c82-7d8316c58a8e
834e3ef6-c15b-49d3-b379-2b8dd761b7c4	t	Gikuyu	d04ff060-261f-45c9-9c82-7d8316c58a8e
23e14168-8781-4f3f-8c25-20a41ea05af7	t	Iterambere	d04ff060-261f-45c9-9c82-7d8316c58a8e
aca5846f-5bcc-4cfe-8ff5-39ba2bf61b65	t	Nyabirondo	d04ff060-261f-45c9-9c82-7d8316c58a8e
eeb57664-febc-46d1-b79c-113a338cad46	t	Nyarurenzi	d04ff060-261f-45c9-9c82-7d8316c58a8e
3c096a9e-8123-4be8-bd90-510aeb3b551c	t	Gisunzu	5cc81396-5168-4ab4-bfd5-80aff7a994c3
8e77655d-59ca-42af-a756-956f9c08f7af	t	Mpanga	5cc81396-5168-4ab4-bfd5-80aff7a994c3
ae5a18b4-f106-4702-8f1d-342cdf1b0dbe	t	Nkomero	5cc81396-5168-4ab4-bfd5-80aff7a994c3
568e1977-a50f-46db-8f05-e8e5349e7320	t	Runzenze	5cc81396-5168-4ab4-bfd5-80aff7a994c3
e6d7293a-e377-4f89-82d5-6bd1fb760f3b	t	Uwurugenge	5cc81396-5168-4ab4-bfd5-80aff7a994c3
f64e197b-92fe-4b23-b7bb-38c22aae7f9e	t	Amahoro	47606d28-c4be-4949-8cc7-6acac5d6a2c2
e470fd19-2745-4497-9224-72157739bb19	t	Amizero	47606d28-c4be-4949-8cc7-6acac5d6a2c2
9175c4af-81a2-4248-9bd0-49ea6ce56fc1	t	Inyarurembo	47606d28-c4be-4949-8cc7-6acac5d6a2c2
26ff6927-bf59-46fc-b1c5-7014e5ce0723	t	Kabirizi	47606d28-c4be-4949-8cc7-6acac5d6a2c2
30f6be3a-16a2-43bf-8f67-2264cdade6dd	t	Ubuzima	47606d28-c4be-4949-8cc7-6acac5d6a2c2
ebbbe10a-0a40-461d-b8c5-c5f8c4ebe260	t	Uruhimbi	47606d28-c4be-4949-8cc7-6acac5d6a2c2
605740f9-e79a-4737-b647-a7a4eb87dac7	t	Icyeza	a4be6ac1-81ed-4b9c-a3d9-de5fe226ae7d
2b09a9e6-0468-4981-9c90-df15a76ea236	t	Ikana	a4be6ac1-81ed-4b9c-a3d9-de5fe226ae7d
fad5f407-6154-4f20-960d-377fcd123eeb	t	Intwari	a4be6ac1-81ed-4b9c-a3d9-de5fe226ae7d
e462c6f2-7b85-4b60-bb22-bfa0b14c995f	t	Kabasengerezi	a4be6ac1-81ed-4b9c-a3d9-de5fe226ae7d
942ab0ac-50b0-4988-94f7-e6c9db135e44	t	Hirwa	9db731c8-dffa-482c-acc9-0264acbf7783
7577d644-d380-4a0c-900c-3de37d1805c5	t	Ikaze	9db731c8-dffa-482c-acc9-0264acbf7783
b4efb6f0-d81e-4009-a822-d173fed0430b	t	Imanzi	9db731c8-dffa-482c-acc9-0264acbf7783
01eb3ef7-aa78-4bf2-9f08-6f5107547397	t	Ingenzi	9db731c8-dffa-482c-acc9-0264acbf7783
4370c6e7-ffaa-44a3-821e-c57ed357214c	t	Ituze	9db731c8-dffa-482c-acc9-0264acbf7783
5c886f3e-e9b8-402c-9866-cab3db021a77	t	Sangwa	9db731c8-dffa-482c-acc9-0264acbf7783
e338b3d0-4c4e-4bf4-a6d1-989373f26198	t	Umwezi	9db731c8-dffa-482c-acc9-0264acbf7783
15af244a-9824-46ce-a07d-da4eba5ab1c5	t	Abeza	154529c3-454a-4bd0-97d0-680019713a86
6eda328f-c2b5-4a3c-b993-fdb6d96786e3	t	Icyerekezo	154529c3-454a-4bd0-97d0-680019713a86
cd4dc590-b666-4911-b817-075fb3591a56	t	Indatwa	154529c3-454a-4bd0-97d0-680019713a86
d1f66103-dfa9-4f4b-95cb-7950ca8dae7c	t	Rwezangoro	154529c3-454a-4bd0-97d0-680019713a86
5e1fbcfa-8fcf-4048-ad5f-703457f6d594	t	Ubucuruzi	154529c3-454a-4bd0-97d0-680019713a86
cc46273a-67e2-4101-a1a7-8863a2a07c32	t	Umutekano	154529c3-454a-4bd0-97d0-680019713a86
42dda5c1-8e86-4238-9be4-c71c922f8049	t	Imihigo	1a6a6fba-fbae-479d-a40b-f469e62d94c8
015a5577-e288-4abc-b5f1-51244dd6ab11	t	Impala	1a6a6fba-fbae-479d-a40b-f469e62d94c8
75f515d9-2b48-42bf-af27-71e47cedcb39	t	Rugenge	1a6a6fba-fbae-479d-a40b-f469e62d94c8
0543fb0b-962f-470e-9fbb-7d6f495d8b81	t	Ubumanzi	1a6a6fba-fbae-479d-a40b-f469e62d94c8
e4168c39-76d6-4e53-9629-b350ca592b3f	t	Indamutsa	856a3fe6-e6db-4482-baa5-2a6d8b62f233
7a6b705d-5bb4-4d19-843a-3614eb0a3da3	t	Ingoro	856a3fe6-e6db-4482-baa5-2a6d8b62f233
ec43e56d-c00e-450c-8412-8a7d108694af	t	Inkingi	856a3fe6-e6db-4482-baa5-2a6d8b62f233
90c38f62-3081-4909-bc6b-c6618fb4b4e7	t	Intiganda	856a3fe6-e6db-4482-baa5-2a6d8b62f233
2132f2dc-23dc-4993-b79d-af03c26f1d51	t	Iwacu	856a3fe6-e6db-4482-baa5-2a6d8b62f233
a03df6dc-67ee-4681-a204-594520aad69c	t	Tetero	856a3fe6-e6db-4482-baa5-2a6d8b62f233
15d08473-165a-496a-914c-c86635159adb	t	Isangano	9312f0a8-9993-4fff-9cc3-994fde293a65
b36b0d6d-fa08-436c-9369-6df4a387d8a8	t	Kabusunzu	79119893-0263-45a8-b251-4faaff357c01
8bbe0d86-cf79-4426-87e7-c6f880cac907	t	Munanira	79119893-0263-45a8-b251-4faaff357c01
a7780cc9-3027-4669-ac7d-4842af9d5f76	t	Ntaraga	79119893-0263-45a8-b251-4faaff357c01
6c712107-18e8-4ad2-9e12-0d240c2ec292	t	Nyagasozi	79119893-0263-45a8-b251-4faaff357c01
8301a86b-f543-4fd5-a2ae-77f5b82c82a0	t	Rurembo	79119893-0263-45a8-b251-4faaff357c01
5aa614c3-5ba7-48b7-8314-8cbafd2cf4a4	t	Gasiza	c0f128ca-d278-4797-aec5-695637a1356e
ea20f0e9-c27c-430e-abda-0c0b6f1d7fde	t	Kamwiza	c0f128ca-d278-4797-aec5-695637a1356e
936fd094-df68-456a-aff2-5e8833c2f367	t	Kanyange	c0f128ca-d278-4797-aec5-695637a1356e
9a309bec-9de3-4ce7-b327-557c035fba19	t	Karudandi	c0f128ca-d278-4797-aec5-695637a1356e
922c395a-de01-47fa-8466-29379bab55c7	t	Kigabiro	c0f128ca-d278-4797-aec5-695637a1356e
024b20ab-36f2-473a-957c-36011023dd68	t	Kokobe	c0f128ca-d278-4797-aec5-695637a1356e
511636c9-a72b-4f4b-a97d-c8035b9df13e	t	Mucyuranyana	c0f128ca-d278-4797-aec5-695637a1356e
f461fb12-c009-43e7-9153-a6b59bc4b538	t	Nkundumurimo	c0f128ca-d278-4797-aec5-695637a1356e
55ca7cf0-9b7b-4bda-91dd-42f982721a5f	t	Akinkware	e26c9186-af6d-4505-a621-147e824897e4
8b857a80-eabc-450e-a4a3-3ebf023b45d2	t	Gapfupfu	e26c9186-af6d-4505-a621-147e824897e4
d2aeffa9-1d8d-429e-a422-0754b1640856	t	Gasiza	e26c9186-af6d-4505-a621-147e824897e4
549de421-97c4-4459-9317-d0d79af5dd0d	t	Kariyeri	e26c9186-af6d-4505-a621-147e824897e4
3b1b8f62-4f94-4794-9d50-88663f2e9307	t	Kokobe	e26c9186-af6d-4505-a621-147e824897e4
f28910d1-5e60-4191-89e5-bda9f1b680d9	t	Munini	e26c9186-af6d-4505-a621-147e824897e4
19d431dd-7e66-436a-ae09-5e7f0958f12a	t	Nyakabanda	e26c9186-af6d-4505-a621-147e824897e4
7f95c662-a33d-4301-b0e1-68156b815396	t	Rwagitanga	e26c9186-af6d-4505-a621-147e824897e4
1ef19841-767a-465d-88fb-256180fcd638	t	Ibuhoro	43aa37a4-39ec-44af-b49a-09fdb4de308d
d011c679-d99d-432a-9475-fe8d17a3c9fd	t	Kabeza	43aa37a4-39ec-44af-b49a-09fdb4de308d
bb1a6a6f-5de8-4b60-81eb-1ee94f537c0a	t	Kanyiranganji	43aa37a4-39ec-44af-b49a-09fdb4de308d
7db8dc7c-f830-46ae-b06b-7a647879cd6a	t	Karujongi	43aa37a4-39ec-44af-b49a-09fdb4de308d
a110fc52-364e-42d1-8f12-f7b5a56ba5ef	t	Kigarama	43aa37a4-39ec-44af-b49a-09fdb4de308d
a039fc29-d90a-4d45-9b7f-b2d6a2eb9180	t	Kirwa	43aa37a4-39ec-44af-b49a-09fdb4de308d
0e47c771-ff93-4ba4-8b36-eb87c6666f04	t	Amizero	e818257d-9a30-4090-a9a8-941352cdee80
59efd0c9-136a-41d7-a96d-a98bdae64e2e	t	Gabiro	e818257d-9a30-4090-a9a8-941352cdee80
85a90298-946a-47b2-b97b-a8a51c1cfebb	t	Imanzi	e818257d-9a30-4090-a9a8-941352cdee80
296091bc-3017-48e7-b01e-2cbbcf49b351	t	Ingenzi	e818257d-9a30-4090-a9a8-941352cdee80
7dd19a5e-5c02-4ecc-89ed-f9cd1a525cd7	t	Intwari	e818257d-9a30-4090-a9a8-941352cdee80
a9595b4a-965f-4828-9a59-607cf8f996f6	t	Karisimbi	e818257d-9a30-4090-a9a8-941352cdee80
bbf33ca9-4931-4317-a1e8-e9671a4912c8	t	Mahoro	e818257d-9a30-4090-a9a8-941352cdee80
f7e11c3a-9b71-4aaa-9080-aee6fb699e81	t	Mpano	e818257d-9a30-4090-a9a8-941352cdee80
329af44e-fb90-4809-b91b-6af7e55c086c	t	Muhabura	e818257d-9a30-4090-a9a8-941352cdee80
a9d9f4a9-7dbb-4256-9ece-1f24c0e1a796	t	Muhoza	e818257d-9a30-4090-a9a8-941352cdee80
3954a33d-abb9-48b2-a27b-2c1260ae1077	t	Munini	e818257d-9a30-4090-a9a8-941352cdee80
0f1b4fdf-5ad3-41a2-8010-6a1e0d4b2243	t	Rugero	e818257d-9a30-4090-a9a8-941352cdee80
5edee0d2-c1e6-4046-bd91-1027d315328e	t	Shema	e818257d-9a30-4090-a9a8-941352cdee80
2148c320-ae94-4e67-bd65-5403c7a3571c	t	Kagunga	22a2575d-9897-4fa2-acf6-ecc5514d623e
b7dd086e-582c-43d8-bf5a-f78be4c957b0	t	Karukoro	22a2575d-9897-4fa2-acf6-ecc5514d623e
cb2020a5-9005-4e98-91c7-175e13fcb5c6	t	Rwintare	22a2575d-9897-4fa2-acf6-ecc5514d623e
9773cd8a-ca78-47c1-8a6a-d3995dc8b549	t	Akanyana	d05e75c7-fbd7-4315-bf75-27419f232d5d
70d75972-e38e-4fc9-aa2d-fd985e7adcb3	t	Akanyirazaninka	d05e75c7-fbd7-4315-bf75-27419f232d5d
28575691-27c9-451d-b9e1-6dbc3d6adde6	t	Akarekare	d05e75c7-fbd7-4315-bf75-27419f232d5d
43fc6370-5abb-4b90-9b96-1539536bdaac	t	Akatabaro	d05e75c7-fbd7-4315-bf75-27419f232d5d
0211d227-9b8c-4a68-85b2-f2952e35ba33	t	Irembo	d05e75c7-fbd7-4315-bf75-27419f232d5d
550ab8cc-0e15-44cb-9f75-95a21a45bbbd	t	Itaba	d05e75c7-fbd7-4315-bf75-27419f232d5d
8db4024b-967e-44ba-a05b-47eab5dfc67d	t	Kiberinka	d05e75c7-fbd7-4315-bf75-27419f232d5d
f09e7cd9-60a8-4a08-b947-c9e99df40970	t	Mumena	d05e75c7-fbd7-4315-bf75-27419f232d5d
b81db3eb-a08f-40a8-8883-b2a097658071	t	Rwampara	d05e75c7-fbd7-4315-bf75-27419f232d5d
14c27c28-b27d-4d3c-b40a-5640a3416c27	t	Gatare	97febf54-db2a-4474-bc4b-4b8b6166cbf4
53a2281b-613b-41d8-a055-ffbbb1cd8e4e	t	Kiberinka	97febf54-db2a-4474-bc4b-4b8b6166cbf4
adbb4ade-f4ff-4bbc-8401-520c44a3e5b0	t	Munanira	97febf54-db2a-4474-bc4b-4b8b6166cbf4
8c92bd19-7fb7-499e-98af-8776e8beb903	t	Riba	97febf54-db2a-4474-bc4b-4b8b6166cbf4
c86bc988-3d26-41db-a64a-7aaab000e14e	t	Rubona	97febf54-db2a-4474-bc4b-4b8b6166cbf4
0aa120e6-6e34-41fd-bb3a-d435cebac3ba	t	Rugarama	97febf54-db2a-4474-bc4b-4b8b6166cbf4
9fd0f5f4-e20a-4dd1-b168-a2f73c0883dc	t	Runyinya	97febf54-db2a-4474-bc4b-4b8b6166cbf4
f06c01fa-9b86-47a0-a842-aa7986c77a39	t	Rusisiro	97febf54-db2a-4474-bc4b-4b8b6166cbf4
94a00753-5cf1-423d-92f9-c9a73ef16f27	t	Tetero	97febf54-db2a-4474-bc4b-4b8b6166cbf4
a87ee5bb-accd-47c8-bdd9-9154ebc2515e	t	Agatare	ad02b1ac-f373-486f-bfdc-119dae66231a
3b624995-85e7-4d7b-accf-59fbc8b06358	t	Amajyambere	ad02b1ac-f373-486f-bfdc-119dae66231a
0673ce2c-b663-4f31-ae87-4080ff4a8bba	t	Inyambo	ad02b1ac-f373-486f-bfdc-119dae66231a
75a54e02-acab-486a-88bd-6471f62e5ab0	t	Meraneza	ad02b1ac-f373-486f-bfdc-119dae66231a
9419b3a8-9751-4257-8921-802bd2e102f7	t	Uburezi	ad02b1ac-f373-486f-bfdc-119dae66231a
c8c135a8-c423-4e6e-b1d2-3d1849e266fb	t	Umucyo	ad02b1ac-f373-486f-bfdc-119dae66231a
644d4e70-c674-4beb-873c-7813ab84e435	t	Umurava	ad02b1ac-f373-486f-bfdc-119dae66231a
992ac192-cbed-492e-877a-f065f2e7c2fa	t	Biryogo	7572c4ef-89aa-44f2-8fb2-28e51d4e76cb
2e9252b7-b193-4241-830e-104995d86e71	t	Gabiro	7572c4ef-89aa-44f2-8fb2-28e51d4e76cb
7870a623-cd0d-4c81-bfcf-ba7d4f77383e	t	Isoko	7572c4ef-89aa-44f2-8fb2-28e51d4e76cb
7534f5c0-d85f-4f98-a6f7-d5b4a046f8f4	t	Nyiranuma	7572c4ef-89aa-44f2-8fb2-28e51d4e76cb
7110b76a-bceb-49d3-8653-4913c22fea6d	t	Umurimo	7572c4ef-89aa-44f2-8fb2-28e51d4e76cb
4b85ec4d-b2d1-4e05-b910-5c2baa21385e	t	Amizero	7d5720ca-158f-4363-8029-2069a3dd9e67
d42689b1-1253-4b57-aa30-40de37d6c1a6	t	Cercle Sportif	7d5720ca-158f-4363-8029-2069a3dd9e67
4c567a11-fc3a-49eb-a213-f85f0f8fb559	t	Ganza	7d5720ca-158f-4363-8029-2069a3dd9e67
e24aae18-da5f-4f16-8e79-3dab169413b7	t	Imena	7d5720ca-158f-4363-8029-2069a3dd9e67
1191be16-b1ae-461c-b7a5-4f0b6b82a3f7	t	Indangamirwa	7d5720ca-158f-4363-8029-2069a3dd9e67
9ec5bcfa-8fd5-4397-aa1b-45a2e54f26c4	t	Ingenzi	7d5720ca-158f-4363-8029-2069a3dd9e67
c566d357-92bf-45fc-9ccf-39d9456b52eb	t	Inyarurembo	7d5720ca-158f-4363-8029-2069a3dd9e67
486c1fe5-18d1-465a-949d-eb8983b4a539	t	Ishema	7d5720ca-158f-4363-8029-2069a3dd9e67
92e50be0-75f3-4ae0-b3c1-89d5b6ea9caf	t	Isibo	7d5720ca-158f-4363-8029-2069a3dd9e67
a3919189-c56d-4c36-8be6-e52e08a3adf4	t	Muhabura	7d5720ca-158f-4363-8029-2069a3dd9e67
9faa19ce-1dcb-4f14-b483-49d25378bdac	t	Rugunga	7d5720ca-158f-4363-8029-2069a3dd9e67
e991c2b4-e5f0-4036-918d-5a2ad8daa2b2	t	Sugira	7d5720ca-158f-4363-8029-2069a3dd9e67
8ea9f222-1b53-416b-af08-43c4618ab55f	t	Amahoro	9a529ea1-129f-4f73-912b-f1c342386830
4f28c252-2028-4fcd-9df0-cae70e0f0545	t	Gacaca	9a529ea1-129f-4f73-912b-f1c342386830
8b739c74-060a-4a61-9eed-3c385d16b68d	t	Intwari	9a529ea1-129f-4f73-912b-f1c342386830
edd6b2dd-e4be-4cd6-9f84-08aaf79df3b4	t	Rwampara	9a529ea1-129f-4f73-912b-f1c342386830
0292d987-8c82-4e43-a908-cefccc5cbdf4	t	Umucyo	9a529ea1-129f-4f73-912b-f1c342386830
0bab5c71-9f56-4f9a-a0a9-fbe26a8a46a3	t	Umuganda	9a529ea1-129f-4f73-912b-f1c342386830
ad3d0f51-9404-4abc-a358-6de81a7b2a8a	t	Muhoza	af6ea1cd-7b10-49ee-b4ac-9a48a563f696
41ec5ec3-fa33-4a0c-9791-2fbfab6f6df8	t	Muhuza	af6ea1cd-7b10-49ee-b4ac-9a48a563f696
415bf896-d9a3-4843-97bc-692863759ac3	t	Mumararungu	af6ea1cd-7b10-49ee-b4ac-9a48a563f696
faa47586-12de-4001-98ca-1453af31e1a9	t	Murambi	af6ea1cd-7b10-49ee-b4ac-9a48a563f696
a1094e7c-2635-4d2c-9415-a16df9886fd6	t	Buhoro	d24c4b5c-66d9-43c3-9bcf-e4281343e1b4
3e5f46c9-cdf2-4d7c-9ff0-da1ec37209ba	t	Gasabo	d24c4b5c-66d9-43c3-9bcf-e4281343e1b4
96e7c53b-37e3-455c-86ff-66d7183c647b	t	Mutara	d24c4b5c-66d9-43c3-9bcf-e4281343e1b4
075dbebf-84e1-4f75-8ba9-fa82c023c799	t	Ubusabane	d24c4b5c-66d9-43c3-9bcf-e4281343e1b4
7a878c58-1ca0-4a1f-92a4-27b9e7290fca	t	Abatarushwa	fbda4e79-e4b5-4e50-ac7d-3ada2ab05222
c34a82ef-0cfa-4f2c-98c4-440d92cab671	t	Indatwa	fbda4e79-e4b5-4e50-ac7d-3ada2ab05222
fb75ca63-1984-40f0-83dd-a8a686303b51	t	Inkerakubanza	fbda4e79-e4b5-4e50-ac7d-3ada2ab05222
7b5a75e4-5522-42a3-a5e2-9ada64f17e73	t	Intwari	fbda4e79-e4b5-4e50-ac7d-3ada2ab05222
246706ab-7aaf-424c-af50-3131cb31107f	t	Amahoro	3e20e2b7-9e3b-48c8-b6c8-a3f3719d9f56
3ad55248-4e0e-4008-a897-b4b17581d02e	t	Umucyo	3e20e2b7-9e3b-48c8-b6c8-a3f3719d9f56
9e56d379-0f79-4c8a-8953-7339ff3d036c	t	Urumuri	3e20e2b7-9e3b-48c8-b6c8-a3f3719d9f56
542ee7f2-ec32-4f2b-9bab-2849aa3461e5	t	Katiro	586b713b-f166-4f97-92d6-f231ffa0303b
25e74152-30a0-40ea-ba90-d9862697e27a	t	Kinyana	586b713b-f166-4f97-92d6-f231ffa0303b
b283c4f6-9022-4619-9e14-b2fad054601d	t	Murambi	586b713b-f166-4f97-92d6-f231ffa0303b
7d167941-1650-4840-b2ba-bab5a387fd9a	t	Sanzu	586b713b-f166-4f97-92d6-f231ffa0303b
a2da631c-aaea-42cc-a1f0-45da7f8017e9	t	Karehe	cc44a33f-f186-418b-9ebf-69c3e684c947
5f3dedcc-9288-4c2d-8400-841390e74bc3	t	Mugusa	cc44a33f-f186-418b-9ebf-69c3e684c947
5df4853a-db26-4355-8e0e-c77a4a1a7199	t	Remera	cc44a33f-f186-418b-9ebf-69c3e684c947
2daa763b-09be-4261-b85c-6645735e9d21	t	Rugarama	277e66ef-00cc-4cd6-b246-a3d7b0dd7e0f
f333a623-56df-4187-8105-682cbffc238b	t	Runyinya	277e66ef-00cc-4cd6-b246-a3d7b0dd7e0f
5a40fd91-1041-47d4-8586-76555b7ddb7e	t	Bukorota	8edb7d05-6d67-4a67-bf5a-49d38dcefc8b
3ee7504f-9347-4c2f-9a2b-c218ffdd44ab	t	Kirivuga	8edb7d05-6d67-4a67-bf5a-49d38dcefc8b
1a93c1bc-5cd4-498a-b3e5-b26cf19ce337	t	Mbogo	8edb7d05-6d67-4a67-bf5a-49d38dcefc8b
db48e560-c2b5-4665-a439-4adfeea3438d	t	Nyakabuye	8edb7d05-6d67-4a67-bf5a-49d38dcefc8b
3e2d93cd-e1d2-4638-a71c-9af7f4dfc708	t	Nyiramageni	8edb7d05-6d67-4a67-bf5a-49d38dcefc8b
93348a18-9fcc-432c-906a-63dc9ff4fbce	t	Rwintare	8edb7d05-6d67-4a67-bf5a-49d38dcefc8b
82a20c29-1de3-4a08-9e68-add143e259ec	t	Busave	a87aff2e-a2ac-449f-9b7c-5d02ca221547
36096fca-2c34-47d4-b87c-41b77bd35594	t	Kigozi	a87aff2e-a2ac-449f-9b7c-5d02ca221547
998c24ff-4f4c-4f9a-ac59-afbe064c42dc	t	Kivugiza	a87aff2e-a2ac-449f-9b7c-5d02ca221547
5f4aa375-01d4-4c12-80ca-98acb7f25a62	t	Nyundo	a87aff2e-a2ac-449f-9b7c-5d02ca221547
a90e52b0-f927-4aaf-9ebf-bedf8a041128	t	Kurutare	a87aff2e-a2ac-449f-9b7c-5d02ca221547
856196b0-206a-4ab5-a5d7-96aba3587632	t	Hemba	240eb070-2c01-4b18-a941-01cc4b4a1217
b160bc8e-b18b-4f05-b3dc-b5210154defb	t	Kanombe	240eb070-2c01-4b18-a941-01cc4b4a1217
39093f1d-f81b-4d3b-afad-b7b8c1afc23d	t	Mwiba	240eb070-2c01-4b18-a941-01cc4b4a1217
bcb39ac2-edca-4131-aaa8-24ae38f0df02	t	Rwinkwavu	240eb070-2c01-4b18-a941-01cc4b4a1217
48a575ea-af4a-4078-bfef-349590cf11ee	t	Gicaca	7011b53e-c1ab-4333-a990-cbb354785999
eb5dddf4-e7fa-4618-ae2d-12ff3b087fc4	t	Munyinya	7011b53e-c1ab-4333-a990-cbb354785999
00237a13-ed8b-492c-b802-638fc4728d02	t	Nkunamo	7011b53e-c1ab-4333-a990-cbb354785999
ca48dafc-053a-425a-b3c0-87a232a32fc1	t	Nyakibungo	7011b53e-c1ab-4333-a990-cbb354785999
a13dba76-f498-4aee-83bb-11bb556aef46	t	Rebero	7011b53e-c1ab-4333-a990-cbb354785999
622da18f-a905-4885-a8df-81f7f84c7763	t	Rusasa	7011b53e-c1ab-4333-a990-cbb354785999
ad1614be-13a4-4ccd-8d15-42a66884ba55	t	Gikuyo	2d37774d-7652-4464-8a59-13fb2b4927b6
34e73e4f-2b19-479b-a05b-0780043e2f17	t	Gishya	2d37774d-7652-4464-8a59-13fb2b4927b6
86b129a5-1cc1-41ac-a692-20278a38fba0	t	Kagoma	2d37774d-7652-4464-8a59-13fb2b4927b6
04dbc350-ba89-41d0-ac31-8fcd4b2cc161	t	Kavumu	2d37774d-7652-4464-8a59-13fb2b4927b6
3a7f0ca9-5b04-4e9d-b806-15bbada87e8e	t	Muyinza	2d37774d-7652-4464-8a59-13fb2b4927b6
1b9559e1-fadf-4859-a1c7-b2e9cefa94d1	t	Rebero	2d37774d-7652-4464-8a59-13fb2b4927b6
e1dd4ec7-6288-4a81-8245-1b50fce469a5	t	Rugogwe	2d37774d-7652-4464-8a59-13fb2b4927b6
5b254743-aa90-4b16-aa30-48ec2358a325	t	Agacyamu	47725f63-1f57-4025-8feb-90b25fe7bc98
ec995e25-1a2c-42fc-8c33-e17767359ad0	t	Akabuga	47725f63-1f57-4025-8feb-90b25fe7bc98
1826fb31-cd4a-429e-bda9-867ec29d3dfb	t	Gatare	47725f63-1f57-4025-8feb-90b25fe7bc98
67b69aae-8a74-4a8a-8176-e2203d422039	t	Impinga	47725f63-1f57-4025-8feb-90b25fe7bc98
caad1fbf-58dc-42b1-928c-98589f5ef923	t	Nyaruhengeri	6cb827d0-0368-4bb1-810c-977d29fe208f
86d325d9-b77d-4c08-aa6f-9fa7e97c88db	t	Akayenzi	3f03b9b1-9d97-4ca4-b92b-f9e4217e5bff
dd0a0ea2-cb59-47d5-acf4-e4194101fc74	t	Nyarunazi	3f03b9b1-9d97-4ca4-b92b-f9e4217e5bff
b5ddb816-73c8-4083-a9a0-d6e6205020a2	t	Buhoro	f3ba8d2d-fff6-4042-8a2a-65e7ee4daf64
0bdff146-67f8-440d-808e-4d33093c438a	t	Burashi	f3ba8d2d-fff6-4042-8a2a-65e7ee4daf64
339c9f60-c07c-464f-9c46-a1f6275d6d46	t	Duwani	f3ba8d2d-fff6-4042-8a2a-65e7ee4daf64
367380dc-2c92-4c76-b1a6-0956d7e3ab6f	t	Karambo	f3ba8d2d-fff6-4042-8a2a-65e7ee4daf64
399c35b1-496d-4580-9767-71068f3530b9	t	Kivumu	f3ba8d2d-fff6-4042-8a2a-65e7ee4daf64
ce2c99a5-4b61-4dbd-ae5e-db6f5fba46de	t	Mbeho	4025e1e8-952c-4cd5-881f-f8f13e5db6b8
424baa43-9625-4088-93e7-113190d398fb	t	Torero	4025e1e8-952c-4cd5-881f-f8f13e5db6b8
ef037c1f-ea60-407a-aafe-d40cda5ca73a	t	Agasharu	72043d72-3288-4930-a2e0-8314f94841fe
128da676-1e78-48f4-9fb7-dfe0fec668fc	t	Akagarama	72043d72-3288-4930-a2e0-8314f94841fe
f2af5887-2cf7-414c-8fa3-973711c914c7	t	Akirasaniro	72043d72-3288-4930-a2e0-8314f94841fe
f7ed439d-d689-4545-9ba4-6cec814628fb	t	Impinga	72043d72-3288-4930-a2e0-8314f94841fe
93be6af3-b8ea-4486-8c87-29e73524b7e6	t	Nyagisasa	72043d72-3288-4930-a2e0-8314f94841fe
f8218f77-d485-478b-94c5-53f26181338a	t	Itaba	72043d72-3288-4930-a2e0-8314f94841fe
e030aa17-855f-47cb-8608-69cb451005e4	t	Zihare	72043d72-3288-4930-a2e0-8314f94841fe
07116a00-7c11-4b78-8e75-227d86e17808	t	Agatongati	55b83b6c-7b81-4bc0-875e-98d25ca9df3e
bb175b2a-4879-4aec-b9cf-f89030cdcb7d	t	Akabuhuzu	55b83b6c-7b81-4bc0-875e-98d25ca9df3e
b929e387-86e5-4abe-8db6-c8d752b647b3	t	Impinga	55b83b6c-7b81-4bc0-875e-98d25ca9df3e
7363f7e9-6472-4e00-88e3-dfe23790c08b	t	Karengera	55b83b6c-7b81-4bc0-875e-98d25ca9df3e
b71b7d9f-2496-4d6a-90cf-efc8ad252196	t	Kigarama	55b83b6c-7b81-4bc0-875e-98d25ca9df3e
f861564a-499f-4656-8afe-2355a6bfaba4	t	Ruhuha	98772560-607d-4302-8406-4a0c267f3902
3bbbec65-ce33-40bf-8974-40adc8fcb486	t	Agatare	0fc399a5-2147-47ce-a2ae-68dd47ca333e
866dc8a3-57d7-418b-a9c7-42d6a6669f83	t	Taba	0fc399a5-2147-47ce-a2ae-68dd47ca333e
81906230-73b8-417e-bd52-036eed6154fb	t	Akakijugujug	25ea9d41-d512-4a43-b5fe-f2a5a91677b1
d00727f4-1efe-4c07-8490-e574c696d04f	t	Akabahizi	b5037f2d-c8b0-48d2-b1cc-dbefe756b635
8dd0774b-ae40-4e8e-9366-d82e2c29d006	t	Akimbaka	b5037f2d-c8b0-48d2-b1cc-dbefe756b635
98f1c8c7-961d-4c1d-8055-6198bfc0c574	t	Rutaza	b5037f2d-c8b0-48d2-b1cc-dbefe756b635
3977adb6-30b8-461d-889b-e1ccfa26a38d	t	Ruyenzi	b5037f2d-c8b0-48d2-b1cc-dbefe756b635
9256a72f-0837-4bba-ad38-eedf2ae9c8f8	t	Akadogo	eb9f3068-05c0-4ab1-8eff-66dc78c8712c
d5642366-91ae-4799-b47b-0c3c189263c4	t	Nyakabuye	eb9f3068-05c0-4ab1-8eff-66dc78c8712c
f5a1c855-bad6-4020-af16-cedd9aa632b4	t	Agasharu	b8a8f3aa-5455-4180-98a0-6e549ff5b1f5
f52b31e3-aa86-47ce-8877-9b0b0f00b949	t	Akatera	b8a8f3aa-5455-4180-98a0-6e549ff5b1f5
c583b9bc-dc74-42d2-afd7-bd8e1f52d47b	t	Gakomeye	338a53be-6eda-46ad-8c85-8f14ab33f85b
2389f525-c254-488c-91c0-4e0bbf45a2f1	t	Rugwiza	338a53be-6eda-46ad-8c85-8f14ab33f85b
f9105a54-2997-400b-a168-340c24f51a47	t	Ruhuha	338a53be-6eda-46ad-8c85-8f14ab33f85b
8c4dbfdd-f7b1-4212-a5b8-cf6e2c1ec106	t	Sokofi	338a53be-6eda-46ad-8c85-8f14ab33f85b
b8f26a01-4acc-49e7-85ef-313c7b4290c2	t	Buye	7548dbd7-6c0a-428d-8853-810658f52759
07e37174-e661-4769-bcda-8953f6633067	t	Kabuga	7548dbd7-6c0a-428d-8853-810658f52759
676fefe2-1b18-4c54-a135-285f0b78471f	t	Kirwa	7548dbd7-6c0a-428d-8853-810658f52759
d43b9b0e-0376-465c-be1b-73d1c8952765	t	Munopfu	7548dbd7-6c0a-428d-8853-810658f52759
8c904605-47df-412e-b8dc-dda4a28bc6e7	t	Buhima	e7f42c08-7c05-40ba-b508-15ec95944d24
f185a46e-0216-4df7-b946-456550599eea	t	Gakoma	e7f42c08-7c05-40ba-b508-15ec95944d24
d137b07d-45a4-4a23-8365-dc4cd6e42b05	t	Gatovu	e7f42c08-7c05-40ba-b508-15ec95944d24
f02b8c80-ab3f-4fdb-bb72-aa3ae1dd2cc9	t	Kirase	e7f42c08-7c05-40ba-b508-15ec95944d24
4ed7a974-25d3-459f-8371-e2a0f67dbf3b	t	Nyarugenge	e7f42c08-7c05-40ba-b508-15ec95944d24
110e396a-25d0-4a97-946e-71034514595e	t	Rugunga	e7f42c08-7c05-40ba-b508-15ec95944d24
59869122-e401-410f-9b37-46f6fa24202b	t	Kibumba	7e4c9907-e3c1-4904-8395-d5c4c6832492
147bb3cf-4c92-4941-9899-86e6a8878369	t	Mutori	7e4c9907-e3c1-4904-8395-d5c4c6832492
96a6a3ca-46fe-4c43-b4fc-fbbca65a07fe	t	Ruhamagariro	7e4c9907-e3c1-4904-8395-d5c4c6832492
e5219d5c-a273-424f-9111-664a7b7a2f15	t	Murambi	335389d3-1882-4b16-9067-0b44f6c22c5f
680bb777-4338-416b-83b3-069fb9af4a1e	t	Nyiramageni	335389d3-1882-4b16-9067-0b44f6c22c5f
bd31ca11-2fe8-4dca-a5c5-53b20c4b5ead	t	Runazi	335389d3-1882-4b16-9067-0b44f6c22c5f
e5b17784-995e-447c-ab59-cf9a6f241c39	t	Musatsi	9ea09ba2-2121-4ec5-b346-4bb957e90da6
c81a564c-437a-4822-adc2-e15b59d8b346	t	Nyiraburiba	9ea09ba2-2121-4ec5-b346-4bb957e90da6
de573fb2-da6a-479b-9a63-343413fc677a	t	Rugantete	9ea09ba2-2121-4ec5-b346-4bb957e90da6
f97f7d41-65c3-4f38-9bf5-cb64cef77c4c	t	Rwimisambi	9ea09ba2-2121-4ec5-b346-4bb957e90da6
719102a6-35ca-48ea-8f80-07cf30314d50	t	Agasharu	accbd684-f8ec-4818-9ba7-46b10139f9d8
591cb005-7cba-4e5a-890a-427c1aac7c10	t	Agatongati	accbd684-f8ec-4818-9ba7-46b10139f9d8
f064c039-62bc-444d-b020-0cae2fd30858	t	Gitisi	accbd684-f8ec-4818-9ba7-46b10139f9d8
9de3ceea-6d86-4381-9688-703ddb4023ac	t	Ubusenyi	accbd684-f8ec-4818-9ba7-46b10139f9d8
3f13a1a0-3f98-4671-8421-bc44b6597a50	t	Urusaro	accbd684-f8ec-4818-9ba7-46b10139f9d8
73417582-a7ea-408c-b77b-c6e7dd063f51	t	Butare	c04bbc32-9ef9-4fb7-a12e-d1d44128919b
12f01105-df6f-4db9-911e-c6169162d986	t	Akajyanama	c04bbc32-9ef9-4fb7-a12e-d1d44128919b
1042ae74-4999-4e8e-9f32-1707da55766c	t	Taba	c04bbc32-9ef9-4fb7-a12e-d1d44128919b
a55a13db-0e59-4a5a-8c2e-0b5474866309	t	Agatovu	c375a12d-bdfe-41b3-a363-a7997d42e765
b82233c9-d6a5-4672-90f7-4d6f6c9346af	t	Ubuseruka	c375a12d-bdfe-41b3-a363-a7997d42e765
dff71ece-8884-4191-9525-f1181ebad056	t	Impinga	c375a12d-bdfe-41b3-a363-a7997d42e765
7e56939c-65f7-4913-a95d-bb006eb5b2eb	t	Kidaturwa	c375a12d-bdfe-41b3-a363-a7997d42e765
16268a39-90b1-4d65-962d-74defccbef1f	t	Kiyogoro	c375a12d-bdfe-41b3-a363-a7997d42e765
8fb7768b-7e27-43fe-b053-7122799cffb9	t	Nyagatovu	c375a12d-bdfe-41b3-a363-a7997d42e765
5ba3b474-f934-4a75-9dce-9c0fa56c79a1	t	Ryarumenang	c375a12d-bdfe-41b3-a363-a7997d42e765
660b1334-7b87-4dd9-90d7-5a98a0bdb477	t	Akabacuzi	152759d6-4f08-4481-8335-d1506f085b0a
5ac96218-07c9-4139-9580-1b33b6b9b958	t	Bucaya	152759d6-4f08-4481-8335-d1506f085b0a
941b686a-8856-4a74-b3b3-85187fb2d3f7	t	Buhiza	152759d6-4f08-4481-8335-d1506f085b0a
b19de864-8e4a-42e6-b056-2ac0ebf3247a	t	Duwane	152759d6-4f08-4481-8335-d1506f085b0a
083d4c39-4c8d-4481-9c4d-8595f4faa514	t	Impinga	152759d6-4f08-4481-8335-d1506f085b0a
7abc903c-a1cc-4e92-ae0f-f4216c9ae19e	t	Isangano	152759d6-4f08-4481-8335-d1506f085b0a
de85e0d2-141f-4b1b-ad62-04436570d915	t	Kanto II	152759d6-4f08-4481-8335-d1506f085b0a
2e6bc960-80a8-4860-b200-19b914acc66a	t	Nyabigugu	152759d6-4f08-4481-8335-d1506f085b0a
3643356f-af90-4da0-8a5c-055e5f604483	t	Nyagafumber	152759d6-4f08-4481-8335-d1506f085b0a
cb5e9064-8cbb-4675-b9b3-5b85f590339e	t	Nyamiheto  II	152759d6-4f08-4481-8335-d1506f085b0a
9937da69-725f-42bc-b179-a20ea19268fc	t	Rwinkuba	152759d6-4f08-4481-8335-d1506f085b0a
9f272340-d908-426b-b80f-f9e7c5b3a7b4	t	Nyabinyenga	6fcf1dc1-d97f-4dbc-869a-4999af73a9db
214ebcb6-a445-430d-86ab-b80375446d50	t	Nyagatovu	6fcf1dc1-d97f-4dbc-869a-4999af73a9db
8d7bee65-e9a1-44fa-9089-b84b5907e849	t	Nyesumo	6fcf1dc1-d97f-4dbc-869a-4999af73a9db
329f037d-3dd9-4fe5-8f65-b9cab390bab8	t	Akashyamba	e502101b-2dd3-4175-a60f-2236c966296b
5a396645-f83c-42ed-95ff-b8924e2d422f	t	Rwahambi	e502101b-2dd3-4175-a60f-2236c966296b
d147cd85-0bbc-4e5b-8495-40b140a52aa2	t	Akabugabo	598a4826-3cf0-43f3-b29c-a3e9daada436
c3a5ced8-107c-4daa-a3af-63374b295790	t	Mushongi	598a4826-3cf0-43f3-b29c-a3e9daada436
04e323c8-4a6b-4e1a-97f0-60d5c6bc701a	t	Rurenge	598a4826-3cf0-43f3-b29c-a3e9daada436
780f63ea-17da-4f97-900e-e2b22c087add	t	Impinga	bae7a91a-6945-45bf-8e06-4c90a01e0776
efbec930-58b7-4037-9ea2-a209f3ccbc03	t	Migina	bae7a91a-6945-45bf-8e06-4c90a01e0776
47df5a4f-a5c5-4747-90b5-c884b3e3ab1a	t	Akanyamiram	301c9bf7-bb7f-469f-b242-51f68cefe215
32c0be75-096d-4255-959e-1bad054f9387	t	Akarangabo	301c9bf7-bb7f-469f-b242-51f68cefe215
c7dc9fe7-07bf-471f-98cd-38a87d30cbd5	t	Gitarama	301c9bf7-bb7f-469f-b242-51f68cefe215
53109657-cc31-422e-8fac-d1854185aa8b	t	Nyarusange	301c9bf7-bb7f-469f-b242-51f68cefe215
ce8f40f0-2f2d-4f85-932f-721f838b2ba6	t	Umukungu	301c9bf7-bb7f-469f-b242-51f68cefe215
d08a89dc-9da3-4343-b4be-a26f6a2cfb94	t	Gatunda	09b1e9dd-ecc8-4a02-8138-b3615ab8002d
3415f696-ae12-43f0-a691-0dc18128e5bc	t	Nyabikoni	09b1e9dd-ecc8-4a02-8138-b3615ab8002d
43d8f68a-e455-4a10-b6fa-b1ae1d658984	t	Nyamabuye	09b1e9dd-ecc8-4a02-8138-b3615ab8002d
f8c7cdd5-fb80-4f2b-b7a2-b488e5285691	t	Bukamba	3b011cb3-399f-4c9c-bf73-00d0a93cca23
b7829788-cce1-4f51-ac05-5de2e052f5d3	t	Gitwa	3b011cb3-399f-4c9c-bf73-00d0a93cca23
f1706f99-cc1e-44a3-ab10-951092dd0944	t	Mukiza	3b011cb3-399f-4c9c-bf73-00d0a93cca23
bc28cbfc-ba1d-464d-a141-751e3a65dbb6	t	Agatare	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
d62b2a4f-29a1-4cc9-b9a2-56728c52df43	t	Kabuga	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
44a6f808-fdf3-47d9-8722-f98b2237d56e	t	Akanage	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
1db0861d-dead-4179-8d58-c0308f81b869	t	Kamasiga	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
d6a163c5-6bbe-4a63-9f58-b46c9bc6e523	t	Makwaza	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
4c9f9964-afa6-4fc3-84c9-9b1d444487e4	t	Mihigo	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
159242e0-98a7-4fc3-94ff-10eb5017d188	t	Mutondo	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
0382a5da-dd92-4ac0-b0d0-fd523811b736	t	Nkurubuye	a7cc74bf-458c-4ae2-9a4d-df01283f38e2
97c5314d-9aac-476a-b5a4-5d9887b58b42	t	Agakomeye	0e1a6993-93d0-4c52-beb7-b7ae06be7048
9ac67387-3399-4ecf-9908-8864b619aae1	t	Agasharu	0e1a6993-93d0-4c52-beb7-b7ae06be7048
dc149923-9655-40dd-bcc5-99207d4be336	t	Akamaranga	0e1a6993-93d0-4c52-beb7-b7ae06be7048
ecb87e80-c800-4f70-8ed9-33237a2bf4cc	t	Akarugina	0e1a6993-93d0-4c52-beb7-b7ae06be7048
07347195-bdc5-4394-aa99-4eae77788c18	t	Impinga	0e1a6993-93d0-4c52-beb7-b7ae06be7048
e5cbe7ec-007c-4672-89bb-4cdcd09955c2	t	Mpungwe	0e1a6993-93d0-4c52-beb7-b7ae06be7048
b0fb09bd-9dfc-4d2c-a73e-3d7442520789	t	Nyiranguri	0e1a6993-93d0-4c52-beb7-b7ae06be7048
8bf743ce-7318-444e-9651-f5b6ef76013d	t	Akagarama	ed870518-1f58-4eda-a47e-7ab08a50cf79
319414fe-9328-4214-8245-3e656e8ffd5c	t	Bukinanyana	ed870518-1f58-4eda-a47e-7ab08a50cf79
4ebd1caf-79b8-4ca6-a455-60c90bf10208	t	Kigoma	ed870518-1f58-4eda-a47e-7ab08a50cf79
77e97481-8161-49f6-baa7-10c7b053fc65	t	Munyegera	ed870518-1f58-4eda-a47e-7ab08a50cf79
cbe1b072-b07c-404c-a1cc-62e3cf630d79	t	Gasura	9ee4c811-7c5b-40c0-852a-7e443d64e51f
a21f5fd0-5253-468f-b7df-a8457acf3ac0	t	Gitega	9ee4c811-7c5b-40c0-852a-7e443d64e51f
5c887e2d-d672-4d3a-956f-495da8701dc8	t	Kagunda	9ee4c811-7c5b-40c0-852a-7e443d64e51f
6f0e64b5-fd14-4ba9-a7bd-9114559cf685	t	Kigarama	fa437756-a63f-4748-8583-0220dfc026b7
97879228-c84a-4262-b521-8119046c5a01	t	Murama	fa437756-a63f-4748-8583-0220dfc026b7
f8e4a7e2-4671-4c0b-a777-2ef7fa65a7d8	t	Akabanga	d276652b-fb19-4c2a-aee5-fe54e38c0dbc
f0c0d017-c5e8-4791-b1be-ba73d76d5160	t	Kamabuye	d276652b-fb19-4c2a-aee5-fe54e38c0dbc
8d55e643-bbd5-491b-8ce0-c192a4ba66b6	t	Akiminazi	23f8eb1a-3d7e-4aea-98c6-7e6a0778cf09
cd0bfacc-bc25-4250-b47e-2fc05ec38b98	t	Gatobotobo	23f8eb1a-3d7e-4aea-98c6-7e6a0778cf09
ffd27efc-0161-46f8-ab19-3c92f415d3ad	t	Giseke	9c9142a1-fe6f-42bf-bee5-6e71da5c2bff
844fb989-4a4f-4b4a-899b-f494d425e4d0	t	Ryabiyaga	9c9142a1-fe6f-42bf-bee5-6e71da5c2bff
e41ff296-8c5d-4f03-b6a3-bb2c0c2cd72e	t	Urusenyi	9c9142a1-fe6f-42bf-bee5-6e71da5c2bff
41bcf957-21cc-4ba5-b56c-4a46f20e92a7	t	Gitwa	a9509a9a-8609-4592-8498-4acf6e15e847
936a7f1e-8212-4257-b66f-91d9921d7a54	t	Ndatemwa	a9509a9a-8609-4592-8498-4acf6e15e847
00e9194e-62ff-4159-8105-6c1e248063c1	t	Gisagara	6851223a-4977-4c88-9839-c65c009f07a3
8f452d6e-7762-4619-b0ca-d497aa1557cf	t	Kabuga	6851223a-4977-4c88-9839-c65c009f07a3
a75c66bd-fa90-4dab-bea1-19fdc62ef99a	t	Kabuye	6851223a-4977-4c88-9839-c65c009f07a3
e8994f5d-f262-41e7-a152-f554efa3767d	t	Ndora	6851223a-4977-4c88-9839-c65c009f07a3
80845cf1-3211-4714-b51f-a640724e865e	t	Nyarunazi	6851223a-4977-4c88-9839-c65c009f07a3
5c53da18-4ec9-4616-8666-84e210813f3e	t	Rutonde	6851223a-4977-4c88-9839-c65c009f07a3
3d5ae5e1-25f6-49aa-b698-660e0cb9f5e9	t	Nkinda II	816a8472-b2c9-41a7-bf7f-957d55250718
dab03a23-aedb-4cb8-824c-5a8b8822c2dd	t	Nyarunyinya	816a8472-b2c9-41a7-bf7f-957d55250718
dbe8f94c-acf8-49b1-b441-b8c7f93e4cdd	t	Amashya	9d1ef4cc-7bad-4b6c-a8f0-b4255362e6f5
20ce1fa3-b34f-42ee-9d8a-83dcbc130acb	t	Ruvugizo	9d1ef4cc-7bad-4b6c-a8f0-b4255362e6f5
0d2575f2-3b0d-442a-8df7-af2bb63673c9	t	Rwamiko	c0d9af68-3e0c-4a9a-8d6c-1413bfe7249d
82d199c2-a111-4507-88d0-ceee2bdc0318	t	Urutoyi	c0d9af68-3e0c-4a9a-8d6c-1413bfe7249d
feaa2fcd-8124-4c89-b04d-c6768704088c	t	Marambya	58da4023-5ec0-4a77-ac6a-07fd046be46a
5936119e-75e7-48e7-9386-9d11818117ec	t	Gisunzu	58da4023-5ec0-4a77-ac6a-07fd046be46a
83b94eec-114f-4702-8882-8fdf4bd095eb	t	Impinga I	58da4023-5ec0-4a77-ac6a-07fd046be46a
884758fb-e163-4f9c-8cdc-abd1cdf49702	t	Intuntu	58da4023-5ec0-4a77-ac6a-07fd046be46a
0eb4c64a-7dca-4f74-a1b6-5322d1b4715c	t	Rugayantete	58da4023-5ec0-4a77-ac6a-07fd046be46a
dddf3d34-d157-4220-85fe-4bfac575fbb8	t	Akinyana	e2e8d544-f51e-4242-adc9-afd6a23b370c
9efd98fc-4b51-4407-865c-cddf96500433	t	Maheresho	e2e8d544-f51e-4242-adc9-afd6a23b370c
0d52b6b5-b297-4327-9bc0-ca842b69f737	t	Remera	e2e8d544-f51e-4242-adc9-afd6a23b370c
c94122f8-2816-43d1-9eae-ab7ef24b9f31	t	Gasambu	519ca734-49e5-48c2-bb3c-5699569ad700
ac25b3ab-3339-44f3-9955-97fff71302ba	t	Gashubi	519ca734-49e5-48c2-bb3c-5699569ad700
f8f18f32-2094-46d5-9c27-fae52d1b7988	t	Kampuro	519ca734-49e5-48c2-bb3c-5699569ad700
c9b7802f-c9eb-4a49-a5f2-9a903f1f344b	t	Kaneke	519ca734-49e5-48c2-bb3c-5699569ad700
f8459e50-dab8-44e2-a18a-461672a5c9b5	t	Kavumu	519ca734-49e5-48c2-bb3c-5699569ad700
3a0de339-74e3-4b30-b128-1242a48a240e	t	Nyarigina	519ca734-49e5-48c2-bb3c-5699569ad700
9a924527-b446-4798-9dc4-21aee8842949	t	Rugarama	519ca734-49e5-48c2-bb3c-5699569ad700
079e290f-7ae0-4865-bad2-a457027fe692	t	Kadurumba	61e7cf44-2ec0-408b-b8c6-2556d01a5437
b52dee27-d253-4a3a-a39b-3e41986ef8a0	t	Gitwa	61e7cf44-2ec0-408b-b8c6-2556d01a5437
405f9c23-1c60-42c2-9739-39a3835ff08a	t	Kabitoki	61e7cf44-2ec0-408b-b8c6-2556d01a5437
bdaba022-f93e-4d80-a336-1f228c03d5c0	t	Kigwa	61e7cf44-2ec0-408b-b8c6-2556d01a5437
645cc3e1-7fe2-484d-8b2f-dafc52b400d5	t	Akarambo	70447821-63f4-4018-a5ed-3546fb4d4213
f6d6b705-0da7-4d5b-8947-29dcc595d18c	t	Bazenga	70447821-63f4-4018-a5ed-3546fb4d4213
19c079d3-55c2-429c-87d1-5c2a53e3dd0b	t	Bitabire	70447821-63f4-4018-a5ed-3546fb4d4213
b19bc8f1-321c-4cd1-90be-4881a1f5cadd	t	Kamudahunga	70447821-63f4-4018-a5ed-3546fb4d4213
29dcfc62-b1d9-4003-9290-b28bab81a4a0	t	Kivumu	70447821-63f4-4018-a5ed-3546fb4d4213
23fa71c7-c163-4a3a-9938-87f4e0b747bb	t	Ryamaguri	70447821-63f4-4018-a5ed-3546fb4d4213
c3c15798-429a-4e29-a685-27f28c4c807a	t	Gahora	065dfaa8-116d-4cd9-8281-dd8cce04788c
10fa11a0-759c-4409-9fdd-88aa6208f11d	t	Kagende	065dfaa8-116d-4cd9-8281-dd8cce04788c
dd040abe-b311-4cd4-bd0c-ca6e71b8195d	t	Kirira	065dfaa8-116d-4cd9-8281-dd8cce04788c
04a97e62-d478-484b-950f-d43bc476b26d	t	Mpinga	065dfaa8-116d-4cd9-8281-dd8cce04788c
addd1d10-e483-478c-845a-c70e7c32d6cd	t	Rugori	065dfaa8-116d-4cd9-8281-dd8cce04788c
32d889b0-ad8a-4c5e-85c9-5edfa0769291	t	Taba	065dfaa8-116d-4cd9-8281-dd8cce04788c
645553ce-4cfb-4db8-95e0-51358932b883	t	Musekera	e5b22f42-f9aa-46f1-8a8b-28fbe45ba742
d8b7500f-5786-4180-9b1a-654228725750	t	Nyagasozi	e5b22f42-f9aa-46f1-8a8b-28fbe45ba742
2a1d241e-feec-4462-a74b-f20fd31fb16d	t	Rugogwe	e5b22f42-f9aa-46f1-8a8b-28fbe45ba742
d9df4100-a23d-4226-8274-bfb668827bce	t	Rwanzana	e5b22f42-f9aa-46f1-8a8b-28fbe45ba742
3c99234a-8ba4-434d-9856-5e6e205086b7	t	Byimana	4591df75-9921-421a-a29a-8c3ffb79d326
a7a99d8f-7215-4299-a585-f10d61f9e88f	t	Kamabuye	4591df75-9921-421a-a29a-8c3ffb79d326
53bee383-2e6b-4598-861e-ffc015d62b68	t	Gasyankingi	775e9d18-74d3-499b-a09a-c5d730d76b1e
5b230dc6-78fb-4fee-961f-ee7edc6549b8	t	Gitwa	8c28b0ce-47c8-4563-93c9-d1640efd3b17
7c8a8258-26b8-4546-aa62-f2381fa3daaa	t	Kiduha	8c28b0ce-47c8-4563-93c9-d1640efd3b17
cfe21743-2509-4bcb-a429-fcdcc3aee796	t	Kabeza	270f38a3-eb84-47c7-b281-44bd29bab8ce
6cc04dd9-41c7-4553-a246-80a304846c37	t	Rusasa	270f38a3-eb84-47c7-b281-44bd29bab8ce
cd0deccc-4c5b-4f12-b6d3-f39cab75981d	t	Agacyamu	d1b10ef1-d6b0-4456-a7c8-73739d49267a
26cdfea6-ca59-4d1c-91f4-65728d31425d	t	Akaruzi	d1b10ef1-d6b0-4456-a7c8-73739d49267a
6a649d01-5093-4d78-9875-939138b3af82	t	Kigarama	d1b10ef1-d6b0-4456-a7c8-73739d49267a
19f28335-6058-4d92-bfdf-05717ddd9614	t	Nkamatira	d1b10ef1-d6b0-4456-a7c8-73739d49267a
bcc4c3f7-4721-4448-a93a-60ab58f5e20c	t	Rwaza	d1b10ef1-d6b0-4456-a7c8-73739d49267a
cf569dac-874f-4579-a83d-7cdf258e0109	t	Shuni	d1b10ef1-d6b0-4456-a7c8-73739d49267a
3f0ef780-1fee-4f51-8bdb-8a8b150406d6	t	Kamutima	45982844-9a40-4aff-8cbd-f7f5d484d4e2
776d2cb3-5215-42d6-a9c9-09fc4d72fde9	t	Agacyamu	13758764-b0e2-4ae0-bebd-c6846237f992
1bf22d9f-d941-443e-9518-4d4590bccaee	t	Agahenerezo	13758764-b0e2-4ae0-bebd-c6846237f992
d1d22f0e-cf88-4776-9c0a-eefc952bcf7b	t	Agasharu	13758764-b0e2-4ae0-bebd-c6846237f992
793ae861-0287-4a6c-8ced-158a16e93cb1	t	Gitwa	13758764-b0e2-4ae0-bebd-c6846237f992
8bfff803-a8f7-4d99-bd48-0891fee5666e	t	Kanazi	13758764-b0e2-4ae0-bebd-c6846237f992
49032ddc-292d-431c-a753-68a73a2f3fb1	t	Kaseramba	13758764-b0e2-4ae0-bebd-c6846237f992
7fb8b574-641f-44b6-af02-090a253a7500	t	Kubutare	13758764-b0e2-4ae0-bebd-c6846237f992
c17a5ae6-d963-4ba6-b082-45d8e37f3fd0	t	Magonde	13758764-b0e2-4ae0-bebd-c6846237f992
eaf92a92-3e3f-4f42-88a2-313392c58945	t	Nyagasambu	13758764-b0e2-4ae0-bebd-c6846237f992
94ded833-d4c0-48f9-8812-323acb2ce95e	t	Nyanza	13758764-b0e2-4ae0-bebd-c6846237f992
2a2af037-d180-4cd3-9e41-54805d31c330	t	Sabaderi	13758764-b0e2-4ae0-bebd-c6846237f992
9444533e-c6e1-453b-954a-8536e23069e6	t	Gako	7c5da52a-84a1-49c9-9d85-3bac97be61e1
b3af4da4-1417-498e-9ba6-d8401ecbf62a	t	Gasongati	7c5da52a-84a1-49c9-9d85-3bac97be61e1
538f21e4-309a-46bc-a2fb-3ae13436ebe9	t	Gikombe	7c5da52a-84a1-49c9-9d85-3bac97be61e1
eac2db14-ccf1-4ce4-b5e4-6a81ac960efb	t	Karambo	7c5da52a-84a1-49c9-9d85-3bac97be61e1
c8d692e8-2d55-4a07-b346-60fd3390156d	t	Karuhayi	7c5da52a-84a1-49c9-9d85-3bac97be61e1
29283f3b-d584-4c97-b381-18750935f892	t	Kigarama	7c5da52a-84a1-49c9-9d85-3bac97be61e1
50990916-0560-4ea7-99d0-00ac3328bb3e	t	Ngobagoba	7c5da52a-84a1-49c9-9d85-3bac97be61e1
f6a5915b-7bcf-4a90-9615-caa82de9d0d3	t	Rwezamenyo	7c5da52a-84a1-49c9-9d85-3bac97be61e1
2a876b8d-4ec9-436c-bf7b-4550e62c8c29	t	Kibingo	5016c44f-e7ed-4015-ab22-7b56e0cb5724
df841411-52eb-48d4-a282-3f16de7d6efa	t	Mataba	5016c44f-e7ed-4015-ab22-7b56e0cb5724
1134acef-d3cf-403e-ad79-119e26378f22	t	Akarehe	7f18ffe9-6448-4d28-a7b3-91ba4eb1378e
b8760c6f-d963-4938-a87d-253c029ea299	t	Akarambo	418f9b2d-b82f-42f7-ad13-9d93ff387b57
522b4042-257e-423d-9af9-c33e1d14a9e5	t	Nyarusange	418f9b2d-b82f-42f7-ad13-9d93ff387b57
cc746310-ae12-4eb1-890b-652d66930316	t	Sangano	418f9b2d-b82f-42f7-ad13-9d93ff387b57
61bb307f-fb12-4acd-8b3a-d40d87611f4a	t	Agasharu	4343ed14-1394-4e4b-b723-3f6b83284c66
5057a979-3564-4138-8550-847de7d2add2	t	Nkoto	4343ed14-1394-4e4b-b723-3f6b83284c66
ee307ab8-5beb-47ea-8d9c-04bbb3e9395d	t	Zaga	4343ed14-1394-4e4b-b723-3f6b83284c66
b50734b8-de14-41c6-8641-9b4c96e51c25	t	Butare	862c0bb9-5a17-47ef-bc40-a7a4155c9b82
9901fe38-32a9-43b3-9531-c494621e4e14	t	Cyetete	862c0bb9-5a17-47ef-bc40-a7a4155c9b82
2ce53ba8-a0f7-4af1-925f-26b5c402e78f	t	Uwimpundu	862c0bb9-5a17-47ef-bc40-a7a4155c9b82
57456e73-a3c5-4ae4-bfeb-4c7be56a2976	t	Karambi	e3d94b91-3fd1-4221-9a7d-3a0c92e1cd70
fb70310e-ac2a-40b6-ac60-a76ad2643d59	t	Sanzu	29d179d0-52d1-478d-9af9-8f1bb04663df
1f810dc1-5364-40b9-9a6d-205e4edfca23	t	Kagarama	a0c04bdb-4c4e-44a4-9a72-3ea8a364e021
ce185ee8-e5e5-40d4-bf96-c9861a39a272	t	Gatovu	359cccf6-cab4-43db-ac0d-3bdcddc2fa5a
656edb12-a986-4b9b-a264-7f0e4ff95ade	t	Kabacuzi	359cccf6-cab4-43db-ac0d-3bdcddc2fa5a
fadbbf86-79f4-43d3-99d8-f310269f1833	t	Kabakobwa	359cccf6-cab4-43db-ac0d-3bdcddc2fa5a
a5c958bb-7bb8-4a35-932a-d19784ffb777	t	Rebero	1961dea9-6093-4bb3-8b76-0ecf2b2300b0
9efb6683-0399-4de1-b065-437ea6a2ad84	t	Rusenyi	359cccf6-cab4-43db-ac0d-3bdcddc2fa5a
0eae3cf8-e307-4aef-8f74-093e08dfcb73	t	Kabugabo	5066bdf9-8917-412c-9dc3-fdefeec7bbae
c7341b44-1b5a-4c97-92de-2864b3cd7fde	t	Karambi	5066bdf9-8917-412c-9dc3-fdefeec7bbae
bfdf5303-a34c-4449-86c3-2a83c2858838	t	Rugarama	5066bdf9-8917-412c-9dc3-fdefeec7bbae
6331afd4-6856-4dd7-9f15-8eb1e444b7bd	t	Birinjo	c158ea12-6154-4a44-8d83-074f70cd82c7
6fa64f7a-7e84-4f1d-9697-75b84952128e	t	Kabumba	c158ea12-6154-4a44-8d83-074f70cd82c7
41c96701-2e3a-4f0f-a625-2b1905f46279	t	Kanyurapfund	c158ea12-6154-4a44-8d83-074f70cd82c7
409c790e-13d5-4020-aec5-5c702aa44d07	t	Nyagahinga	c158ea12-6154-4a44-8d83-074f70cd82c7
feac7c19-b67d-480c-a253-d4966acc1146	t	Ruhinga	c158ea12-6154-4a44-8d83-074f70cd82c7
3cbce449-13f3-4329-826e-e4b718e7e68a	t	Ryaruhimbya	c158ea12-6154-4a44-8d83-074f70cd82c7
0027dd3b-c3dc-4a21-b7c5-9effbd19be12	t	Kabicuki	d38413ac-9be0-4bc8-81d0-6c6f4e73e42d
2055e38b-a714-4140-b7ec-786f0807b9ca	t	Nyamirama	d38413ac-9be0-4bc8-81d0-6c6f4e73e42d
2dbd6d56-d33b-4165-9038-78ba5b70a791	t	Gakoni	2ec03bf8-39bb-4541-9425-23671983e10b
6c5b4e57-7bab-46f5-9e0f-d46718d5cfcc	t	Nyarurama	2ec03bf8-39bb-4541-9425-23671983e10b
c39674a4-a687-45dc-ac67-3f58ed9aafed	t	Cyegera	75535fc2-abb9-4b5b-80e2-0af2140441dd
3ead26dc-8450-470e-bdf8-0423513485c6	t	Gasaka	75535fc2-abb9-4b5b-80e2-0af2140441dd
9e4b220a-ad5f-45bd-95ef-22ced2247648	t	Gihana	75535fc2-abb9-4b5b-80e2-0af2140441dd
d32f291e-dddb-40c8-8690-74d461e9ead7	t	Rugarama	75535fc2-abb9-4b5b-80e2-0af2140441dd
19a0bd99-643f-42d7-9ebd-478c868fa86b	t	Sogwe	75535fc2-abb9-4b5b-80e2-0af2140441dd
8bde61eb-2aba-48df-b971-6da3c90eaa41	t	Hanika	43e6e0f5-811c-4760-b22a-d4641be46514
d3fa6607-329b-4098-a076-2f56aa9e4a6a	t	Karambo	43e6e0f5-811c-4760-b22a-d4641be46514
8e6002bb-6fae-4587-aeae-12fdc9135571	t	Kinazi	43e6e0f5-811c-4760-b22a-d4641be46514
001ecb2d-1913-400a-af5f-00548849a0ce	t	Rubona	43e6e0f5-811c-4760-b22a-d4641be46514
845a1673-d8ed-416c-b1cc-541393e0c773	t	Kibiraro	7b83f27b-cd4d-4b45-8d3c-07a442e346f5
e001b8f8-3c99-4d5b-ae44-53daa12ace4c	t	Mujyejuru	7b83f27b-cd4d-4b45-8d3c-07a442e346f5
19fa0aa6-da07-4374-94bb-9c68c3713467	t	Munyu	7b83f27b-cd4d-4b45-8d3c-07a442e346f5
9bd03137-e63b-4c99-bff3-eebd5a879eff	t	Rwambariro	7b83f27b-cd4d-4b45-8d3c-07a442e346f5
de7d8bbd-9940-4b19-8bb4-5c01ed4a7e8e	t	Gahondo	3565e71c-eeb0-4159-a3ff-5efc0d08c646
06c10307-e3ff-4b73-9413-63b5e7711658	t	Giseke	3565e71c-eeb0-4159-a3ff-5efc0d08c646
996ca284-ab35-4db6-a79f-cf14182239f3	t	Kigarama	3565e71c-eeb0-4159-a3ff-5efc0d08c646
84a95173-2d0f-4f84-ae78-944802bed900	t	Mukuzanyana	3565e71c-eeb0-4159-a3ff-5efc0d08c646
0f1caa00-cdcf-4eb8-894e-b37b98bf756e	t	Nyabisindu	3565e71c-eeb0-4159-a3ff-5efc0d08c646
b1cc6e93-f349-4276-8134-0f936a72f093	t	Nyamiyaga	4b79ac10-868c-4f7e-b480-fe094447f514
99d67aef-f75f-4f65-804d-3252ac3cdb00	t	Gisagara	df3cfe73-976a-4090-a502-59a784643707
6bb74f11-08cc-41ca-8330-07cbedeff861	t	Kagoma	df3cfe73-976a-4090-a502-59a784643707
4b2d9688-7a0e-479a-89bb-b36f3064ad82	t	Kizi	df3cfe73-976a-4090-a502-59a784643707
6be54343-3d63-4695-aef3-cbdf68edef39	t	Agasharu	b3406473-6636-4184-a9da-86a96af0304d
9b7d43a0-d4c5-4608-bdbf-54542e9554bc	t	Akanyinya	b3406473-6636-4184-a9da-86a96af0304d
2abf85d8-e304-4c1f-a6eb-0e130c8ccf59	t	Bigangara	b3406473-6636-4184-a9da-86a96af0304d
eb395c62-51fe-4e07-81ae-9ca9b09232f0	t	Kanyaruhinda	b3406473-6636-4184-a9da-86a96af0304d
51c45596-4fe0-4744-9a69-4f462c00100b	t	Mpinga	b3406473-6636-4184-a9da-86a96af0304d
9a076069-d414-4ded-bf71-42a448f7d776	t	Rubona	b3406473-6636-4184-a9da-86a96af0304d
7ac82a1e-c452-4247-9d88-aa1b9575dfa9	t	Rwabuye	b3406473-6636-4184-a9da-86a96af0304d
da36abde-130c-4d7b-9c9d-85a84372284c	t	Gakombe	80651f50-747c-45eb-9496-8052e83fadd4
612a474c-598b-487f-9ff4-6f0a76305ffb	t	Gasharu	80651f50-747c-45eb-9496-8052e83fadd4
7f4ca03e-82b0-4e1b-ac7b-c49638227fba	t	Gicubuka	80651f50-747c-45eb-9496-8052e83fadd4
1002e6f8-d6d6-4623-8420-e136531d991c	t	Mpinga	80651f50-747c-45eb-9496-8052e83fadd4
fa467b46-03d6-4f07-a0fc-63407ae4fdea	t	Ndobogo	80651f50-747c-45eb-9496-8052e83fadd4
89cffefb-f803-4aa5-bbdc-a803b0aef2fc	t	Rwezamenyo	80651f50-747c-45eb-9496-8052e83fadd4
3a343aea-47d2-4025-ad4a-170c8ac37642	t	Kagera	8a453461-c313-4e8d-894e-2995220be6cb
1e778b6d-2eff-4836-8e98-c0a97f2ff4d7	t	Kigusa	8a453461-c313-4e8d-894e-2995220be6cb
125b71b8-836b-4bce-ac51-a7b0c813598e	t	Kimuna	8a453461-c313-4e8d-894e-2995220be6cb
f1aa04f3-df0a-4db4-81dd-d34fa913b9ed	t	Kinyana	8a453461-c313-4e8d-894e-2995220be6cb
26e3bc10-b049-4eb0-b0cd-69a26eb081ab	t	Rugarama	8a453461-c313-4e8d-894e-2995220be6cb
65f28cf1-ff41-4ce2-9c6c-ec9116adc236	t	Ruryango	8a453461-c313-4e8d-894e-2995220be6cb
29db1b65-5ccd-496b-8ac4-a857e2369ae4	t	Bumbogo	92a394a6-240c-4ebe-81f7-18397b563b5e
d77647bd-bef0-43ed-bc3b-20e67303a638	t	Gitwa	92a394a6-240c-4ebe-81f7-18397b563b5e
56bdae34-6e1a-4140-b93c-af52750beff3	t	Kaburuba	92a394a6-240c-4ebe-81f7-18397b563b5e
4446597e-4be7-40b0-b51d-e20cc633a4ab	t	Murambi	92a394a6-240c-4ebe-81f7-18397b563b5e
f6e980e9-17e4-4cc5-8d7d-6e51fe7ded2c	t	Taba	92a394a6-240c-4ebe-81f7-18397b563b5e
744da7e3-eceb-4c41-a195-f91451df88bc	t	Gahanga	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
ed3f06b2-3ad0-4e9e-92a4-6d4fe257e47a	t	Kamunyinya	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
35559f96-9f59-42a9-979e-cc338b5e0528	t	Kanzeyi	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
13aa3ab6-7313-4b4b-88ab-f9e8f6d4b315	t	Kibiraro	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
a9ea9e90-9165-409b-ae69-c0c2d673f74b	t	Kigarama	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
1c544873-2d6c-43df-a665-8c5fa55fd0ac	t	Mpinga	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
b99578ad-3274-4ff5-8785-568233e69098	t	Ngeri	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
a2bedc7c-fc07-4928-add1-7755681b9325	t	Nyabisindu	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
c659b84b-2b18-4937-b2dd-ca416a61e681	t	Nyamirundi	2c2efe89-5fc8-495a-9a64-98da73bb0f6a
b14c202a-a83a-4d43-9f5f-30360d280892	t	Buhoro	0374692d-b067-46ff-8864-3eec29230fde
3b61f4e2-a12e-44fd-9a71-81a810efdb03	t	Gitwa	0374692d-b067-46ff-8864-3eec29230fde
859dab8e-9413-4965-925c-0a4307a04357	t	Kibirizi	0374692d-b067-46ff-8864-3eec29230fde
c6fb1c41-ca94-4859-be77-922b32feee05	t	Cyingoma	0374692d-b067-46ff-8864-3eec29230fde
927bce5e-3e4e-4115-b9c1-4c2b8cf2e7d0	t	Ruhuha	0374692d-b067-46ff-8864-3eec29230fde
a93354aa-d1b6-4ae1-b6a7-633589e31e69	t	Cyahafi	db8e897c-db1a-4569-9360-a41ea54afbe9
66285d78-8b14-4937-bc58-b11b32b3b256	t	Gashikiri	db8e897c-db1a-4569-9360-a41ea54afbe9
5a1354fc-3571-4427-9d7c-7ef8585a8b6c	t	Kavumu	db8e897c-db1a-4569-9360-a41ea54afbe9
be950830-815b-43dd-afe6-37ca8937b2e1	t	Rupango	db8e897c-db1a-4569-9360-a41ea54afbe9
9b0a47cc-e933-4677-a62e-87825eeffba1	t	Bweramana	da1227cd-faf8-4982-ac4d-84dac56b6f69
1dfdb42a-7645-4b13-b1fd-c0f980b17840	t	Kigarama	da1227cd-faf8-4982-ac4d-84dac56b6f69
2974f7f8-f127-4896-852b-213ef4aa6cec	t	Taba	da1227cd-faf8-4982-ac4d-84dac56b6f69
82294a4e-32f7-4593-9474-5ca9a2db5085	t	Akagarama	b1160ba3-25bc-4a0d-bd78-b009204db17b
cfd13f7e-36ff-43bb-9001-e9f3c9ce7c5a	t	Akogo	b1160ba3-25bc-4a0d-bd78-b009204db17b
4c91dded-8c4d-491b-b87f-2f0426bc434d	t	Amasanganzir	b1160ba3-25bc-4a0d-bd78-b009204db17b
d4519424-b314-4b16-8322-2376a87fdaf1	t	Akabutora	b1160ba3-25bc-4a0d-bd78-b009204db17b
561eae7b-b51e-4ebf-a0fb-502b43c54d9f	t	Mpinga	b1160ba3-25bc-4a0d-bd78-b009204db17b
07be8b19-b456-435f-80ff-5134b0355d67	t	Nyagasambu	b1160ba3-25bc-4a0d-bd78-b009204db17b
7630a63d-caf3-4af7-b076-1b5f2bcbbf84	t	Akabuga	596dc10f-68f1-4baa-b287-09d2d3ebe7aa
8d85bf80-76ff-4d39-a98d-64dd469b0e69	t	Akamahinda	596dc10f-68f1-4baa-b287-09d2d3ebe7aa
5a554125-66fe-48c9-a530-81e2331c10e3	t	Gakombe	596dc10f-68f1-4baa-b287-09d2d3ebe7aa
f9b15489-7f90-4b2f-a8db-bc373f0206f9	t	Nyarusambu	596dc10f-68f1-4baa-b287-09d2d3ebe7aa
5dcbe39e-c7c8-4cc2-8ab9-f0a02265b95c	t	Agakera	4cda0929-8914-4237-aae4-8f6ed20600e3
423f3337-a6c0-4371-8d40-c18b6e83eb5e	t	Agakombe	4cda0929-8914-4237-aae4-8f6ed20600e3
4e4bb938-a7bb-4474-b9b3-b69ee4278eab	t	Gaseke	4cda0929-8914-4237-aae4-8f6ed20600e3
1f23b582-8a28-4a03-a96e-52d4564bf369	t	Kabahora	4cda0929-8914-4237-aae4-8f6ed20600e3
d7046002-d7c7-468c-b5dd-fb94ef51fe4a	t	Mpaza	4cda0929-8914-4237-aae4-8f6ed20600e3
a09baec1-5010-4fdc-b219-d61fe07bbff1	t	Nyamata	4cda0929-8914-4237-aae4-8f6ed20600e3
042b91c2-78f4-4efb-9d0f-e665b7fe9511	t	Rwinuma	4cda0929-8914-4237-aae4-8f6ed20600e3
685f8243-6703-4f99-82b2-f704bc806b36	t	Akabuye	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
deac3b79-bd13-4ac8-9bbb-f74270440966	t	Bukinanyana	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
591a7ce0-a2c9-4243-975c-4741a748d6c6	t	Buye	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
bbc346db-40b3-496d-857e-1164708c09fb	t	Gasoro	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
5257e1cc-0dda-4598-a374-a01cb7f7ba4b	t	Kabutare	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
f56747b0-224c-4939-9fdb-909b765473c0	t	Karubanda	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
ea475a9c-ed03-4606-b664-310e7dc6dfb8	t	Mamba	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
98a34caa-abdd-4b5a-ad5d-1204b565bc83	t	Busenyi	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
7de76074-3746-4617-9c42-767a0939ddbd	t	Taba	58fba5e2-e0f7-4057-ace8-6e1efe1d8370
5f6507eb-b821-45cd-bf5b-25f4ffc040cd	t	Gatoki	bf239682-1794-4d18-804e-e49f478f8a9d
c86c6fe5-3457-4e0c-9407-0095540f306c	t	Kaguhu	bf239682-1794-4d18-804e-e49f478f8a9d
b197e5c7-17e0-4d88-9931-bf0954c2eb06	t	Karambi	bf239682-1794-4d18-804e-e49f478f8a9d
2fc869bb-ccf9-4705-8e7f-260a89e05615	t	Nyabubare	bf239682-1794-4d18-804e-e49f478f8a9d
c03a83f4-b69d-48ae-bcc0-56afe8416102	t	Nyagapfizi	bf239682-1794-4d18-804e-e49f478f8a9d
98ed6ebe-ad39-4288-8bb5-ff6426168ff6	t	Rugarama	bf239682-1794-4d18-804e-e49f478f8a9d
914df834-6135-4c0b-9246-91ae21db43bb	t	Runga	bf239682-1794-4d18-804e-e49f478f8a9d
dceb22f5-949f-4cb4-84ee-d731e458d9c1	t	Gafurwe	52f65bef-9116-455d-965d-185589d0a8da
ff7508d0-82e8-4c61-9e82-7e7a9a000c3a	t	Kabeza	52f65bef-9116-455d-965d-185589d0a8da
5cd852ad-fdf8-4704-aae7-2df8400d97c3	t	Kamucuzi	52f65bef-9116-455d-965d-185589d0a8da
30cd545c-060d-4d57-9973-1e05e0cd538f	t	Nyabitare	52f65bef-9116-455d-965d-185589d0a8da
d9daceb9-da7e-411a-ae43-14026668efd3	t	Rurenda	52f65bef-9116-455d-965d-185589d0a8da
3d339693-73c0-41d6-89ca-b162aa8b9c08	t	Rusisiro	52f65bef-9116-455d-965d-185589d0a8da
fe85e9bf-b23b-41aa-8cf8-1463a457398f	t	Ruvuzo	52f65bef-9116-455d-965d-185589d0a8da
ef336487-6177-4126-88f2-e7b7cc5c0ac2	t	Ngoma V	bc773ca6-2cec-4439-9f79-ed53af08c6ad
7325f348-7c31-4747-8c4e-7b6844be2ad9	t	Ngoma I	bc773ca6-2cec-4439-9f79-ed53af08c6ad
6cb10b55-5398-43c9-b589-f45611fe9148	t	Ngoma III	bc773ca6-2cec-4439-9f79-ed53af08c6ad
9a6ba94f-ddad-427e-bfa3-1182c57f7683	t	Ngoma IV	bc773ca6-2cec-4439-9f79-ed53af08c6ad
82b5cf22-bd04-4d8b-8948-28c83300ac82	t	Ngoma VI	bc773ca6-2cec-4439-9f79-ed53af08c6ad
5e0c03f4-234c-47c8-9870-94afd06a0991	t	Ngoma II	bc773ca6-2cec-4439-9f79-ed53af08c6ad
7ff054dd-c234-44d7-87fb-8138b0d10d2f	t	Dutare	cfd0f71f-26da-4ce7-bc9f-816c4e257cb8
2c7659f6-b08a-41ac-8eab-7a188c7e557d	t	Karambo	cfd0f71f-26da-4ce7-bc9f-816c4e257cb8
e6d0ff3d-ed73-4683-a71d-bc275ae23f35	t	Kigoma	cfd0f71f-26da-4ce7-bc9f-816c4e257cb8
b0d8d1d6-8b15-4f5d-8114-3b067270e9ea	t	Kiyanza	cfd0f71f-26da-4ce7-bc9f-816c4e257cb8
e186f4f7-68e0-47a7-8000-6d0b5e5cdd00	t	Murama	cfd0f71f-26da-4ce7-bc9f-816c4e257cb8
fbd891f5-4c41-4e8b-a8d1-bede8e78cacb	t	Kampogo	666df64e-02ea-4abf-a747-95458d83ea87
a54bad71-8f95-4f27-88a5-954d9964df3c	t	Karambi	666df64e-02ea-4abf-a747-95458d83ea87
b46ff5d3-e8a5-44f3-ac81-6afc65dfb016	t	Rukubiro	666df64e-02ea-4abf-a747-95458d83ea87
6fcfb9ec-26cf-4c37-88b9-ffeb75104542	t	Umuyinza	666df64e-02ea-4abf-a747-95458d83ea87
76943633-6978-49dc-83d8-42fc4a51d4f4	t	Bwankusi	9c11cef6-d084-4d58-bdbb-b3381f95900c
21e4c5a4-8d95-48fd-911d-7d7c68da35a3	t	Gashikiri	9c11cef6-d084-4d58-bdbb-b3381f95900c
c2091917-de90-4aaa-a895-4e77e1160e1a	t	Gitwa	9c11cef6-d084-4d58-bdbb-b3381f95900c
57e592a6-a111-4dd2-bd43-8a2733deefd6	t	Karambo	9c11cef6-d084-4d58-bdbb-b3381f95900c
3f27784c-0105-4738-903a-483582fc574e	t	Rwamara	9c11cef6-d084-4d58-bdbb-b3381f95900c
cd69fbad-9bf2-4b64-be06-e862768ab8cd	t	Agasharu	84e7bd58-bbfb-4d15-9035-9d21e87ab694
6e29e2a7-bde5-4869-bd62-20c46d8950f8	t	Kinziramuhin	84e7bd58-bbfb-4d15-9035-9d21e87ab694
ec152417-fb2f-4b66-b3c3-81b48eca4fc8	t	Nyakabingo	84e7bd58-bbfb-4d15-9035-9d21e87ab694
3a7a0e8e-7100-4031-9906-f86538f1c122	t	Shyara	84e7bd58-bbfb-4d15-9035-9d21e87ab694
165dac41-72bc-44ea-83b4-5ff2ade764cc	t	Taba	84e7bd58-bbfb-4d15-9035-9d21e87ab694
73ecdce8-d51c-4e82-a209-c416dbb927b7	t	Akanyana	9603b59e-9730-4c50-946e-fbb595d72dd8
495ea9f6-946e-4d4a-b707-708ff36b05fc	t	Mbagabaga	1c627ac8-3cd0-4e7c-98be-f8d1dcbe8035
13eb8d63-c1e8-468d-8ec0-fd3fab5a04e7	t	Impinga	a834ce83-a295-4558-bb13-d8c07da8934a
a6626219-ea09-41d7-8e5b-f2b528e88d82	t	Kanyirankuba	a834ce83-a295-4558-bb13-d8c07da8934a
35052b99-68ea-449f-ab91-ac2d56b63f53	t	Mucunda	a834ce83-a295-4558-bb13-d8c07da8934a
9b2e9460-10be-4b32-9f40-e6e246a12fe7	t	Kabuga	42037961-81a9-4431-81a3-089835512348
a5e932d6-36a5-4297-8ac9-eef048687eb1	t	Kigarama	42037961-81a9-4431-81a3-089835512348
f0a1a01a-0b58-4b33-9d9e-42cc864da7c0	t	Kigari	42037961-81a9-4431-81a3-089835512348
df3c95aa-a69e-4d93-ae3d-da0953599fc4	t	Mubuga	42037961-81a9-4431-81a3-089835512348
7405a660-6941-4752-b6a8-6d844bdc1c90	t	Ruvugizo	42037961-81a9-4431-81a3-089835512348
4daad621-430b-4d08-8ab4-3ef373c16aca	t	Kagasa	c93f1f27-2eaa-432c-b187-28ecaf483fd3
142ddcca-dd39-4e34-ad31-839da2b755e8	t	Kavumu	c93f1f27-2eaa-432c-b187-28ecaf483fd3
6952ea3b-4166-4cfa-b350-c4c0a955f888	t	Kigarama	c93f1f27-2eaa-432c-b187-28ecaf483fd3
2f288403-c9f6-4dae-8503-34889c02d840	t	Ndyome	c93f1f27-2eaa-432c-b187-28ecaf483fd3
7d2b92a5-a30e-41ba-b316-2eab8eb4d7e7	t	Nyakabuye	c93f1f27-2eaa-432c-b187-28ecaf483fd3
1a3614b0-bcbb-485b-b190-32da09314730	t	Rubanga	c93f1f27-2eaa-432c-b187-28ecaf483fd3
5565ad60-965b-4ce1-a151-d081ee6db5fc	t	Kamabuye	e01d0315-5c1a-4069-a99e-33375bf27ecf
1c3d757d-822a-47c3-96e1-248327558dba	t	Kimigo	e01d0315-5c1a-4069-a99e-33375bf27ecf
ef1ccdbf-9e33-4cec-8a0f-16dec49e9cb6	t	Murambi	e01d0315-5c1a-4069-a99e-33375bf27ecf
1784ff50-ab72-44ac-a961-cba865bbe5e8	t	Nyabusunzu	e01d0315-5c1a-4069-a99e-33375bf27ecf
5cfa5d95-bc0f-4681-8fd4-b3838dbd4a01	t	Rwamuganda	e01d0315-5c1a-4069-a99e-33375bf27ecf
9cf01791-94da-4e53-aa9f-bd984b23dc3d	t	Agasharu	c415b8ba-3283-4c39-9687-1b1939ff7a95
0372bdd2-e50e-4272-8b69-b835ec6e57b6	t	Impinga	c415b8ba-3283-4c39-9687-1b1939ff7a95
19030e85-9e7a-4118-934a-f72861819caa	t	Nyagasozi	c415b8ba-3283-4c39-9687-1b1939ff7a95
84dc7aa2-9e82-4a5c-b906-f6344cc0c915	t	Nyarucyamu	c415b8ba-3283-4c39-9687-1b1939ff7a95
239ccc84-2f3b-4eac-907e-e854ed0b0f39	t	Nyarugenge	c415b8ba-3283-4c39-9687-1b1939ff7a95
3d27ccfe-ec8d-4b2d-b977-90892e905335	t	Rubona	c415b8ba-3283-4c39-9687-1b1939ff7a95
9b5f26f3-6c94-47d8-8ada-a761d01d4a9a	t	Tumba	c415b8ba-3283-4c39-9687-1b1939ff7a95
71b38f6b-4ed6-43f0-955e-d30da5a79b98	t	Gicubuka	0f75b848-1fc9-433e-aecb-1e1dc190dd05
17be0556-8086-4c5b-b2af-fbe6ebdd7bb2	t	Amarongi	1ee7f3f0-c653-42e0-9f1d-4254128c8538
6c21d77e-7950-45bb-8578-3c413c53a523	t	Gatwaro	1ee7f3f0-c653-42e0-9f1d-4254128c8538
52a3cc2a-a030-4e1c-a202-afd34424b746	t	Nyakabuye	1ee7f3f0-c653-42e0-9f1d-4254128c8538
d8754308-a4c3-4ea8-9cdd-9ef679678467	t	Rumana	1ee7f3f0-c653-42e0-9f1d-4254128c8538
53a0f557-bbf2-4e90-88c2-1caea256b51a	t	Gakomeye	6c33f198-202e-489f-90ec-7d2a5e640754
12b6f395-32ae-4a86-81b7-ed87eaaa9a8d	t	Kamwambi	6c33f198-202e-489f-90ec-7d2a5e640754
1b119a2d-d3a2-4e64-884b-9e607d96ad6b	t	Karambo	6c33f198-202e-489f-90ec-7d2a5e640754
2078299d-9c57-49ff-a529-b5578d0d1dfb	t	Remera	6c33f198-202e-489f-90ec-7d2a5e640754
3d3260ed-9870-48aa-988a-5f99244a0966	t	Rurembo	6c33f198-202e-489f-90ec-7d2a5e640754
abc64ef5-b994-40b5-8a21-e48cb4308456	t	Murehe	de0ce24e-d08d-4fb3-b42e-36250303d57e
4aee6cbe-193d-4efb-9a38-56cf7c482e2a	t	Nyabisindu	de0ce24e-d08d-4fb3-b42e-36250303d57e
85db1d72-d4a0-46f6-abae-d0344fbe1c57	t	Gafurwe	de0ce24e-d08d-4fb3-b42e-36250303d57e
a064382c-8d87-4326-8da3-306457629045	t	Nyarunyinya	de0ce24e-d08d-4fb3-b42e-36250303d57e
81405999-aa15-4a1e-9bd8-86d74dfae9d2	t	Murango	1f47b6b5-effe-4928-a30f-ab8c1cd38130
04b24c2d-dd65-49ab-a7af-87fe0123aded	t	Bweramana	deeaec71-87ed-41f0-8c2a-62341b00c1cc
b8c84782-c852-484f-8acd-7bfa7d353c20	t	Kigarama	deeaec71-87ed-41f0-8c2a-62341b00c1cc
e1f792a5-8042-4929-8da2-ae77f7655d5f	t	Munanira	deeaec71-87ed-41f0-8c2a-62341b00c1cc
37dacdbc-56e9-469e-b69d-3d7e27e1acbd	t	Nyagacyamu	deeaec71-87ed-41f0-8c2a-62341b00c1cc
1e11ca81-f387-4aff-b486-75340f9c4f2c	t	Nyamabuye	deeaec71-87ed-41f0-8c2a-62341b00c1cc
a8a288ab-6880-4f6e-b6d4-ae5025289d3e	t	Gasharu	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
77173af2-ba0c-4cc5-bf30-48bd90e37299	t	Kibara	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
bcf51abf-05cd-4374-8b2d-584dc9fe38ca	t	Kigarama	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
ecd78db4-2fef-4cc4-9d68-21b227f1275e	t	Murambi	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
f6f31f8f-0b72-4181-909d-0bb4961baf50	t	Mwezi	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
0ad12b2d-ff22-4d96-abb9-2cb137d9e187	t	Nyabujengwe	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
70bd7262-4bf1-400e-8702-2b3cb93e6739	t	Rugarama	3b4a1e58-ea22-4cfb-89a4-fee9485ad3e6
08458b6c-a8b7-48ec-978a-4531a3915b82	t	Karama	81791391-c885-4588-851f-dd4270e03189
0309dd8c-543d-44e1-b920-5f3691a88246	t	Karugumya	81791391-c885-4588-851f-dd4270e03189
ab3fd508-f9ea-47d3-96d9-35351730aa5a	t	Kiboga	81791391-c885-4588-851f-dd4270e03189
ceac2b9c-99cd-4e48-878e-8b44ea0dcd99	t	Kigarama	81791391-c885-4588-851f-dd4270e03189
c46ff953-c614-4723-bb44-7522cad1d3ae	t	Rugarama	81791391-c885-4588-851f-dd4270e03189
14f5a54b-0ee3-4c32-8d55-18e415d67b1b	t	Bisambu	1f3d165b-eac0-4dca-b361-1062c80624fa
9f76870b-f8ff-45a2-ae74-32f8c1dbeb46	t	Cyendajuru	1f3d165b-eac0-4dca-b361-1062c80624fa
8a8e65f2-f5a2-47b4-9b2b-fc74ef2533ed	t	Rugarama	1f3d165b-eac0-4dca-b361-1062c80624fa
5447495a-c4ea-4a74-9302-c6a671793931	t	Rwatsi	1f3d165b-eac0-4dca-b361-1062c80624fa
c9196c50-45fc-47c4-a72e-b39bd4a54e0d	t	Bwiza	c554a548-ded3-47ac-8726-f21d48aa44fe
53e7260f-b0fa-401b-8839-80abb45de4bc	t	Maliza	c554a548-ded3-47ac-8726-f21d48aa44fe
ed86dcba-1971-40a3-9e95-8b783f535c57	t	Muranda	c554a548-ded3-47ac-8726-f21d48aa44fe
974484a6-787d-4791-a557-f9022374debf	t	Ndago	c554a548-ded3-47ac-8726-f21d48aa44fe
81b94684-31ff-42db-b1d5-71051fa765a3	t	Ntobwe	c554a548-ded3-47ac-8726-f21d48aa44fe
41ed3c46-3caa-484e-8c20-24281dc9afe1	t	Rusuma	c554a548-ded3-47ac-8726-f21d48aa44fe
f77a0b31-8bae-42d4-855b-f03c70dcedc7	t	Nyamirama	b5e3cebc-3e92-4de0-94d0-d44a18f5e936
735f00c5-c45d-4e2a-9e64-1214cd80eb36	t	Rugarama	b5e3cebc-3e92-4de0-94d0-d44a18f5e936
09949e24-4b95-4320-830a-0ecd700992d1	t	Agahora	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
f766cee2-d939-4d7e-9975-661476e0bc71	t	Agasengaseng	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
d48a9ac0-6d10-454b-ad21-ac9cd8d72b56	t	Agasharu	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
f93770ca-4533-4aaf-9fb5-469c975b7fe0	t	Agateme	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
bcb44ecb-5abe-49f2-9f3d-37c05375807a	t	Icyiri	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
cb830d6e-9723-4e70-86be-c31b497b7863	t	Kabeza	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
7e7d324c-99cf-457f-a575-7973d2c82fd2	t	Kigarama	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
9fdb8bc5-5850-4e5a-861b-031129110fda	t	Taba	9409bbf7-a7f1-4d7f-9ca4-8098ee8a2557
97e99f0d-eebf-44f5-b1ae-7f126736bfed	t	Abizerwa	6853ff61-14bd-412d-8249-793db38b4a98
0d92e78d-597e-427c-94bb-af5b72783baf	t	Akamuhoza	6853ff61-14bd-412d-8249-793db38b4a98
08a5bdb5-f8bd-4fb8-b2a7-7921da51489c	t	Amahoro	6853ff61-14bd-412d-8249-793db38b4a98
8f80c615-ffbf-4d53-8989-c1e2c0dd22c6	t	Ubumwe	6853ff61-14bd-412d-8249-793db38b4a98
ce825087-0d92-4b87-b4c0-2c6ba444f681	t	Ubwiyunge	6853ff61-14bd-412d-8249-793db38b4a98
da0062f7-f701-4171-8877-4483834173d7	t	Gasenyi	27fada52-2916-46ad-b22a-d2dc53649b53
49664d1b-5429-4020-9da9-3d1523710e62	t	Berwa	27fada52-2916-46ad-b22a-d2dc53649b53
e2cdaba4-8488-4cdc-a5d2-3c33c3d762c0	t	Nyarurembo	27fada52-2916-46ad-b22a-d2dc53649b53
6bfa2553-2709-4c5a-97f3-19587131f082	t	Rebero	27fada52-2916-46ad-b22a-d2dc53649b53
2f4c57f0-139c-4550-b521-7458b68bc97f	t	Rimba	27fada52-2916-46ad-b22a-d2dc53649b53
f71609cc-9096-4dad-b59d-a48e1b14f863	t	Agasharu	459c2cf7-d30f-4f8d-88f1-636e757af158
47fbb5e6-1eea-4e89-ac71-5241c71e76f2	t	Akabuga	459c2cf7-d30f-4f8d-88f1-636e757af158
68e79bdb-7352-4325-85f3-3c85ed358957	t	Akarugiranka	459c2cf7-d30f-4f8d-88f1-636e757af158
17e4d4f4-5996-491a-a4c1-73ab03cacd03	t	Kigarama	459c2cf7-d30f-4f8d-88f1-636e757af158
0097c203-d827-457c-b8d4-55e31cb20335	t	Musange	459c2cf7-d30f-4f8d-88f1-636e757af158
57555483-1a64-4258-86e1-2fe062ddb88f	t	Runyinya	459c2cf7-d30f-4f8d-88f1-636e757af158
05d77aa1-0aa2-486a-8265-8094718cefd1	t	Rwanyanza	459c2cf7-d30f-4f8d-88f1-636e757af158
9241ed69-c866-4f8b-8f4b-81246e17b83a	t	Akabeza	8877d7c9-ee05-4990-b248-b627b67c0964
0a495be1-b24d-4389-9a11-ec4ef817815e	t	Akakanyaman	8877d7c9-ee05-4990-b248-b627b67c0964
6407450e-ec8d-409b-acae-9c2746eeefc0	t	Byimana	8877d7c9-ee05-4990-b248-b627b67c0964
aeda7861-5832-4ad6-8b5d-ba0562f8b08f	t	Kigarama	8877d7c9-ee05-4990-b248-b627b67c0964
11a16472-7790-47cd-9a08-9b90b612a3c4	t	Ntangarugero	8877d7c9-ee05-4990-b248-b627b67c0964
6dda41d1-a40a-4696-aa6e-67dcb5c05a4d	t	Urugwiro	8877d7c9-ee05-4990-b248-b627b67c0964
42476779-bb23-49e4-b532-870df986ffc6	t	Kagarama	a9d40bb6-6e99-4a5d-8246-d3a969b6ee74
b222f49c-d3b4-4d20-9a89-b19a914a57e1	t	Nyagasozi	a9d40bb6-6e99-4a5d-8246-d3a969b6ee74
73c9ed1f-3a03-42f3-baaf-d7b4dc5db698	t	Nyarunyinya	a9d40bb6-6e99-4a5d-8246-d3a969b6ee74
f3ee100a-e1d7-4e48-85a9-fe5ed9f37aa9	t	Kibanza	c788e2bf-3aee-4345-93b9-3dc6f9beb7a3
1658a0fb-18ec-4dca-8ac7-ee7949ba0bd7	t	Kidaturwa	c788e2bf-3aee-4345-93b9-3dc6f9beb7a3
7a933c11-2415-4399-bf99-387eb22f45a1	t	Buhoro	b635914c-9edc-4a91-9915-1f081945e8ac
0cbf162a-e89b-462b-a1f9-b4f186e9b836	t	Mushimba	b635914c-9edc-4a91-9915-1f081945e8ac
1d9b61b6-a05d-4e27-bb1b-8475981ff341	t	Rugobagoba	b635914c-9edc-4a91-9915-1f081945e8ac
f2f32057-9ea3-422c-b9a3-4ec6b5ff6287	t	Kamonyi	c209338d-4c06-4862-83d7-728badb0ff45
a14a1906-6be9-4f6d-8420-ab582b7c7444	t	Mataba	c209338d-4c06-4862-83d7-728badb0ff45
e1ba0ab6-2131-4431-996e-68b57ca432dc	t	Nyamugari	c209338d-4c06-4862-83d7-728badb0ff45
fdb8f98c-2a62-4ae7-b3ae-bbf9db6af069	t	Rubona	c209338d-4c06-4862-83d7-728badb0ff45
fbaf2f64-4cc7-49ee-ab67-6cc3edb0593b	t	Kajevuba	863329e3-9652-48e3-a128-a199aa067de3
9e322e54-1dbf-4237-9362-0efce8c77b84	t	Kinkeri	863329e3-9652-48e3-a128-a199aa067de3
b10d2de5-2d81-4b22-bfdd-4fdba9299ca5	t	Kokobe	863329e3-9652-48e3-a128-a199aa067de3
82068aa3-9987-49cf-b102-c523de5fface	t	Ryagashaza	676e0bfe-014c-43de-8622-4c130a550537
9b4b1bf1-d1f6-4413-9d61-9efa3df02f23	t	Nyamitanga	8888b9fb-bb58-4275-9941-8af0c238c549
b005de90-d76b-44ac-b16b-62ce0d25407c	t	Kavumu	7abcd1d0-fa92-4675-94c9-315632a3f1ca
5466cce1-11b9-43a9-a315-9c1bdc897443	t	Remera	42e8b706-31d6-4f70-b113-6e7aafab6eba
d09c84c2-414d-4308-9c92-6b0d65465357	t	Gitwa	979d0bca-525f-4065-9584-91b92aa8f021
df848874-e93c-4006-bcc4-d28f89862fd7	t	Ntwari	979d0bca-525f-4065-9584-91b92aa8f021
8917937a-e16f-4d0e-9f20-56f7689afc93	t	Rwishywa	979d0bca-525f-4065-9584-91b92aa8f021
0d6af8cf-e9b8-46fb-8cbf-b4c43e42bd17	t	Gitwa	b2442687-9015-4f94-8fd3-3011830a364f
8555b2ed-8163-4325-9b8e-fda97f8e6ad7	t	Gasasa	57bd0239-a431-4b20-b4d0-6fa7bb6078a4
2e32887b-c1ba-4ea6-b101-f55bc21aeca5	t	Nyarubaya	57bd0239-a431-4b20-b4d0-6fa7bb6078a4
8e317b34-52d3-4c57-8e45-d664c33cc929	t	Nyarunyinya	0e2eaf92-6f0f-4703-8b0c-a83bf93033aa
4f6fb572-9487-42c5-8870-2fbf062d8514	t	Mirehe	17d8fc15-5509-476c-8a8d-3152a31253ed
dedbf33b-0e66-47e8-afcb-1ef796b246ca	t	Ryamanywa	17d8fc15-5509-476c-8a8d-3152a31253ed
0824a2db-c38b-4c13-857e-b5a4a3be2a51	t	Kaje	3196d26c-65f4-4a59-9955-4ea4df0e3467
46aa8395-a9af-4210-80c4-3f5fb35f6831	t	Munini	a4609757-eb09-4c02-8e42-321e6bc1662b
e5c79bc2-5766-4c0b-808e-2b290a5435fc	t	Bihenga	cbb02a1c-b832-4459-956a-f9fc58586e97
8edad7d7-7a1d-41aa-904b-37ffb999da89	t	Cyeru	cbb02a1c-b832-4459-956a-f9fc58586e97
9d9ec148-8712-44f6-a3fa-15441f7f5a2b	t	Mataba Sud	cbb02a1c-b832-4459-956a-f9fc58586e97
27987b88-216b-47ed-bd5b-a558552440b7	t	Runzenzi	cbb02a1c-b832-4459-956a-f9fc58586e97
765c30be-60e4-4fd5-8351-744b7f25cdcf	t	Kigorora	f9bc44be-f01e-45b5-bc62-6c8d2479760a
a7f8a179-df28-41b1-8cb3-8864eb42e6ed	t	Mbati	f9bc44be-f01e-45b5-bc62-6c8d2479760a
7bacc139-ae15-4586-a701-2e5d907d9a2a	t	Kagasa	3ff15cdd-52f9-4a73-919d-e46b7f92c163
177ea5ef-9b8d-403d-ace4-4313c2eea0bb	t	Kireka	3ff15cdd-52f9-4a73-919d-e46b7f92c163
169d2d59-4e71-4b1e-97d2-e7528235fb8d	t	Mparo	3ff15cdd-52f9-4a73-919d-e46b7f92c163
220a195c-2588-427b-8d9d-15ab3bedc6a8	t	Mugina	3ff15cdd-52f9-4a73-919d-e46b7f92c163
a63a692a-9b5d-444f-9707-e0c26ed7dcef	t	Gishari	174c5d35-fc05-4db6-8ccf-a8b5ab2f55fa
092ccc5f-0bb5-4970-820a-e4309b363204	t	Kona	174c5d35-fc05-4db6-8ccf-a8b5ab2f55fa
05ab9d20-eddd-4f18-b689-4ad6013dab33	t	Ntasi	174c5d35-fc05-4db6-8ccf-a8b5ab2f55fa
97cbf23b-0273-4236-a438-f3f220664e25	t	Nyagisozi	174c5d35-fc05-4db6-8ccf-a8b5ab2f55fa
a4cebfeb-05d2-4d22-a0d3-b38fc6e386d8	t	Rusoro	174c5d35-fc05-4db6-8ccf-a8b5ab2f55fa
8c04bde6-d727-40e8-a771-03d820f381a7	t	Busasamana	1c6e2bb0-a1bb-4e4f-8b9d-f1b80995f346
a5ef212d-4e68-49df-8b87-66b05bdb4dbb	t	Gihembe	1c6e2bb0-a1bb-4e4f-8b9d-f1b80995f346
7e5541d7-9e85-4de8-bb1a-7ce5f007cb2b	t	Reramacu	1c6e2bb0-a1bb-4e4f-8b9d-f1b80995f346
13101db6-8b04-452a-99ca-56dfa1448db4	t	Bimomwe	4c5f3179-3dce-4602-91d1-53627a382881
0f336585-47d9-41e5-90f2-c3cf2cecd592	t	Shaka	4c5f3179-3dce-4602-91d1-53627a382881
5fc5417f-158a-4dba-af60-7534a8990308	t	Kamayanja	b2351573-f448-4fd5-8ad7-8e549667ae78
fae420ba-4ef7-4815-b229-89d5dd7db99b	t	Nyarusange	b2351573-f448-4fd5-8ad7-8e549667ae78
69049096-a7fe-4fa2-93d3-ee94e5bae04d	t	Nyarutovu	b2351573-f448-4fd5-8ad7-8e549667ae78
ad1f6ce4-2e72-47fa-92f1-caa7d5675edc	t	Rubanga	b2351573-f448-4fd5-8ad7-8e549667ae78
3cba1dc3-b9bf-4a2d-af09-b77ded1809e1	t	Gitega	36d10304-0b20-403d-90fa-09d90d1fbe00
5c638758-e1f8-4059-b110-9616a5628bb8	t	Munazi	36d10304-0b20-403d-90fa-09d90d1fbe00
07efda40-4086-40ab-9847-99963030bf6a	t	Nyagisozi	36d10304-0b20-403d-90fa-09d90d1fbe00
d9430d47-e0f4-4482-b76e-f8f9e3ae3aca	t	Nyerenga	36d10304-0b20-403d-90fa-09d90d1fbe00
39639570-9569-40d0-836a-75196d9acf3a	t	Wimana	36d10304-0b20-403d-90fa-09d90d1fbe00
a6afdb61-4cd1-4c60-b4d2-a91ea4d33337	t	Kabere	cab1ac7b-a9dd-4681-877d-abc1beb87a8a
f6e89bb0-7ebc-4485-bc4a-8bf85d1f26c7	t	Kingoma	cab1ac7b-a9dd-4681-877d-abc1beb87a8a
f3549570-0298-425b-bef7-f9612485533e	t	Nyarubuye	cab1ac7b-a9dd-4681-877d-abc1beb87a8a
75019fff-3f74-4283-996b-06b085da8603	t	Ngoma	85e833c5-06be-425f-abb4-f59a1165f287
6eec0bdf-30e9-4da7-8c5f-43d7c28d68b1	t	Nkomane	85e833c5-06be-425f-abb4-f59a1165f287
1f769fe1-6c68-4d6b-afe4-bacad001434d	t	Nyamirembe	85e833c5-06be-425f-abb4-f59a1165f287
846e47db-08a4-49e4-819b-af8f1f818879	t	Cyimigenge	5667bf3f-f053-46c4-8ac1-a5e32629255a
8a9eed41-f069-4031-be87-6ceb2660dab7	t	Fukwe	5667bf3f-f053-46c4-8ac1-a5e32629255a
bb147b6e-5e78-4eae-87e8-c0d9827debc2	t	Musenyi	5667bf3f-f053-46c4-8ac1-a5e32629255a
8306217f-b22f-465a-b5c0-81205a27f39e	t	Raro	5667bf3f-f053-46c4-8ac1-a5e32629255a
443fb373-7c95-4833-b730-55bff847c728	t	Bigobe	29062adb-5259-4bcd-98d9-c3336c3cafff
610f2880-4a70-421b-a220-8746bb7cf139	t	Gatare	29062adb-5259-4bcd-98d9-c3336c3cafff
a712a6ad-8528-472c-82ae-80a9f876392d	t	Gatwa	29062adb-5259-4bcd-98d9-c3336c3cafff
9f5b9882-8fac-44b6-8a8e-cd93b315787d	t	Kabande	29062adb-5259-4bcd-98d9-c3336c3cafff
4f2b3c6a-ab78-4b43-b0d5-7f3d3683d7f3	t	Kajevuba	29062adb-5259-4bcd-98d9-c3336c3cafff
399d0ccc-1529-4410-9c36-23c7715b098a	t	Munoga	29062adb-5259-4bcd-98d9-c3336c3cafff
a877cb19-b784-43f2-8a35-509b85cc492b	t	Gahinga	c7f81d6b-6015-4dbc-8b99-e7a98300997e
58023a41-235a-4920-88e1-8b81a3590675	t	Kabagogo	c7f81d6b-6015-4dbc-8b99-e7a98300997e
6732f4f4-09f4-4a69-af29-cedc99e5e5f6	t	Byenene	5f6e0501-54f9-4c28-8583-32e1b82bce83
96ee2364-210d-429f-afc0-70c339f06fa7	t	Karubanda	5f6e0501-54f9-4c28-8583-32e1b82bce83
fdd3e1f0-ba2c-41c3-9fe4-6c0cd1a9ab90	t	Murambi	5f6e0501-54f9-4c28-8583-32e1b82bce83
429105a7-bb32-40b8-83bf-c58ce62415c1	t	Nkimbiri	5f6e0501-54f9-4c28-8583-32e1b82bce83
b1023d22-6c3e-4e77-bc81-4a250668160a	t	Bumbogo	e5ca7d99-6316-4685-b1a8-dd412650bf0d
c9d1461d-6b24-430a-bd8e-d8d22d379bd5	t	Buye	e5ca7d99-6316-4685-b1a8-dd412650bf0d
9cf92c8f-9c30-4196-a8dd-acd4ee631970	t	Gacumu	e5ca7d99-6316-4685-b1a8-dd412650bf0d
bb1c4fa4-666e-49cc-9fae-23290301e8aa	t	Kigabiro	e5ca7d99-6316-4685-b1a8-dd412650bf0d
bc21adfd-98c6-4360-a521-d2adecea4be1	t	Mukuyo	e5ca7d99-6316-4685-b1a8-dd412650bf0d
745950b1-d253-4621-ae98-53fab077a86e	t	Murehe	e5ca7d99-6316-4685-b1a8-dd412650bf0d
f2aa8cf8-4608-48a3-9c87-32720cf43683	t	Nkoto	e5ca7d99-6316-4685-b1a8-dd412650bf0d
0b48d763-f8b7-40c2-b6e3-6f7a9967f29e	t	Ruvugizo	e5ca7d99-6316-4685-b1a8-dd412650bf0d
f8f4fa3b-b01b-4ef8-9b5f-f90adaf3d891	t	Ruyumba	e5ca7d99-6316-4685-b1a8-dd412650bf0d
3eeba4f6-cad7-4d27-a287-8ac75d6290fd	t	Umugarama	e5ca7d99-6316-4685-b1a8-dd412650bf0d
0ada1448-623d-4837-9677-2cb0ac35b5cd	t	Kirehe	274f5951-bd36-4aa8-bf97-89abe47f1a24
16295d08-cbe8-4c88-a2e3-786c4f6098dc	t	Magu	274f5951-bd36-4aa8-bf97-89abe47f1a24
2e544f74-9df0-4249-904f-2614bf954005	t	Nyarubuye	274f5951-bd36-4aa8-bf97-89abe47f1a24
31b122c6-5868-47f0-88e7-9761aa57f7ca	t	Rugarama	274f5951-bd36-4aa8-bf97-89abe47f1a24
82d941e5-3760-4011-a5c4-c4f4b3529451	t	Rugwiro	274f5951-bd36-4aa8-bf97-89abe47f1a24
19cc462b-804d-46d9-b4ea-a327637aa2b1	t	Rwezamenyo	274f5951-bd36-4aa8-bf97-89abe47f1a24
807dd466-351c-4ac2-b39b-0a34685aa42d	t	Sabununga	274f5951-bd36-4aa8-bf97-89abe47f1a24
6b0f7eb1-5bd7-4ed9-9faa-e2eb5017512e	t	Birembo	d52d9512-96fd-47d4-9375-061a88acf217
c6e6463c-62d9-40d1-bd87-7c8cf898842a	t	Kabeza	d52d9512-96fd-47d4-9375-061a88acf217
91630541-0dbe-42e3-8daf-f26ddead11d5	t	Kayenzi	d52d9512-96fd-47d4-9375-061a88acf217
84430f00-5876-4789-a88f-d810ad8ee614	t	Mbayaya	d52d9512-96fd-47d4-9375-061a88acf217
5c784046-d166-4230-8b8c-f45b4835384a	t	Nyabubare	d52d9512-96fd-47d4-9375-061a88acf217
a1123245-fd14-4b98-9e9a-2cf20577e61b	t	Nyamahuru	d52d9512-96fd-47d4-9375-061a88acf217
b912942d-3729-48cb-825d-621da9858f3d	t	Nyarugenge	d52d9512-96fd-47d4-9375-061a88acf217
81684d7f-294a-420e-8747-69b2671c861d	t	Nyaruhengeri	d52d9512-96fd-47d4-9375-061a88acf217
1849c013-d265-4d22-8856-e6ef2d2302b2	t	Wimana	d52d9512-96fd-47d4-9375-061a88acf217
6995692c-dc43-492d-b719-402c20f52864	t	Buhoro	cfc301c3-c196-419b-9de1-a9d50dd775fc
024d1731-f7ab-408d-bb3c-9b3555cd9d49	t	Gitega	cfc301c3-c196-419b-9de1-a9d50dd775fc
eb40db61-2b72-4bb5-a4a3-408a31d9b581	t	Kabahazi	cfc301c3-c196-419b-9de1-a9d50dd775fc
07ee9733-609d-4418-b4b2-40f7d981f385	t	Kamabuye	cfc301c3-c196-419b-9de1-a9d50dd775fc
4ed53bbb-8bc0-42ea-8827-66af1b4cb21a	t	Kinanira	cfc301c3-c196-419b-9de1-a9d50dd775fc
f3ae11ed-de5b-4bc0-af56-df436f4b1f30	t	Kivugiza	cfc301c3-c196-419b-9de1-a9d50dd775fc
5057c59c-f4d6-4b52-a517-e750d8a0b943	t	Munyinya	cfc301c3-c196-419b-9de1-a9d50dd775fc
9b4e4be9-6e80-4052-842b-9cb55833d834	t	Rwankeke	cfc301c3-c196-419b-9de1-a9d50dd775fc
9f891997-7ac6-41bf-9af1-53c66b1590bf	t	Mugereke	d5cfd5c5-59b3-494e-96db-25c1a693519f
b95e4568-05e1-4862-a68e-69cccacc63b5	t	Nyabitare	d5cfd5c5-59b3-494e-96db-25c1a693519f
6e48100b-cac3-4ef7-be31-7443ed340898	t	Kirwa	3014e965-004d-45fa-b4f9-b0a10e2758a3
0424054c-a42b-486a-b148-2244a5f39599	t	Nyagihamba	3014e965-004d-45fa-b4f9-b0a10e2758a3
53b2a49a-dbd7-489f-904c-6d415924d29c	t	Ruseke	3014e965-004d-45fa-b4f9-b0a10e2758a3
af090dac-4cc1-459d-8fc3-1f4baca5959e	t	Kigarama	428e1c4d-aea8-4f62-860a-16c1c0fde458
1c8c3164-fd7f-488f-86d2-769df63126b8	t	Kintama	428e1c4d-aea8-4f62-860a-16c1c0fde458
7d1ea47f-3601-491d-ac07-6238fbd1e894	t	Rugarama	428e1c4d-aea8-4f62-860a-16c1c0fde458
5be02c11-eae6-47eb-8d23-5bf3dfd543f6	t	Ngendo	0678f280-7e11-4eb6-a767-2dc72d02840f
09b9e989-5b83-4575-a8f1-ad81b0a7aad6	t	Tare	0678f280-7e11-4eb6-a767-2dc72d02840f
4c8cd2df-9b47-43ae-8c70-81afe6652c90	t	Buhunga	728c7b3a-7653-4b8e-a969-96a7461b8a6a
836c9fed-f947-4b73-9ea7-9d2e3c21ac26	t	Gatagara	728c7b3a-7653-4b8e-a969-96a7461b8a6a
bfa8c1de-58a5-47f6-8797-68f3b5a2d1dc	t	Gitega	728c7b3a-7653-4b8e-a969-96a7461b8a6a
c618e8a2-b190-4ef2-8d8d-928f0c5d7023	t	Bikamba	4f581c43-ae2a-4f89-847a-703a659b1e34
719524db-8f86-488e-a731-fa0ce96634f9	t	Kigese	4f581c43-ae2a-4f89-847a-703a659b1e34
72124b9d-6145-4ad9-8497-9842a3e81837	t	Kirega	4f581c43-ae2a-4f89-847a-703a659b1e34
46874e45-c00b-471f-8fff-fb5f1a8c21e6	t	Mibirizi	4f581c43-ae2a-4f89-847a-703a659b1e34
78375225-98af-4ae7-8a4c-03d0603b874c	t	Rugarama	4f581c43-ae2a-4f89-847a-703a659b1e34
fbf1f92b-5aee-411e-bf82-bc803ae613d8	t	Masaka	da41767c-0e61-490c-b4c4-02f91a768472
5b22f5c2-a541-4c7c-b0b5-9636c57cc685	t	Mpungwe	da41767c-0e61-490c-b4c4-02f91a768472
b25d1b8b-3c71-43a7-8cde-24cc89a3e008	t	Ruramba	da41767c-0e61-490c-b4c4-02f91a768472
75548d5d-7650-4305-851f-952253e9dae4	t	Taba	da41767c-0e61-490c-b4c4-02f91a768472
a91eb749-9661-4877-9bba-354c9137f9f3	t	Kabarama	ea43039c-1476-4ef2-bb6e-1e48254bb688
0671feb9-a6e1-4fd6-b1d4-b15fd90ad809	t	Nzagwa	ea43039c-1476-4ef2-bb6e-1e48254bb688
cb811a6f-c4fb-4809-aba0-5b18b8cc5722	t	Remera	ea43039c-1476-4ef2-bb6e-1e48254bb688
b97c3bdc-8636-43b2-9cca-bc2d66242f72	t	Ruhogo	ea43039c-1476-4ef2-bb6e-1e48254bb688
8de1d21d-b0e6-4bf3-a9f0-e44dec9578bd	t	Samuduha	ea43039c-1476-4ef2-bb6e-1e48254bb688
9b9ad8a5-f40f-44df-b0d0-24833a2d09d4	t	Kagangayire	d5fd55ee-a698-4c80-bf94-6fbc109acb26
810c717d-42a0-47a4-ba02-802bdb11c94c	t	Karehe	d5fd55ee-a698-4c80-bf94-6fbc109acb26
eacb358b-b852-4e92-a11a-e671530cdc38	t	Kigarama	d5fd55ee-a698-4c80-bf94-6fbc109acb26
644a1393-e10b-4519-a3c6-ace8286aa6c8	t	Ntebe	d5fd55ee-a698-4c80-bf94-6fbc109acb26
deca0ce5-39ce-4bdf-bc48-76a2c2857ee9	t	Bugoba	d63819ca-7d55-41a6-807c-482b2ed9f616
4b29ef5c-ac53-43b7-87f4-2e99c6c97fc3	t	Gatare	d63819ca-7d55-41a6-807c-482b2ed9f616
3a345886-e9e4-489d-840d-45643b87e828	t	Kabuga	d63819ca-7d55-41a6-807c-482b2ed9f616
e8edbc6e-7d74-44a5-b211-b53a5f550495	t	Nyarurama	d63819ca-7d55-41a6-807c-482b2ed9f616
7264fa3e-352e-4add-a7cc-03d54b373e67	t	Nyenge	d63819ca-7d55-41a6-807c-482b2ed9f616
560589aa-95f6-4c76-b301-d0b4a349a406	t	Buguri	f16ecac8-d47d-4848-895c-437ceafd130b
d8976e01-7b9f-49b4-b394-9513b1a2efd2	t	Nyabuvomo	f16ecac8-d47d-4848-895c-437ceafd130b
6c767180-977a-45cd-8ba5-4c85377db7e5	t	Nyagasozi	f16ecac8-d47d-4848-895c-437ceafd130b
b096a524-1653-41e3-a295-720dbf4e7205	t	Nyakabande	f16ecac8-d47d-4848-895c-437ceafd130b
6738faf7-ccad-4de5-8d79-c44b08772953	t	Ruzege	f16ecac8-d47d-4848-895c-437ceafd130b
3c230460-c04f-4217-8553-f9d475b4bef1	t	Tunza	f16ecac8-d47d-4848-895c-437ceafd130b
a00d8b54-ab7f-4e36-af38-8cea3efc5097	t	Gahungeri	a8b8ebe1-f2c3-4cdd-bbfc-650d13613cdb
79606df1-d6c9-4353-bd8b-b39b0f7f7e2b	t	Gishyeshye	a8b8ebe1-f2c3-4cdd-bbfc-650d13613cdb
03470668-39ba-416b-bd4c-734cbb93f265	t	Murambi	a8b8ebe1-f2c3-4cdd-bbfc-650d13613cdb
9c094df4-c112-4af4-8834-3ff2830fe917	t	Nyamabuye	a8b8ebe1-f2c3-4cdd-bbfc-650d13613cdb
349dad67-ff8d-4b1d-adc8-392e25543aeb	t	Rubare	a8b8ebe1-f2c3-4cdd-bbfc-650d13613cdb
96611e37-7e50-448a-bd4e-9e5f42563e0f	t	Kabagabo	0fc2dba8-1154-4805-ac27-b7a39f0b78ef
217fcc9c-e808-4799-9856-9d4e5f8c12ee	t	Mubuga	0fc2dba8-1154-4805-ac27-b7a39f0b78ef
45c43147-865a-49da-a9e8-5c0600aae6dd	t	Rushikiri	0fc2dba8-1154-4805-ac27-b7a39f0b78ef
5e2dbdb1-6692-436c-9495-cf4a7e1ec76e	t	Uwingando	0fc2dba8-1154-4805-ac27-b7a39f0b78ef
fab81ff3-5d4e-4e6a-bc31-a3b61073d2e7	t	Gafonogo	e93bbb0e-310f-4525-9128-0d89419821e9
4d0f7ce7-2eb3-443c-88af-602f66ac1ec7	t	Mwirute	e93bbb0e-310f-4525-9128-0d89419821e9
de0d1ad8-9553-4294-90fa-b130477c3ed5	t	Nyarusave	e93bbb0e-310f-4525-9128-0d89419821e9
d5af907c-57b6-408c-a423-c3e8e21bea88	t	Rubuye	e93bbb0e-310f-4525-9128-0d89419821e9
ebb4a44e-3e72-4920-8392-064024d700ad	t	Rugarama	e93bbb0e-310f-4525-9128-0d89419821e9
337e0de1-c37b-4690-8e59-f1dc969cec2e	t	Kabande	d6003a8e-0478-4b83-a574-044a7393ecf0
43d7d8a0-3d29-44f4-90b5-ecda1ae9536b	t	Kanyinya	d6003a8e-0478-4b83-a574-044a7393ecf0
1097d50e-064f-4679-8ef2-4d4b0af98020	t	Mbizi	d6003a8e-0478-4b83-a574-044a7393ecf0
58922a1f-d734-49cb-a147-cc7434e4b281	t	Bukokora	039ed15f-7249-4cec-abe6-41f6ede0f65e
99d398e1-54c6-47a1-8930-e56db2de0fe3	t	Karuri	039ed15f-7249-4cec-abe6-41f6ede0f65e
2ae38bdb-af3c-41fd-a3cd-f698390daa95	t	Nyarusange	039ed15f-7249-4cec-abe6-41f6ede0f65e
4d3a0b69-3e5d-4722-9d0b-d0d8569a7219	t	Nyirabihanya	039ed15f-7249-4cec-abe6-41f6ede0f65e
daba0f1d-de65-4cf6-b718-85f447708bdb	t	Taba	039ed15f-7249-4cec-abe6-41f6ede0f65e
11684995-707c-4ca1-9a66-9df7ae9bff60	t	Bikimba	53d90c17-8750-4012-bb41-5bb0ef42185a
c90e5587-6de6-4348-a292-3bb9597b8af8	t	Bimba	53d90c17-8750-4012-bb41-5bb0ef42185a
dba0d895-28a5-4df3-885e-b39d3e3ef88c	t	Nyagatare	53d90c17-8750-4012-bb41-5bb0ef42185a
9aa1eb9f-4aea-4ebd-9545-c8ec4b4346e0	t	Ruyigi	53d90c17-8750-4012-bb41-5bb0ef42185a
6a25f71e-f3e7-4fb6-825d-ed1bc9377072	t	Kabagesera	22c558c5-f15d-4f5e-b146-b9bf93cfc1b5
34444c52-edcd-4df0-b4b5-83dcd90426f6	t	Muhambara	22c558c5-f15d-4f5e-b146-b9bf93cfc1b5
7d86d6b7-45b2-4248-9891-87c5722aa7f3	t	Rubuye	22c558c5-f15d-4f5e-b146-b9bf93cfc1b5
04399f2f-e96d-4dfd-98a1-cb30805d9922	t	Gasharara	b8459d7f-1215-4f0d-b46d-79b8cf97ec43
46305b08-4025-462f-ad38-77c6c2bc6330	t	Kagina	b8459d7f-1215-4f0d-b46d-79b8cf97ec43
c5eaa6cd-8c7b-401a-8b0e-e400f169ab52	t	Kigusa	b8459d7f-1215-4f0d-b46d-79b8cf97ec43
9d836a10-89c7-4d19-b7e6-9c91ab8034de	t	Musebeya	d714566e-2967-4936-b045-fbfa39e63175
bd9e6332-1d94-44c5-8aa4-365293561ceb	t	Nyagacyamu	d714566e-2967-4936-b045-fbfa39e63175
da4d7069-811f-4c5c-a180-e12b57c0b4f3	t	Rubona	d714566e-2967-4936-b045-fbfa39e63175
bd597a7e-503d-4797-a54c-9fface9c8237	t	Kibaya	1fdac4bf-c07c-465f-b97a-0f9ad410e533
d83c4609-8bff-484e-939e-c2b1c4f4bc79	t	Nyagacaca	1fdac4bf-c07c-465f-b97a-0f9ad410e533
abe020c3-0f01-43ee-8601-501b27b3f22c	t	Rubumba	1fdac4bf-c07c-465f-b97a-0f9ad410e533
b1ec9a2e-87ea-49b6-887c-06d5ccc73c22	t	Rugazi	1fdac4bf-c07c-465f-b97a-0f9ad410e533
9c86d790-461c-423b-a0a4-390bfdc5823d	t	Mbirizi	5e4955dd-0c94-4b8c-af90-cf8a0fbf4ac7
35f9ed29-614a-4b73-afc6-7a7a2b496f85	t	Rwinkuba	5e4955dd-0c94-4b8c-af90-cf8a0fbf4ac7
044df4e5-f101-4440-b27f-6e1f3272c8f3	t	Buruba	ba1898ab-54ac-48d8-9ab6-ac5f54f08e74
9756e1cb-892e-4b44-af35-93b57928445b	t	Busozi	ba1898ab-54ac-48d8-9ab6-ac5f54f08e74
286c34eb-9cc2-4ec8-8f61-3d5c7cc2b589	t	Bwirika	ba1898ab-54ac-48d8-9ab6-ac5f54f08e74
1ae4e83c-bead-430f-83a5-e28e02ea397a	t	Takwe	ba1898ab-54ac-48d8-9ab6-ac5f54f08e74
5d62f523-8f80-4339-b28b-0be2073c27ca	t	Kigaga	f9cfaa12-af8f-44ee-afa4-49c49bf539da
eaa8e376-2ab1-48f2-b558-e1ef58d2b0d0	t	Rwamugoroba	f9cfaa12-af8f-44ee-afa4-49c49bf539da
5072d6f7-574b-4f25-a5ad-9d0d0a8d15e2	t	Buhoro	08b5de04-7e5c-409b-bf28-403e3df53c1d
a57be968-e379-4ef2-8c53-40a2bdc9a31c	t	Gahembe	448a965d-14ba-448c-98e0-13ea17a8b6d7
62b26624-b081-48b8-bae7-e5ceadb8ba18	t	Gahinga	448a965d-14ba-448c-98e0-13ea17a8b6d7
baa66097-f483-44d9-a768-d31dffd1d560	t	Kabayaza	448a965d-14ba-448c-98e0-13ea17a8b6d7
ae89498b-0b10-4a55-858d-8649e233eada	t	Kirambo	448a965d-14ba-448c-98e0-13ea17a8b6d7
51c1479e-9c98-43d8-bb96-2efb66f5630e	t	Musasa	448a965d-14ba-448c-98e0-13ea17a8b6d7
d1d93d1b-2955-4ca9-8235-595597a776f0	t	Gihinga	495ae53f-4d23-4a2d-8621-b88b15bff72b
2f2fbfdb-ba29-472d-9610-a3c52deff4ce	t	Karambo	495ae53f-4d23-4a2d-8621-b88b15bff72b
dbeeac63-cc80-4140-b476-1bd0797614b5	t	Nyirabwayi	495ae53f-4d23-4a2d-8621-b88b15bff72b
27efd666-bc7e-49f5-bc5e-0f19482ab31a	t	Kabuga	3f81051f-cbd7-49f4-8755-5fc668797d91
8133766f-d348-4b50-b4de-13d3165c19b0	t	Peru	3f81051f-cbd7-49f4-8755-5fc668797d91
417f1d2b-e91e-4609-80aa-95f6ab5433ac	t	Gasave	0172407d-63f3-4328-bb0e-5ba2a7fa616d
02325398-f6bc-477b-b7ee-5e9e2c84d334	t	Gasiza	0172407d-63f3-4328-bb0e-5ba2a7fa616d
cda94c39-3c8b-47c3-bde9-7edd7080cd51	t	Kabuga	0172407d-63f3-4328-bb0e-5ba2a7fa616d
ab914f1e-b570-4d2b-9edb-dbf7f6af1dee	t	Rebero	0172407d-63f3-4328-bb0e-5ba2a7fa616d
6841ae35-9e48-451d-b843-df1f3595a1f8	t	Rukoma	0172407d-63f3-4328-bb0e-5ba2a7fa616d
3db90280-b835-417e-bb6d-ce7ec1e31c9a	t	Kamiranzoger	931692ab-cd4a-42f1-abed-7cbded784f9c
a7466d1a-ae5b-4660-9de5-ba124ced3302	t	Karambo	c566ae32-33b1-4516-ac0a-dfe69bf05074
7bce5f60-21dd-4979-8256-5a0490b61c91	t	Cyambari	f81b2512-58df-44da-a751-dad06621cde3
39f949c1-67f8-4168-85f6-a0c09c69cc43	t	Gitwa	f81b2512-58df-44da-a751-dad06621cde3
b8668b67-da21-4edf-9adc-45f3d45a9195	t	Nkegete	f81b2512-58df-44da-a751-dad06621cde3
94ef4d05-5c85-4044-8915-f382431d1c65	t	Nyarunyinya	f81b2512-58df-44da-a751-dad06621cde3
7f13b26c-aa20-40b7-8cee-103ad7ae02e4	t	Peru	f81b2512-58df-44da-a751-dad06621cde3
b41d50a8-1459-45b6-a745-2068a17b6134	t	Karambi	38b80730-3867-4edc-8172-50de32832086
2e1fb21d-6ac0-4280-91e9-b5686dd53e52	t	Muduha	38b80730-3867-4edc-8172-50de32832086
80b92356-483a-4b3b-b2ce-a86fd14997f1	t	Musenyi	38b80730-3867-4edc-8172-50de32832086
993e8e19-9352-4c6a-bad6-e2673d2a1eec	t	Ruramba	38b80730-3867-4edc-8172-50de32832086
c60ef4aa-e1a4-45d1-b9c1-f1ef9d0fdeb0	t	Cyakabiri	1f72c93c-3fef-4e16-a55d-ded702478b5f
266cb372-39a9-4cde-88e8-6eebd700199a	t	Kagahina	1f72c93c-3fef-4e16-a55d-ded702478b5f
dd8e2eb1-829e-405e-bbfc-55b353f5a392	t	Kagitaba	1f72c93c-3fef-4e16-a55d-ded702478b5f
0bcba6ee-24e0-43b1-9443-179aaa7c33e0	t	Nyanza	1f72c93c-3fef-4e16-a55d-ded702478b5f
b044f260-6336-4e32-bede-26cee2fc6752	t	Sabusaro	1f72c93c-3fef-4e16-a55d-ded702478b5f
97520fa4-fb75-4bdf-b658-126a6f6d922e	t	Busumba	7fdfabc1-e7d1-46db-8579-a201ee6862ab
741045d1-c93e-440b-b21d-8c67e6bb5aae	t	Gatwa	7fdfabc1-e7d1-46db-8579-a201ee6862ab
2d710491-411f-45f2-8d7b-ab8ba100d7a9	t	Mubuga	7fdfabc1-e7d1-46db-8579-a201ee6862ab
4e0da3a5-04a1-427e-aaa6-0c12842c4186	t	Nundwe	7fdfabc1-e7d1-46db-8579-a201ee6862ab
4d166979-8a35-4186-a5cd-0feeab8abcdd	t	Busindi	f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01
137b452d-ac71-4f7e-9a36-0548064b7dd7	t	Kabuga	f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01
a3649542-cb7f-4b15-ace9-cc10736d6a59	t	Matovu	f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01
03cc1225-3ac8-44d2-a4ce-962560a052f4	t	Munini	f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01
63cf7093-7076-4cb5-b131-afcf0d3eda7c	t	Musagara	f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01
72a08e27-683f-4076-bb4c-dedb91727234	t	Nyamirambo	f6a5dfc3-a7cd-4397-9328-ae75ef1f8a01
f5cab679-5cfe-407e-9968-eec22b2137e9	t	Mataba	2d1c91ed-9137-4965-bed9-4bc5916961b7
850bb973-5b5a-4480-b158-c3955176531e	t	Gasenyi	c00d3077-1d30-4280-b6d6-404c5f10f8b2
48325b42-fb3f-4273-a481-89701feea4b0	t	Kamazu	c00d3077-1d30-4280-b6d6-404c5f10f8b2
144afb8d-9ace-436b-8474-2c6374346332	t	Gasaka	30bce05b-b545-496c-99ab-077bab0ed462
443f1197-1b35-4fa0-8ea4-7e80168f802b	t	Gitima	30bce05b-b545-496c-99ab-077bab0ed462
e90f188c-7239-4347-ae29-9bf505639d62	t	Kivomo	30bce05b-b545-496c-99ab-077bab0ed462
e4efd970-307a-47e7-ba6a-cca663984379	t	Nyahinda	30bce05b-b545-496c-99ab-077bab0ed462
945c31b1-9d2e-4373-83b6-1fdead291401	t	Cyarubambire	90cc361c-ab9e-458f-8321-77deabf3c5e6
9d53a614-c1e4-4c6d-bf5e-e0d0fae150da	t	Gataba	90cc361c-ab9e-458f-8321-77deabf3c5e6
d2167367-698c-4340-b246-7a10f076e558	t	Gitwa	90cc361c-ab9e-458f-8321-77deabf3c5e6
e177a346-5f41-494d-91ee-f3f8b34a0d50	t	Kabeza	90cc361c-ab9e-458f-8321-77deabf3c5e6
1075fbe6-7db3-4f03-8104-dc745d70b88e	t	Kabare	5a27d3f8-ec4d-4796-8c9c-19b759253e12
d6b76ca3-e6c8-4e78-9946-c05fa203f468	t	Kiyoro	5a27d3f8-ec4d-4796-8c9c-19b759253e12
9ff6cc6b-dfac-418f-80d0-b44ff7b2ff97	t	Rwinkindi	5a27d3f8-ec4d-4796-8c9c-19b759253e12
c111ab81-5c00-4509-ad75-bed17ff9acd2	t	Gisovu	2bd3a9e9-fced-4744-a018-eba8fd419299
41bfce13-5b8a-49c3-9a35-1a6a103dbb65	t	Hanika	add90814-ba2e-4c62-ac9a-18a81bf20858
e7800ace-501c-4503-9761-5917594c6515	t	Kivumu	add90814-ba2e-4c62-ac9a-18a81bf20858
c81dac72-683b-43ff-8394-36a91f9dd2a7	t	Rubona	fa8a7308-b075-40c2-9977-c039d4fcc174
68b9092b-27b9-4362-928b-65f65a6e2067	t	Nyamasheke	519a3a38-48b2-4a7a-a700-6b6a7d760081
63ed1521-2b76-4486-8d61-4640889a0305	t	Nyanza	519a3a38-48b2-4a7a-a700-6b6a7d760081
007c18ef-cf63-4bb5-aaf2-d42ffac595c5	t	Gitwa	0d08d895-1871-401c-911e-0a57f093a291
ce92f9e1-a258-439a-a237-1e1dc73bcd98	t	Mugeni	0d08d895-1871-401c-911e-0a57f093a291
f599ff08-97cf-4ad7-a099-c3d18bf7c9a8	t	Gihuma	ba6e2244-6532-4422-ba43-be92f2b08e31
d37462f3-2c56-4316-9f67-0f36aaf2c5d1	t	Kamazuru	ba6e2244-6532-4422-ba43-be92f2b08e31
7a0c8a22-2f6d-48b3-a618-b6111cd66de3	t	Kavumu	ba6e2244-6532-4422-ba43-be92f2b08e31
d3ba201d-5f3b-4ac9-b35b-9fb7c64beca4	t	Nyarucyamu I	ba6e2244-6532-4422-ba43-be92f2b08e31
3add27a6-d8bb-4dd4-8730-79241882c5b8	t	Rutenga	ba6e2244-6532-4422-ba43-be92f2b08e31
9524b506-fc58-4f74-b152-ff4961449a8f	t	Ruvumera	ba6e2244-6532-4422-ba43-be92f2b08e31
ad5bb10b-38de-4b35-8146-de9f65f6b9c7	t	Gifumba	bf7c5dca-7fc5-49e0-9066-53a93aefa03e
4b1d330c-b298-47a8-8847-e1a8c4754a20	t	Gisiza	bf7c5dca-7fc5-49e0-9066-53a93aefa03e
f1e0fe77-2922-4243-be50-cfd5410ffdea	t	Kirebe	bf7c5dca-7fc5-49e0-9066-53a93aefa03e
00def4d0-27c6-49d8-8d53-12cf1bcd6f70	t	Rugarama	bf7c5dca-7fc5-49e0-9066-53a93aefa03e
103393d8-3735-4cbc-8a63-91efac39b300	t	Rutarabana	bf7c5dca-7fc5-49e0-9066-53a93aefa03e
ee99b5ab-ae4e-47b7-a0a6-0d2cf810e78c	t	Samuduha	bf7c5dca-7fc5-49e0-9066-53a93aefa03e
c632f320-4d87-4948-a098-21ad694c9284	t	Kagitarama	2230abb8-899d-40df-9c08-cf8a9d4f95d0
f9c77163-4b6d-4332-ae47-4dfaa6d7964e	t	Kavumu	2230abb8-899d-40df-9c08-cf8a9d4f95d0
1e1d0fc7-dcce-42a8-a672-64a08b307280	t	Nyabisindu	2230abb8-899d-40df-9c08-cf8a9d4f95d0
12fd90ba-667f-4587-97e1-d2a358800885	t	Biti	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
b4d09fac-d6e2-4e68-923b-fc6dd13577e2	t	Gasenyi	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
9555eafe-ecfb-4746-8e5c-6e2cc3423c27	t	Gasharu	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
6021002f-16be-47a4-b598-4e71290d6383	t	Kirenge	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
22339985-5644-448e-88ed-187dfd670e5c	t	Munini	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
0db2d59a-e833-4c71-b808-897489ce57d3	t	Nete	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
83c3def7-8927-4948-b2e4-327877baae3d	t	Nyakabingo	9e6ee4e9-26be-4526-9cac-5b82a5e4ea7e
49a284ea-7376-47a8-8d85-65aa4503a7b0	t	Gasave	197364ee-766c-4ced-8d87-7afba9a284f0
8cd0e61a-7792-438a-b4bb-d868f0bcf6c3	t	Gasharu	197364ee-766c-4ced-8d87-7afba9a284f0
691c8234-f0c6-4d34-8106-135a9e45cf06	t	Karehe	197364ee-766c-4ced-8d87-7afba9a284f0
542b6773-ad1f-4e52-bedd-a3ab3e29bfa5	t	Ntenderi	197364ee-766c-4ced-8d87-7afba9a284f0
c2b08f3e-5a88-4fa2-af31-1b27416d3163	t	Nyarushora	197364ee-766c-4ced-8d87-7afba9a284f0
a2d6f82e-4add-40e6-827b-a9d4349cd11b	t	Cyiciro	0b7e9ae5-3f4c-4dba-a8f7-e72ad8706ef5
95aafa41-4d12-4acf-9cbb-90a714bcac9c	t	Kagarama	0b7e9ae5-3f4c-4dba-a8f7-e72ad8706ef5
60eb5a0e-b039-4b72-924d-404cf56a0b95	t	Murambi	0b7e9ae5-3f4c-4dba-a8f7-e72ad8706ef5
a31e50af-7e57-47f6-88c7-8827a27ef40e	t	Gitega	ec1188b8-8737-4af7-8ad1-577bdac8a77f
d47e6b06-03df-4e46-ac72-4d8b39cf7165	t	Remera	ec1188b8-8737-4af7-8ad1-577bdac8a77f
87fc0c95-3b37-47eb-ac60-07319c69221d	t	Rukamiro	ec1188b8-8737-4af7-8ad1-577bdac8a77f
68cb3e60-d815-403e-8837-72d4b0506eae	t	Mututu	515f68bb-7693-4b02-a6ba-f1ffb5a1ed30
bfb59ade-fd49-42ee-9485-47c2d110cfeb	t	Rukurazo	515f68bb-7693-4b02-a6ba-f1ffb5a1ed30
c6bb8d2f-7ffc-41be-9e0a-210e515ce0b8	t	Rwambariro	515f68bb-7693-4b02-a6ba-f1ffb5a1ed30
a28f0af2-028f-468f-b0a3-933df3d4a277	t	Fumbwe	8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc
93b4ed1d-d31e-4e5b-aef7-ec54e9a3f657	t	Gasharu	8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc
df8d30c9-3ed8-4afe-a534-73df36fb03c2	t	Kidahwe	8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc
3e660dc7-8ed5-47ce-bdf4-0c0c649b5ddc	t	Murehe	8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc
2cbea5f7-ed40-41bb-9083-02a6d776f949	t	Musenyi	8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc
225e2e2d-77cc-4412-8034-949d201e91b6	t	Nyabugombe	8e8ad7ea-c4fd-4d2c-8bea-0fa2a604bfdc
9eb7bbe2-e8eb-4a1c-a4e6-6e448f70574c	t	Gituza	ab2d2377-4651-40ea-adc9-6d557dd366bb
bdd2c45f-ca8b-45f1-bf07-71b6f14b0434	t	Karama	ab2d2377-4651-40ea-adc9-6d557dd366bb
b33fbbd1-1a21-4e5b-adea-09baad7e758f	t	Nyamiyaga	ab2d2377-4651-40ea-adc9-6d557dd366bb
b596fe2e-7880-4eae-b8e9-f91a49707cc9	t	Gifurwe	ab17525f-865b-4454-977c-c119e94e6ac9
f73300bc-b3d1-4073-811b-46389305430e	t	Gitwa	ab17525f-865b-4454-977c-c119e94e6ac9
c06dbd4f-61ea-46ff-aad6-f7fa034aea52	t	Nyabikenke	ab17525f-865b-4454-977c-c119e94e6ac9
09dbc820-027c-4191-8496-a7748c1ee64e	t	Nyagasozi	ab17525f-865b-4454-977c-c119e94e6ac9
9b05c346-1765-405a-881f-5c8fe0db9eb0	t	Gisoro	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
3b46a90c-8761-4de0-a2f4-2d4064cafd4c	t	Kabakungu	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
a80cee80-6c76-42d1-ad5b-9b4e0938b6f8	t	Karambi	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
9ecd8582-f663-4c49-b2c0-585bf237db11	t	Mugwato	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
9523ab64-de78-494a-9a28-fa562e0ba74e	t	Ntarabana	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
c0c3cf7b-277b-43b9-8ee5-1e2c78bfba26	t	Rugogwe	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
a17fa6a2-bdbd-4953-a2b4-fef0cea3f780	t	Rwamure	282fe0f4-aeb9-4add-bbd8-eb123484f9d1
c810cbe4-3251-4e0f-9d39-20b409870666	t	Kondo	e7007c7e-5954-4c2e-a9bd-dc2259540698
481a066a-5e11-4b05-ab59-335ccdded069	t	Muyebe	e7007c7e-5954-4c2e-a9bd-dc2259540698
0f0d8eaf-ee28-461c-a6ef-8cdeb3372486	t	Rukoma	e7007c7e-5954-4c2e-a9bd-dc2259540698
48847043-3269-4498-aa69-5df20d70b1f5	t	Gasharu	086328f3-32e9-4e99-93ed-9104e413b136
9a80ccce-2e77-4fac-a9d3-4af693c74349	t	Nyagasozi	086328f3-32e9-4e99-93ed-9104e413b136
ff9310e0-ee3e-4edd-a59e-e7164568d06f	t	Ngando	28b8e742-ade7-400c-a7f0-330cd3576c94
97f90d6c-9be8-42ed-b349-6d5622440b54	t	Nyundo	28b8e742-ade7-400c-a7f0-330cd3576c94
610ab8d4-2318-4656-b830-5c20ded49ea4	t	Twabumbogo	28b8e742-ade7-400c-a7f0-330cd3576c94
37f902b9-9105-4027-a84f-a1c183f8565f	t	Gatare	26c6af35-e7eb-420a-ac84-3a93040da91c
cb8e1145-f237-42ac-8c1a-9993cc631cc4	t	Kabungo	26c6af35-e7eb-420a-ac84-3a93040da91c
1949210b-b76e-40c6-b3bc-40ccf4b1a3fb	t	Kinyami	26c6af35-e7eb-420a-ac84-3a93040da91c
96421999-294e-4482-aa48-d7e52812138a	t	Musezero	26c6af35-e7eb-420a-ac84-3a93040da91c
9b9fe8fa-309e-4cc9-9ca0-3b9a3a1cfd40	t	Nyakabingo	26c6af35-e7eb-420a-ac84-3a93040da91c
6b4035d5-b073-40d8-a60d-75736db3c920	t	Nyakaguhu	26c6af35-e7eb-420a-ac84-3a93040da91c
5a88accd-df1a-43fe-b1bc-f357695dba5c	t	Buriza	54ed53cf-5792-41ec-96de-f97525cbff30
cf4366b1-9fea-4bcc-a096-e2df390f33f5	t	Muremberi	54ed53cf-5792-41ec-96de-f97525cbff30
8ba1a56c-a69a-4654-ae5d-8815aeb9eb45	t	Rubugurizo	54ed53cf-5792-41ec-96de-f97525cbff30
bc1e4687-a46e-4029-8bc9-2b180812a85c	t	Songa	54ed53cf-5792-41ec-96de-f97525cbff30
a31a4d6e-2c12-49df-9eb1-e7ec0bb0a9d4	t	Vunga	54ed53cf-5792-41ec-96de-f97525cbff30
4baad4b6-bd25-4768-9a68-6edbd3650929	t	Gakomeye	2f7b7edf-301b-46d1-8dae-0c2d45900b36
e5154747-40cb-494e-ae18-15177fda0a9a	t	Gasharu	2f7b7edf-301b-46d1-8dae-0c2d45900b36
16e67358-c767-47d4-9d33-06ace69cf755	t	Kigarama	2f7b7edf-301b-46d1-8dae-0c2d45900b36
79fb71b2-5059-45e8-b7ce-e41065b7aac7	t	Mapfundo	2f7b7edf-301b-46d1-8dae-0c2d45900b36
621f8e0a-9d04-43e5-9687-ac10dadefc94	t	Nyarucyamu	2f7b7edf-301b-46d1-8dae-0c2d45900b36
483d3c82-3e66-415c-b4c3-a1b88d5c939e	t	Rwamaraba	2f7b7edf-301b-46d1-8dae-0c2d45900b36
84db91a6-7836-490b-beb2-22ed92455a3f	t	Kabeza	46753a28-b330-49dc-b6e9-12aa1bae11ee
72dfcc96-95dd-44bf-9c38-18077b54ff43	t	Karama	46753a28-b330-49dc-b6e9-12aa1bae11ee
6da04256-0c5a-4c4e-8ac0-269e5873d8ea	t	Kavumu	46753a28-b330-49dc-b6e9-12aa1bae11ee
303d5764-778b-4462-9e12-5358c18c4327	t	Munyinya	46753a28-b330-49dc-b6e9-12aa1bae11ee
8a22d647-4e64-489d-bfc3-878dc8a54eb3	t	Murambi	46753a28-b330-49dc-b6e9-12aa1bae11ee
7f5f94ca-fe2a-45d2-8bfe-4e2e5aa4e1b0	t	Nyagacyamu	46753a28-b330-49dc-b6e9-12aa1bae11ee
c07c00e4-4d66-42b1-a5de-f04950a237d2	t	Ruhina	46753a28-b330-49dc-b6e9-12aa1bae11ee
9a760cf0-d65f-44db-afd7-bc281d1f3282	t	Mugote	c4885575-ea38-4f8f-9b1d-1e738b3b2c15
0224395f-d4c9-4649-86c8-30834ea3cf65	t	Gakangaga	79fb8108-a74e-42cd-a67a-f550e9a56c53
7d9a6533-a054-47dd-95a2-7874dc225bee	t	Rukeri	79fb8108-a74e-42cd-a67a-f550e9a56c53
c21c2f9d-43ec-4e17-ad37-123e46acdea4	t	Gifurwe	f54cbcff-9991-49ee-9e8d-e36742d99ece
9c3f495b-be25-47b5-8e0e-1676d38683c2	t	Nganzo	f54cbcff-9991-49ee-9e8d-e36742d99ece
54087026-82e5-4233-bb0a-730ac8c99795	t	Nyamaberi	f54cbcff-9991-49ee-9e8d-e36742d99ece
79983f0e-7d09-4684-9234-975f2fdf656b	t	Ruronzi	f54cbcff-9991-49ee-9e8d-e36742d99ece
96d63564-6268-44ce-9159-cb399afe5b71	t	Uwankiriye	f54cbcff-9991-49ee-9e8d-e36742d99ece
cc25e3f4-b473-4dc1-a6a3-a5af33ff6cb9	t	Cyinyonza	aa611db7-cd19-4587-82d3-844a259f3534
4002e63f-9163-4109-9e74-c70942cd9561	t	Gitovu	aa611db7-cd19-4587-82d3-844a259f3534
b102785c-1c8a-4b4f-88e2-ffc6ff114925	t	Magumira	aa611db7-cd19-4587-82d3-844a259f3534
8333acd4-c734-48af-8e62-628d56002a19	t	Matsinda	aa611db7-cd19-4587-82d3-844a259f3534
45380fab-70b3-4065-80e8-99e88e790559	t	Munini	aa611db7-cd19-4587-82d3-844a259f3534
647ab88c-a39e-426b-b027-f7bcee1a9088	t	Uwinzovu	aa611db7-cd19-4587-82d3-844a259f3534
3b903086-6e43-4d7b-81bb-e25bc51cc512	t	Nkamba	20f9f28b-f099-408c-91bd-c49b6c9bbf6f
b9b270e5-d915-4688-ab8a-ce2f87670cf7	t	Gitega	96bc32c7-d460-467b-b806-d7fa82c8f17c
2137ff1a-4f37-4907-a484-cecf90323b7c	t	Kigarama	96bc32c7-d460-467b-b806-d7fa82c8f17c
131bd787-d064-445f-8cd2-b677d77c4b81	t	Munyereri	96bc32c7-d460-467b-b806-d7fa82c8f17c
43a9adc3-ac56-48c5-af7b-d5418565c3ae	t	Musasa	96bc32c7-d460-467b-b806-d7fa82c8f17c
88858658-ba99-46b1-89cf-ca72a6c9929c	t	Rwingoma	96bc32c7-d460-467b-b806-d7fa82c8f17c
4d2d6271-b1f0-4f05-b37f-5b3d0bb5bcba	t	Karama	641188e7-83a4-421d-873d-df68b5eb411a
3cfaf9c0-4517-465d-a6a7-1d2061111c12	t	Munyinya	641188e7-83a4-421d-873d-df68b5eb411a
cc850801-38e2-440a-be36-36b2db4b1046	t	Nyanza	641188e7-83a4-421d-873d-df68b5eb411a
90042cc3-b4d2-4a45-a282-ba52f29ff625	t	Kaviri	0744a458-ede6-4942-91e1-cdb67455a00a
91615b3a-22e1-4a64-b388-df6bb4c67917	t	Nyarucyamu	0744a458-ede6-4942-91e1-cdb67455a00a
0fcea1c0-f68a-486b-b31f-758fe968d8d0	t	Kinga	456394cf-2621-4609-b49e-e9266b5d70b6
197d6dec-fcd6-4a14-bce7-6226d08087a0	t	Nyamirambo	456394cf-2621-4609-b49e-e9266b5d70b6
3a35244c-eb59-4ea9-8dc2-68f17c3c040c	t	Kibingo	e98cce10-c0be-47dd-a302-25a8b536a72e
c1a374be-dc63-4900-b187-604d52a19d0f	t	Nyabisindu	e98cce10-c0be-47dd-a302-25a8b536a72e
5e445c51-055d-421b-9bed-47970dd3a54b	t	Rugaragara	e98cce10-c0be-47dd-a302-25a8b536a72e
e3727782-8908-403a-8f61-0e26f4c9b9fc	t	Karuvenya	49909b1c-0512-4e6e-a499-a014b94c7dcd
19d650b2-5ec3-4110-bbca-4becf5d79ab1	t	Mbeho	49909b1c-0512-4e6e-a499-a014b94c7dcd
99514022-1fff-4bd7-a610-31ad578c2052	t	Mugari	49909b1c-0512-4e6e-a499-a014b94c7dcd
d73821fc-1462-419f-8c38-0288840955f0	t	Gakoma	395db7da-7587-4d64-b6d2-d5ef240547d7
552492d0-71c0-47fd-8b67-27a1742e2870	t	Munombe	395db7da-7587-4d64-b6d2-d5ef240547d7
d21c552b-9848-423f-a2f3-4ad635d774e0	t	Nyentanga	395db7da-7587-4d64-b6d2-d5ef240547d7
8810f0ca-39a6-49d0-8c44-660a972e091c	t	Kitazigurwa	a495596a-5ad9-48bc-8a7d-7a8364b68f57
a1d509db-abff-4f0f-aed6-5d5cdaeb7ad0	t	Sumba	a495596a-5ad9-48bc-8a7d-7a8364b68f57
686c0946-67c5-48f0-9b5f-4aa868c687a8	t	Dusego	dbdb1f26-7e3c-439f-803e-9b3c2fc742fa
046df6af-ca63-46d1-b4c2-e9370dfdbc7c	t	Gasharu	dbdb1f26-7e3c-439f-803e-9b3c2fc742fa
a5f662b1-8e79-4f68-8b6d-08789c38eaf7	t	Kabacuzi	335ad558-aa62-4b9b-a268-1ab488391f31
88077646-abec-43f0-a59c-fc4e3344c90e	t	Kabajogo	335ad558-aa62-4b9b-a268-1ab488391f31
5793e749-3610-44db-b2ac-7636e10c1d28	t	Karama	335ad558-aa62-4b9b-a268-1ab488391f31
e2c41360-e259-4afb-8ebe-10ce3f2cf3bf	t	Kigarama	335ad558-aa62-4b9b-a268-1ab488391f31
c69f445d-81ec-42f5-ad87-0c145f4b933e	t	Nyamugari	335ad558-aa62-4b9b-a268-1ab488391f31
057253ce-60e6-4ecf-a3c6-0cdd5079fd2f	t	Nyarusange	335ad558-aa62-4b9b-a268-1ab488391f31
e19f8076-95a8-430b-bc31-e4ef21559313	t	Gasaka	53effd48-8a99-4a8a-b213-ba884eba5421
a514f395-4dcc-44ff-a60e-d6434ad84c1d	t	Nzega	53effd48-8a99-4a8a-b213-ba884eba5421
7919af59-b351-41cd-a561-d016292dfd45	t	Murambi	b07e5a18-4954-4320-b805-3981bed25259
56590237-63d3-4894-b864-7c9101e47bd4	t	Muriro	b07e5a18-4954-4320-b805-3981bed25259
ec3800ac-e510-4f6a-ae8e-48f82e5271d6	t	Nyamifumba	b07e5a18-4954-4320-b805-3981bed25259
e9f8df85-07c6-44d4-ae6b-7a47ee2c3fed	t	Gashasha	ca6e4f0c-921c-4580-8f8d-122c79f5d93d
5fb122da-3b15-4fea-8e9f-d9ee5b5433b7	t	Murembo	ca6e4f0c-921c-4580-8f8d-122c79f5d93d
44442785-aeb2-42be-9117-5b00ecc3dd37	t	Rwamakara	ca6e4f0c-921c-4580-8f8d-122c79f5d93d
e284d10c-87ef-4ba8-b2f4-6da894bb10d2	t	Uwisuri	ca6e4f0c-921c-4580-8f8d-122c79f5d93d
d4fd4e7e-f3c6-435b-9271-56eb6e593387	t	Bamba	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
1287a7ca-63d7-45c7-85f9-fcf51df3169b	t	Biziguro	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
d7f471f2-bc17-43ef-b37f-4bff9f6c115d	t	Gahama	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
40e1c6e5-af54-4385-b80a-b9a5262da076	t	Gataba	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
80f1c9ac-e755-4119-af2d-42c9533348ad	t	Gitega	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
7d5f48ec-16c0-4016-9d9d-b67bb2e7a590	t	Kabuga	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
91395211-29c9-4f19-80f7-6390473984d5	t	Karehe	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
2c081958-05bf-4a04-a058-7ef1dafa2ae8	t	Kavumu	ae62f62b-c8cb-49a3-a3f0-98c19eaa0abf
51297bd7-b56d-4925-a268-5cf5c1abb764	t	Kasemanyana	1961dea9-6093-4bb3-8b76-0ecf2b2300b0
925e9f8a-5a56-43a2-9ca3-d13f9281bb39	t	Kibiraro	1961dea9-6093-4bb3-8b76-0ecf2b2300b0
d5f85ee9-ae5a-4a24-b2fb-a819c1ce1ae1	t	Munini	4d1023ec-2d8d-4533-aaed-cf3e026a3e50
d730772c-47af-42ad-9ff1-a75a6fa67dc6	t	Nyakirambi	4d1023ec-2d8d-4533-aaed-cf3e026a3e50
10fd072e-7329-4177-8265-0c2111bd45ca	t	Kabaziro	a3a5e876-395a-4d1d-9bd0-c43721c89f00
54b2f57a-5222-4af0-9319-f8e7261d5540	t	Kirehe	a3a5e876-395a-4d1d-9bd0-c43721c89f00
19a7324f-af6c-4748-a2e4-01e4aa7eaec1	t	Kivumu	a3a5e876-395a-4d1d-9bd0-c43721c89f00
d81399e3-d86c-4892-8325-7487d54c4733	t	Cyugaro	1e939216-f7ae-400f-a20c-1d17c14720ca
66d8a51f-d00d-4563-acdf-8e203c65dd0a	t	Gashiru	1e939216-f7ae-400f-a20c-1d17c14720ca
db90707d-f48e-4ac4-9fa4-e9606fd2f650	t	Nkomero	1e939216-f7ae-400f-a20c-1d17c14720ca
2a94bd0e-3858-4031-84b3-efff66e9e7e6	t	Nyakabingo	1e939216-f7ae-400f-a20c-1d17c14720ca
532df4f2-3ecc-4174-a293-ebbfddbf4373	t	Ruhuha	1e939216-f7ae-400f-a20c-1d17c14720ca
5270bae1-19b5-4707-bab9-5c12f19ddc43	t	Gitwa	6d739d6b-0747-4bac-9b02-a0f84838a06d
e3b0711e-f03f-4335-8f9b-b64ec6df55f2	t	Ryanyirataba	9c907b5f-63fc-4c88-b968-df5e95cba7ad
b77d00bd-590d-487f-91e8-412a2cffefc2	t	Nyarusiza	81641aae-c29f-4675-95ea-c10ce432dc73
446f521a-92a6-4539-a13b-68a11b0b4f83	t	Kamina	046818a1-ff97-4ab6-b9b1-11bd2856a21e
b55d0811-6902-4d1b-b92e-f7c7f1a35aea	t	Kivumu	046818a1-ff97-4ab6-b9b1-11bd2856a21e
2daaa650-70d4-4760-a080-de97f2dc20d2	t	Nyabusozi	046818a1-ff97-4ab6-b9b1-11bd2856a21e
508a673b-ce34-4e86-85de-d4c2ca72e49e	t	Kasebuturany	db0332e6-ed45-48ba-b489-1f96c425fde2
59d14056-6883-448e-bf1e-84a57d817424	t	Muyange	db0332e6-ed45-48ba-b489-1f96c425fde2
43bd7ac9-9867-49f8-89ed-f16de28c153e	t	Uwinyana	db0332e6-ed45-48ba-b489-1f96c425fde2
886f2c39-427f-461a-b1b1-44895c4c01ee	t	Muganza	729a842d-8011-4970-bde3-4ef206cbade9
12a85bcf-ded0-4efa-bc9f-e7bdf36f51b6	t	Nyabubare	729a842d-8011-4970-bde3-4ef206cbade9
e2127c5b-38c2-46de-b21a-756eb0b35e04	t	Gisoro	3d3802b5-de3c-4df6-8db0-7eb8d997ee19
f9dac270-2215-492a-883f-c8a7b62e5070	t	Gitwa	3d3802b5-de3c-4df6-8db0-7eb8d997ee19
774a0286-c12b-49e6-aa75-93c1f44a286d	t	Kavumu	3d3802b5-de3c-4df6-8db0-7eb8d997ee19
0bc36523-83ca-4ca1-b735-1031a085bdd9	t	Nyamirama	3d3802b5-de3c-4df6-8db0-7eb8d997ee19
24aa57a5-03bd-481c-8c2a-8a5e42028a26	t	Nyirakiraro	3d3802b5-de3c-4df6-8db0-7eb8d997ee19
524ef947-151e-4077-be87-d89ece5cb0cb	t	Gakoma	519ce539-6d3c-4e70-abaf-aaad114af469
c2746cba-f518-4fcf-b67e-f498e90d39c8	t	Nyagishubi	519ce539-6d3c-4e70-abaf-aaad114af469
3cf63676-2d08-4168-95ae-a190b4fd92f1	t	Birembo	f1b0512d-ebd6-42eb-a394-e95af3adfe5a
eb66f5da-bbda-42e0-b53e-56c727619ce5	t	Karumbi	f1b0512d-ebd6-42eb-a394-e95af3adfe5a
8f70561d-12bd-4e1f-b8c8-5002534fcb88	t	Mugote	f1b0512d-ebd6-42eb-a394-e95af3adfe5a
7bff42de-7beb-4b7e-9a1f-c9594ba11ef2	t	Murwa	d1e2a3dc-dc35-42d1-a5b2-a2b0158e8cac
9da4ea89-9614-4585-9598-c14a9cbb82e3	t	Nyagatovu	d1e2a3dc-dc35-42d1-a5b2-a2b0158e8cac
89657b10-0cd5-46fe-a79a-00d50ec7c874	t	Gikomero	33fab97a-5c77-4255-b956-d830c37645c9
42b7e5f3-f1cb-4f9d-91f4-27a7a9ce7e9c	t	Nkurubuye	33fab97a-5c77-4255-b956-d830c37645c9
67b2c43f-6a47-4d4b-a278-cf82f446d2c8	t	Gatandaganya	02d1dea2-2f93-43e2-83c8-6bc548dea190
378d1d8b-5e6c-40ee-a38b-07dfae3e656a	t	Kabere	02d1dea2-2f93-43e2-83c8-6bc548dea190
fba5c86e-3113-41a7-af70-79d40dfdd0a1	t	Kanyege	02d1dea2-2f93-43e2-83c8-6bc548dea190
333a64ed-d138-4c52-b07e-4fd56dd05bd6	t	Rwezamenyo	02d1dea2-2f93-43e2-83c8-6bc548dea190
76e3a6d4-da1b-4d7c-aa8b-fb31c023fde4	t	Nyakizu	8640b9aa-db42-47b8-b858-4365a9a53308
5f968f68-f3de-4170-924b-52f91a02d940	t	Bususuruke	b8808a77-e697-41ba-90ec-bb0662277b2a
2067e295-4368-4487-960a-287d96f94cd5	t	Kintobo	b8808a77-e697-41ba-90ec-bb0662277b2a
ada0b1a2-fb39-4ff2-af76-4a05dbbce95f	t	Turonzi	b8808a77-e697-41ba-90ec-bb0662277b2a
730966b0-e767-445e-a9a3-c4802bce2b8f	t	Uwabumenyi	b8808a77-e697-41ba-90ec-bb0662277b2a
5f892de1-d12f-4c78-831b-d0e89694673d	t	Uwarwubatsi	b8808a77-e697-41ba-90ec-bb0662277b2a
8aaea864-7a13-4741-a518-3d042a3aba39	t	Uwintyabire	b8808a77-e697-41ba-90ec-bb0662277b2a
e4ebd1f1-4c8f-4be2-8788-f4d60bc8dabe	t	Gahande	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
a155fc6b-3781-4dae-bf1c-e0800a0c729b	t	Gasasa	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
dae113d3-b628-4064-aaea-dc6c8915cf58	t	Mujuga	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
52ab2419-22ef-4c51-ba3e-6bb431267241	t	Mukaka	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
5603199e-8e4f-4a0c-87f4-790000c9f8a6	t	Rwufe	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
4545e4a3-ad0b-4a20-8363-982adee3e1ed	t	Uwanyakanye	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
97801dd6-c93c-4b17-9f6f-c8c35c9712c0	t	Uwinka	e1ffe0a8-ff5f-4b55-84ae-0bd6620b8486
0b84a11a-f9bc-4b6d-b4f3-24afb163e623	t	Gahira	67636dc6-e3a0-44d9-94bd-4cea9690f097
4d0537b9-e535-4258-a13e-dc27fb3d9d6d	t	Gatare	67636dc6-e3a0-44d9-94bd-4cea9690f097
680b762d-89f9-405d-96fa-01b60abefec3	t	Karambi	67636dc6-e3a0-44d9-94bd-4cea9690f097
a4143a8f-aec9-467e-a33e-fff9faac4840	t	Uwicurangiro	67636dc6-e3a0-44d9-94bd-4cea9690f097
12c61996-a03b-46c1-9af8-d0063b4a1855	t	Uwurunazi	67636dc6-e3a0-44d9-94bd-4cea9690f097
4b7a252e-e682-4e67-804e-bc2dcdfb6285	t	Gatwa	0b0b96ad-1137-4b38-bb9e-88e721019dcc
0f94b0ab-2d26-48c7-b691-3cac6784924b	t	Nyamirama	0b0b96ad-1137-4b38-bb9e-88e721019dcc
34ad6fae-1728-4d65-907e-bccd5cb43186	t	Maheresho	4a7ce83b-54f1-404b-88fd-defe513294ae
909e46da-a8b6-4a0f-99da-29c1f42a7681	t	Gasharu	b38ad7ec-e2e1-490f-81a4-3ecf0cc93295
48395493-a820-4dc2-bed6-39d40d5345e5	t	Gisiza	b38ad7ec-e2e1-490f-81a4-3ecf0cc93295
bea84a7a-d5b2-4775-af7c-cb9dda3bbef4	t	Kabuhoro	37e2aaa5-96b3-4444-9952-60487afe0ba9
63b7ef4a-5fc6-4838-9b1f-740cba755da4	t	Kirenzi I	37e2aaa5-96b3-4444-9952-60487afe0ba9
f89ac997-749d-4ae1-a5f4-52341187bb5a	t	Rutabo	37e2aaa5-96b3-4444-9952-60487afe0ba9
74e401dd-7638-4a38-8db0-7f495df91a95	t	Karambi	b4fc8e05-d797-454d-9203-992245529d6f
888e2190-b8e5-4ffb-b898-ff1b15dd6396	t	Kigarama	9b256b01-7e8f-4fda-87f9-37d8640a7d57
5d82132a-32ed-4df8-9f30-6f7c4e876749	t	Nziranziza	9b256b01-7e8f-4fda-87f9-37d8640a7d57
75c37259-b48c-48f4-a741-181b17264708	t	Rugarama I	9b256b01-7e8f-4fda-87f9-37d8640a7d57
de293c42-13c4-49b5-ac2f-99c660abdc3e	t	Gasiza	3c7feffc-acab-4c12-82c6-dbc9edf428b5
833e5969-877f-4f26-85f4-1008cb122f07	t	Turyango	3c7feffc-acab-4c12-82c6-dbc9edf428b5
6d84788f-d8c3-4864-9218-8ae2ad2e963b	t	Gasura	d4e3d6ec-dc37-4e84-82ec-4077df201565
5f785cce-057b-4ed7-b9e5-b5eca09c4537	t	Murambi	d4e3d6ec-dc37-4e84-82ec-4077df201565
3f253b7f-4c07-40ea-93e7-26cffc02ef8b	t	Nyakabuye	d4e3d6ec-dc37-4e84-82ec-4077df201565
105af73d-f606-4332-8c60-53623c1a898c	t	Kabakannyi	c771409e-45f3-4535-93ae-091efe6c0608
c7182e32-1772-499e-9bc6-a0a26716a3fc	t	Kavumu	c771409e-45f3-4535-93ae-091efe6c0608
52a52ed0-d650-409c-a947-47649c64e5de	t	Kayogoro	c771409e-45f3-4535-93ae-091efe6c0608
8ffdf78b-6ea0-4aae-bf1e-6410d8d2fbb7	t	Nyakibungo	c771409e-45f3-4535-93ae-091efe6c0608
661e9968-5e3c-43ec-b350-e397fd5da7a7	t	Nyakirambi	c771409e-45f3-4535-93ae-091efe6c0608
0b15d144-dcb0-4ecc-9c52-8c440661e115	t	Cyabasana	6aa97242-13b7-46b2-aaa5-900adee6cbf8
85ad0147-e6a7-4fd3-a941-d51aeebf4299	t	Mutakara	6aa97242-13b7-46b2-aaa5-900adee6cbf8
fdab23e2-dfdf-4170-9e82-2ddccffce16a	t	Gasagara	6245a6ed-4ae3-4023-a99f-68e6c143f8d7
f651ab7f-e0ba-4882-9539-c9657bd0c164	t	Mubuga	6245a6ed-4ae3-4023-a99f-68e6c143f8d7
926067b0-5d7e-495b-962e-26c5b6385fe6	t	Nyakabuye	6245a6ed-4ae3-4023-a99f-68e6c143f8d7
0fde8a8b-d905-4e59-b701-cf3636d16da0	t	Rutuntu	6245a6ed-4ae3-4023-a99f-68e6c143f8d7
34ae6e2e-8a88-40ec-a727-cbe658dedfed	t	Kibaga	adf30a88-fcdc-4e59-95d4-1ffa409faf5c
dca1f93f-9e26-4bab-8c22-c5ed780a0dd8	t	Ruhuga	adf30a88-fcdc-4e59-95d4-1ffa409faf5c
104f5b81-f8a3-4fdd-9714-22e2ea251d67	t	Uwabarashi	adf30a88-fcdc-4e59-95d4-1ffa409faf5c
e91e5b18-e5ab-4853-82bd-963f50db955c	t	Kanyiranzoga	b9ba7046-395b-40a1-8b3c-152cd23bd338
020776a4-6b97-4be8-96cf-a68688825c63	t	Ryanyakayaga	b9ba7046-395b-40a1-8b3c-152cd23bd338
174b7cf1-317c-464b-a684-b802d536dd31	t	Busanza	eeb119c7-171a-4279-85ef-5c9067eb89cd
ce44bb2a-4065-4bd2-8ea5-7bd58df7f80c	t	Bitaba	012009b0-b206-4f66-9618-4e4fa00e5b14
24ef71c5-12a1-41f6-9083-6699f3323454	t	Gakereko	012009b0-b206-4f66-9618-4e4fa00e5b14
1edd33dc-03f9-4f7a-b954-98fe74f80766	t	Rebero	90f63de8-730e-4ad2-8532-557f62f74d64
9449ee0e-166a-4665-8480-c543cfabc884	t	Nyaruhura	c05dfa25-5942-4289-97f4-c0a588610722
fcda230e-d7d7-41d4-b9aa-e4f648573c91	t	Rugazi	c05dfa25-5942-4289-97f4-c0a588610722
545d6f77-594e-4e8e-9ad7-2f32abd419f8	t	Kizanganya	58fed7b9-4eec-4542-8dfb-8521ef9454b0
836f6f13-f683-487c-924c-2b5548874744	t	Remera	58fed7b9-4eec-4542-8dfb-8521ef9454b0
4dab75fe-ec71-4e9b-98e0-13a718cb19ba	t	Rutoyi	1bf13645-cdf5-436a-90cb-8a5a494b7b18
5fa438f5-b7f8-4d5d-9e03-5e9070a7e4b0	t	Bweramana	0ccd2147-20ac-4fac-a825-ef15ad30d739
a9e2f1e3-4093-47a6-8c1a-a5edb39c5d55	t	Gashwati	0ccd2147-20ac-4fac-a825-ef15ad30d739
40705c86-37ab-47b2-9b98-5d8fd3100e87	t	Mushubi	0ccd2147-20ac-4fac-a825-ef15ad30d739
04275e95-4bed-48e9-80f5-71f27abcdb80	t	Buhanzi	ad3a78af-87d3-464d-9593-ee0d26a5e6b0
ee970861-97ef-4bb9-bb52-2672c364bb2d	t	Rugeyo	ad3a78af-87d3-464d-9593-ee0d26a5e6b0
e293feba-e5a0-413e-9f51-c4b276913171	t	Gatorove	08b8c071-7758-4b89-94d8-87f85df465bf
454ae12f-dae3-4825-81e4-65f7f48a195d	t	Gihunga	08b8c071-7758-4b89-94d8-87f85df465bf
84503b78-c50f-4cb9-8620-98ef9c08262c	t	Kimbogo	08b8c071-7758-4b89-94d8-87f85df465bf
e72d07a8-8c28-4519-a28b-f129cbd882ed	t	Musaraba	08b8c071-7758-4b89-94d8-87f85df465bf
e1012bc0-8d56-4bf6-a717-ea502dab19ee	t	Rusoyo	08b8c071-7758-4b89-94d8-87f85df465bf
0f593c25-8350-4a5f-980d-eaa6f9600919	t	Rwimpiri	08b8c071-7758-4b89-94d8-87f85df465bf
678be136-aa48-4c61-8652-f692240c83e6	t	Gihwahwa	8849652b-9705-4a74-baf2-d44ac508466f
5bf5a236-20f2-40cb-98b2-0d065ccc9c72	t	Mutengeri	8849652b-9705-4a74-baf2-d44ac508466f
c4b4ab39-5d37-453f-80dd-210d53af30be	t	Mugari	c0f98b0c-aaf4-470e-b0b2-2ac161e2c1ad
4a93f19f-1fec-42ee-9ae9-098709495e9f	t	Bisharara	9c165fe2-99ef-45b5-b2b7-8510931e187b
a145a82d-c6af-4084-9613-827a21046e58	t	Rutoyi	9c165fe2-99ef-45b5-b2b7-8510931e187b
8a1d109d-0fac-4124-a38a-56571430aef5	t	Twiya	4b980882-bd07-407b-8e75-b4b3c487d3fe
000c750a-6642-4779-9356-7ffc05e34424	t	Kagarama	59ef462f-c1f5-4d33-aca8-c638fc78c931
becf5c26-2d32-4591-82cd-cf926f2fae65	t	Murangara	59ef462f-c1f5-4d33-aca8-c638fc78c931
7c6e9e33-be09-4eb0-a7e8-a6d14d24e8ed	t	Muse	59ef462f-c1f5-4d33-aca8-c638fc78c931
5de83650-77c5-4d03-b2a7-259af0cade59	t	Gasenge	c2a898b8-f6c9-4d1b-a153-7b3c358a3162
56e297f3-8bf0-4fb8-afef-dcda1cd9b2b5	t	Kigusa	c2a898b8-f6c9-4d1b-a153-7b3c358a3162
ae9ae3ae-400c-421c-8b9f-a56635c0cb31	t	Muhati	c2a898b8-f6c9-4d1b-a153-7b3c358a3162
3773462d-2fd2-4a33-b6b6-63782edc743c	t	Buremera	0f0ad195-fc8d-4508-a81e-57cb1a7cca1d
ec4a17c3-677f-4696-9a8e-94b12ba82884	t	Cyimicanga	0f0ad195-fc8d-4508-a81e-57cb1a7cca1d
3fd127fd-b1fe-4638-8d7e-18f8986e0625	t	Bireka	1e2b9729-1a09-48af-900a-9d510dba57cf
ce7b77b1-88a2-4a7f-94f1-607e179c3afe	t	Kibwije	1e2b9729-1a09-48af-900a-9d510dba57cf
d55e0035-02df-4d60-9ea3-b4fb2f6c1960	t	Muhumo	1e2b9729-1a09-48af-900a-9d510dba57cf
54d46fce-e1ea-4c0f-a035-7de8676ffed7	t	Rugeti	1e2b9729-1a09-48af-900a-9d510dba57cf
ad2a0f25-5488-4ab9-bb75-54d6665ea56a	t	Rukereko	1e2b9729-1a09-48af-900a-9d510dba57cf
937e2d7a-b89e-41dc-8807-57b67c4b2778	t	Vumwe	1e2b9729-1a09-48af-900a-9d510dba57cf
b3694fe2-8124-40ff-9327-0d81bb52363e	t	Gakoma	92f5a8b6-4624-401b-897c-e574db2f9856
e4a53daa-6811-4461-af57-25d0c7ce6f72	t	Nyarugeti	92f5a8b6-4624-401b-897c-e574db2f9856
660b20e4-49c3-47e3-b722-46b1f66a734a	t	Bigumira	5abbfdc6-186e-4f09-ac4f-68e21b2b1189
0f27f6df-9cfd-40c5-9e48-cb0271414335	t	Cyumuganza	5abbfdc6-186e-4f09-ac4f-68e21b2b1189
5b391b2e-c5a7-4964-94b3-f9e2a9e5de8e	t	Gakoko	5abbfdc6-186e-4f09-ac4f-68e21b2b1189
d14e09e5-0c37-4eb8-a386-2105c8ac54c3	t	Bunyunyu	e2223389-869d-4c7d-a3d8-07f36002d759
bb7403fb-357c-41b1-b935-d8a15aa96eaa	t	Kibugazi	e2223389-869d-4c7d-a3d8-07f36002d759
782b10e7-8134-4c7a-b8d3-bcbf5fed529e	t	Kunyu	e2223389-869d-4c7d-a3d8-07f36002d759
36a6afef-1d8c-4344-8261-84c85fd1e474	t	Uwinkingi	e2223389-869d-4c7d-a3d8-07f36002d759
440189fe-4ef0-41dd-a918-2ce4cb5767a4	t	Bishya	ea562b8b-f9f4-4cc2-afbd-63f4e0e1a522
766140fd-ad75-412e-9d1e-e724aa27c176	t	Cyumuganza	ea562b8b-f9f4-4cc2-afbd-63f4e0e1a522
29d61611-de05-41c1-8207-af0e2dbe1b9a	t	Kabuga	ea562b8b-f9f4-4cc2-afbd-63f4e0e1a522
5329b491-56f7-4b64-9860-ae615e8abb82	t	Sabake	ea562b8b-f9f4-4cc2-afbd-63f4e0e1a522
95f35f5a-8a61-4911-abed-4815fa033380	t	Sekera	ea562b8b-f9f4-4cc2-afbd-63f4e0e1a522
801ea8b2-fa87-4f35-8891-e6d40cc9e679	t	Rushubi	d0a13a95-a260-4a03-baa6-0654a6df4d16
fa505162-aec8-4c10-8641-4dc521f26903	t	Gahango	f55f91a8-7259-4b97-bdde-423f24cf6e79
b3e476b2-fd12-418f-940e-f677d0004c7c	t	Kanyampongo	f55f91a8-7259-4b97-bdde-423f24cf6e79
070c4632-c429-414f-8e7d-edcf00e341dc	t	Kimina	f55f91a8-7259-4b97-bdde-423f24cf6e79
34730995-ceaf-4dd2-a8ef-a126938c63ad	t	Munyege	f55f91a8-7259-4b97-bdde-423f24cf6e79
00ae1d0c-c933-41fb-8b0e-7f52036c0f75	t	Nyarurambi	f55f91a8-7259-4b97-bdde-423f24cf6e79
d20f5aa3-cc7c-4af4-94cd-f547f8cc602c	t	Munini	719bc2f1-f945-4847-abbe-4241cafd2e2f
a88e1095-4ae9-464b-9c61-19467e10ea14	t	Nyamugari	719bc2f1-f945-4847-abbe-4241cafd2e2f
fd455653-5860-48d9-8e4b-6ddf51a4d41e	t	Rugeti	719bc2f1-f945-4847-abbe-4241cafd2e2f
d4b2c8f5-c21a-4236-a420-f091b44bc06c	t	Bigega	f4dc0086-9dec-4097-b407-c065d26a1404
10d44509-767b-47c0-8b59-33dfd481df80	t	Karama	f4dc0086-9dec-4097-b407-c065d26a1404
a659c55d-c1ba-4822-807a-9eb4a3e4c153	t	Kavumu	f4dc0086-9dec-4097-b407-c065d26a1404
6dda4d6f-8989-4487-91ba-5943e63c0ade	t	Nyakwibereka	f4dc0086-9dec-4097-b407-c065d26a1404
69335111-cb02-41a6-9f49-22d6f012516a	t	Gihisi B	89570807-d2cc-476f-a8ce-453a4d607440
7a6fa087-c7a0-4068-8a82-aa57de45efad	t	Majyambere	89570807-d2cc-476f-a8ce-453a4d607440
5ec1698e-ccdb-4480-80da-67781f42c990	t	Mugandamure	89570807-d2cc-476f-a8ce-453a4d607440
a1495941-daec-42b9-a9be-e5d03e4d3fb8	t	Nyagatovu	89570807-d2cc-476f-a8ce-453a4d607440
5339e0ca-408c-47cf-abbf-306a6ef4ab6b	t	Rukandiro	89570807-d2cc-476f-a8ce-453a4d607440
5914446a-640c-4cc5-abb0-852e9a12ffcd	t	Nyamagana A	89570807-d2cc-476f-a8ce-453a4d607440
a1ad8bf4-9687-429c-b030-b7fa9537c128	t	Kabuzuru	66ba4f1f-2d0a-4f9f-80af-1599880c53e3
879b03ec-045c-47f0-92dd-9489c9a103d7	t	Ngorongari	66ba4f1f-2d0a-4f9f-80af-1599880c53e3
e47bb574-f4e2-47b7-9882-0748dbeacc08	t	Rugari A	66ba4f1f-2d0a-4f9f-80af-1599880c53e3
f6a054a5-a093-45cf-9dbb-d53193a9b859	t	Rugari B	66ba4f1f-2d0a-4f9f-80af-1599880c53e3
c68cde55-c49c-4760-85d5-6291eec001fe	t	Gatsinsino	2627d6e7-6165-48a3-8171-89f5cdc599a4
824640a8-82cf-43cf-9636-bcd3bfa0a558	t	Kavumu	2627d6e7-6165-48a3-8171-89f5cdc599a4
192dc319-d8a9-4540-8dec-6acdf3dcc432	t	Kigarama	2627d6e7-6165-48a3-8171-89f5cdc599a4
2d6680d9-3543-4121-98f5-6bd17a797750	t	Kivumu	2627d6e7-6165-48a3-8171-89f5cdc599a4
7de57852-8da8-4f00-8ad1-6e928141a584	t	Mugonzi	2627d6e7-6165-48a3-8171-89f5cdc599a4
ec97f82a-475a-4324-9489-dae3dc7ff61b	t	Nyanza	2627d6e7-6165-48a3-8171-89f5cdc599a4
77dfa5b8-acd1-4894-b294-025dcf29da44	t	Nyarunyinya	2627d6e7-6165-48a3-8171-89f5cdc599a4
8d8c2e31-359a-44e1-97b0-b172752f5ccb	t	Bukinankwav	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
8831a9cd-05d7-4878-bdeb-f591b2c31911	t	Gisando	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
c6911c3e-1e46-4ed4-b0ed-aa55e627176b	t	Kabona	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
a3db1bab-519e-438e-a95f-a2d38a7f7fc0	t	Kidaturwa	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
1126e8aa-9a80-49ba-a73a-c291cb745fee	t	Murambi	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
7893c5e7-10df-4e9a-a1f0-221659ab7606	t	Mwima	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
00fb63b2-9ff5-47ae-be7d-623bf7ac8e61	t	Nyabisindu	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
19bbd849-c9ee-445e-ae39-4891561f8230	t	Rukari	5c020db8-e406-4f5f-a85d-d979cf6a4bf0
47fd77c2-1429-47d7-a21f-31bf1a5ec310	t	Gitega	70a0f026-e9ac-4608-9f9c-1372af770cbb
f0c0b542-42cc-4a33-97ec-4105ce9c3663	t	Kayenzi	70a0f026-e9ac-4608-9f9c-1372af770cbb
da1eb1ec-2adb-4a0e-879e-cff95adaf929	t	Musumba	70a0f026-e9ac-4608-9f9c-1372af770cbb
147b5edd-ab37-458d-a69e-a940e817cfcb	t	Nyacyonga	70a0f026-e9ac-4608-9f9c-1372af770cbb
19ffd14c-b448-4903-9d44-f6837978e2a2	t	Nyagasambu	70a0f026-e9ac-4608-9f9c-1372af770cbb
b93990d8-4b04-48a1-a3b1-e91ab5242d9c	t	Rushoka	70a0f026-e9ac-4608-9f9c-1372af770cbb
6b6d9113-277a-49fb-8aeb-db32cda95f03	t	Kimirama	359f7a62-945c-4629-9c40-f017bb0aec20
17e8349a-70fe-4702-951e-9249691647c4	t	Ndamira	359f7a62-945c-4629-9c40-f017bb0aec20
1bb94b32-f2f5-43c9-b1b7-e0813e86ae10	t	Rugarama	359f7a62-945c-4629-9c40-f017bb0aec20
1ba330c9-9672-4954-b74b-15ba3138540b	t	Bweramana	b561b7d0-40da-49c3-9df0-2e77af89603a
a1ecdd3a-7229-47a3-829f-9f5d0a3c7cb9	t	Masangano	b561b7d0-40da-49c3-9df0-2e77af89603a
59c25b82-efb8-4c30-8e10-35abd870051d	t	Murambi	b561b7d0-40da-49c3-9df0-2e77af89603a
bfbb9160-92eb-4774-8b04-9e84f2bf6b75	t	Nyarugunga	b561b7d0-40da-49c3-9df0-2e77af89603a
75087550-08b4-4d78-8bd1-7555db90316d	t	Runyonza	b561b7d0-40da-49c3-9df0-2e77af89603a
ce02d3ee-0556-4331-bd89-3c31210d58b2	t	Kagarama	6b2206de-12cc-4a9c-a16d-61693769c69a
f0e08b65-3d73-4aa7-b246-3b3094cc1dbc	t	Kigali	6b2206de-12cc-4a9c-a16d-61693769c69a
50353d46-1c9b-46e9-9af3-01dbf4f7b2c0	t	Kivugiza	6b2206de-12cc-4a9c-a16d-61693769c69a
af199b27-0e5a-47d3-b2b7-f105e85ad287	t	Rwara	6b2206de-12cc-4a9c-a16d-61693769c69a
721ec15e-890e-4d07-858f-71f979c8be1c	t	Cyamugani	62eedf19-6978-43aa-912c-d6e0d1414f14
3f40061d-db2f-4cab-8d21-e604ee8d45b0	t	Gasambu	62eedf19-6978-43aa-912c-d6e0d1414f14
fa36196f-b6ee-4bab-ac20-053487da1e53	t	Rwangoga	62eedf19-6978-43aa-912c-d6e0d1414f14
aa270b97-70ff-49d7-9fde-efeb41866df3	t	Nyamoyaga	2893054e-91bd-4fb4-8fea-84653f57b636
2e8f35fb-090e-4b37-8965-d25057e05aa3	t	Rucyamo	2893054e-91bd-4fb4-8fea-84653f57b636
68949a81-a846-4ef8-8b5f-5d97a490f9fb	t	Saruduha	2893054e-91bd-4fb4-8fea-84653f57b636
fe3d4936-55ef-4d3e-bfe1-5105789b6268	t	Kabeza	f58d76e1-fb09-41c4-bb80-11a0038c4734
18f306f4-4c71-4e44-8fc5-d6b27899f0e6	t	Gahondo	8cc96cc9-e11a-4e75-81ce-1dc875936db3
4b80e802-45e5-4bcf-8318-577d6bfcf084	t	Gatongati	8cc96cc9-e11a-4e75-81ce-1dc875936db3
bc7c34ff-78f3-492b-9d83-2d0ed5bee441	t	Karama	8cc96cc9-e11a-4e75-81ce-1dc875936db3
f236e33d-573a-4a3d-89dd-d46ee4c17ad8	t	Nyabinombe	8cc96cc9-e11a-4e75-81ce-1dc875936db3
038d7813-96e6-49fb-a894-377c09a640c4	t	Nyabinyenga	c58856ab-2db7-4169-a5dc-aace8ecca05a
2067efa1-592b-415e-b329-9422a164cf90	t	Rugote	3b289be6-a720-4248-91eb-cc95e3fe0f7d
f60e0a0c-c202-4039-9c2e-e903dd1ad30a	t	Ruvuzo	3b289be6-a720-4248-91eb-cc95e3fe0f7d
d1d2fab3-7802-4cdb-bdbc-eaa815e49a93	t	Gahunga	5fde66c2-5234-4128-8f78-fea311818d3f
1afeb1eb-99f2-4f5f-88f7-5138be8637b0	t	Murambi	5fde66c2-5234-4128-8f78-fea311818d3f
d09fc483-27e6-41b9-91f1-f872bcde6752	t	Kamatamu	7cb07092-6d4f-4ac6-8852-bbc592663ce3
ff3d5937-1104-4292-8306-6053e795c09e	t	Matara	7cb07092-6d4f-4ac6-8852-bbc592663ce3
0b8ced7c-fb8e-4637-99fd-c732b0874e9a	t	Muyebe	7cb07092-6d4f-4ac6-8852-bbc592663ce3
a9217d1b-4d36-454a-95ae-5f0e3a9d5f07	t	Nyamunini	7cb07092-6d4f-4ac6-8852-bbc592663ce3
ae8fafa7-8d0b-4da1-800a-b84f192ad1b2	t	Rutete	7cb07092-6d4f-4ac6-8852-bbc592663ce3
ba153c66-31c5-4d32-8029-7e6ff8ebd293	t	Binyana	20faace8-a63b-4888-ba4f-9b69583cf42f
151424c1-f4b1-485f-a6e3-ab2a992a81c2	t	Gihama	20faace8-a63b-4888-ba4f-9b69583cf42f
34fb7c7b-b9aa-49a0-89e7-566cab6010f6	t	Karambi	20faace8-a63b-4888-ba4f-9b69583cf42f
cab8982d-937f-4d90-a07c-2d8cd1123edc	t	Karehe	20faace8-a63b-4888-ba4f-9b69583cf42f
e2a150d9-fcaa-49f7-a58a-1f3e16cc292d	t	Mukoni	20faace8-a63b-4888-ba4f-9b69583cf42f
ffb32ee7-9a27-4768-8b7f-18f141d9d8b8	t	Rukore	20faace8-a63b-4888-ba4f-9b69583cf42f
6a833632-444b-4669-b87f-2b2f22cd805f	t	Gatongati	bbea2a7e-21da-474e-8dcf-e1e8e6410ee0
de1d2679-f929-4ffc-912e-cdcd55602aa6	t	Gicumbi	bbea2a7e-21da-474e-8dcf-e1e8e6410ee0
92eb1145-1dff-4655-8293-a9879d1b8c74	t	Kabeza	bbea2a7e-21da-474e-8dcf-e1e8e6410ee0
d4d060a6-2b30-4e02-9654-69bc20bbe2a0	t	Kanyinya	bbea2a7e-21da-474e-8dcf-e1e8e6410ee0
f419ace4-6fc2-4d51-b2a1-955ef220850a	t	Kivugiza	bbea2a7e-21da-474e-8dcf-e1e8e6410ee0
5b02ae59-bacb-4724-a69d-8082b33f24be	t	Kibilizi	87b80c92-2d15-43a9-99f7-b4604657a774
1d9e8a43-14c2-41b7-8493-b8b1e7361ce9	t	Mubano	87b80c92-2d15-43a9-99f7-b4604657a774
efbd9137-5faf-42b3-bc31-7b765eabb9a2	t	Mubuga	87b80c92-2d15-43a9-99f7-b4604657a774
99304c40-a6a0-4764-9ff0-cf74d7070255	t	Mutima	87b80c92-2d15-43a9-99f7-b4604657a774
6ecaa04d-21d5-4dac-8d7a-ca6d4bba18eb	t	Nyarurama	87b80c92-2d15-43a9-99f7-b4604657a774
255ad0d2-e692-4543-9a12-1b4cf04f6fa3	t	Saruhembe	87b80c92-2d15-43a9-99f7-b4604657a774
c2e68f94-027b-4095-acf8-6deb3071d985	t	Shusho	d68bd4ab-b319-49cf-ad89-40b528927d5e
0958c739-f37e-4fa7-a550-80b7ab8e64c1	t	Karama	d68bd4ab-b319-49cf-ad89-40b528927d5e
e47b42c4-3599-40f0-9b33-13525f401054	t	Nyesonga	d68bd4ab-b319-49cf-ad89-40b528927d5e
76441059-1b35-439a-8304-fa0f7f5dbddb	t	Kavumu	912db2d1-5aa1-411b-91d4-b5a3c50202fe
a69d2789-a511-47dc-a005-8a9f216ba221	t	Nyabusheshe	912db2d1-5aa1-411b-91d4-b5a3c50202fe
e373b913-fcaf-4b2c-aa58-ab518b4e6592	t	Runyinya	912db2d1-5aa1-411b-91d4-b5a3c50202fe
47cb6a64-c89c-4cbc-a38d-3253d73353ec	t	Gashikiri	f08cf96d-d729-46df-97a2-0c047f5a569e
f4dbb1e5-310f-4f07-9e68-de793a1c8bb6	t	Gicunshu	f08cf96d-d729-46df-97a2-0c047f5a569e
4e3f220d-ca5a-4874-9470-852ba6c89419	t	Kirerabana	f08cf96d-d729-46df-97a2-0c047f5a569e
ac4e166a-03fe-4c87-8813-f0b412f66a0b	t	Nyagacyamo	f08cf96d-d729-46df-97a2-0c047f5a569e
3b76a326-d209-4218-8ef7-f5926e6ac9a0	t	Rugarama	f08cf96d-d729-46df-97a2-0c047f5a569e
244195ad-a48b-49ce-a1b1-d51ed1f3f0a5	t	Serivise	f08cf96d-d729-46df-97a2-0c047f5a569e
ae42242d-a6c9-44b2-856c-98c47ef3f2c7	t	Bwambika	33f860d5-7701-4e24-ad91-7cdb7f429fec
0b87cf8a-e660-4de7-a879-85a0cc0f1a52	t	Gisoro	33f860d5-7701-4e24-ad91-7cdb7f429fec
90bba600-f8e8-44c0-b2bc-e774d033ad3b	t	Giturwa	33f860d5-7701-4e24-ad91-7cdb7f429fec
0159ac78-9d65-479b-aef4-e637631e4bde	t	Kabacuzi	33f860d5-7701-4e24-ad91-7cdb7f429fec
e5d7ca05-c7f6-4862-b868-8817d0ae5275	t	Akintare	a7da0f7f-0283-4e81-8ae0-77bbf1816666
78b3af76-e79c-4a1a-8f56-c6e4d17bc59c	t	Buharankakar	a7da0f7f-0283-4e81-8ae0-77bbf1816666
e055efee-4b1e-47a7-a542-1920d059c8f5	t	Buhoro	a7da0f7f-0283-4e81-8ae0-77bbf1816666
38e97f4a-22ac-47a2-8bc4-09e5b071c4b1	t	Karama	a7da0f7f-0283-4e81-8ae0-77bbf1816666
791f97d4-5f52-4054-aac4-3af4c0d3e492	t	Kigarama	a7da0f7f-0283-4e81-8ae0-77bbf1816666
b6670a3c-c27a-4f14-a0ac-dc6c19cce164	t	Muramba	a7da0f7f-0283-4e81-8ae0-77bbf1816666
da6bb5f4-085c-4cc3-8ac9-1e7effc10eb1	t	Birambo	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
70a5c9d9-ed2c-4588-a8c4-51e63c22e835	t	Bweramana	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
60c37141-4561-4d72-a5af-c63f6a434dca	t	Cyerezo	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
c9009205-8f8a-457d-b881-91a50fe7025a	t	Cyikirehe	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
8507da64-883e-4d3f-88a9-a41c97a1c6b8	t	Cyumba	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
fb902dc4-33ab-4182-a5ab-7993b6b2d7db	t	Gasharu	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
954c3897-7fa4-4d09-a353-26818a2074bb	t	Kamabuye	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
a8779c40-58d6-44c4-889d-e2e806fc877f	t	Karambi	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
6c4e241d-8441-4d93-84fa-f6de1f90220b	t	Nyarutovu	5c181bfb-11e2-4e00-9adb-214e9b5d79fa
f31f3c82-df4d-4dba-9b20-3b0272a424da	t	Cyahafi	6300b0fd-fc24-4a59-8356-6c8bba843e24
43860755-d8b6-4008-8321-688267907017	t	Gatagara	6300b0fd-fc24-4a59-8356-6c8bba843e24
0a508356-fa44-401e-9ee5-25d19290b221	t	Karama	6300b0fd-fc24-4a59-8356-6c8bba843e24
d5352c5e-b4e8-40c2-b8b1-ff015a19b528	t	Karuhwanya	6300b0fd-fc24-4a59-8356-6c8bba843e24
3043f791-b27d-4d5e-af05-924547e8a173	t	Kinyogoto	6300b0fd-fc24-4a59-8356-6c8bba843e24
5412ed13-0fb5-41af-b196-b31b505ed81f	t	Nyamuko	6300b0fd-fc24-4a59-8356-6c8bba843e24
c45faa6d-2a8c-49be-9b5a-5e9c5df066bc	t	Gahoko	387afd68-4da4-4bc6-98c0-75332e7fb104
7bb7e402-f869-4d8d-9d0e-d1981f3cdd9e	t	Kaganza	387afd68-4da4-4bc6-98c0-75332e7fb104
ccea7c2a-0f77-45eb-a7f5-96f6975f8922	t	Muturirwa	387afd68-4da4-4bc6-98c0-75332e7fb104
2d3018c9-80be-4562-80f5-57b4d214f7df	t	Nyabishinge	387afd68-4da4-4bc6-98c0-75332e7fb104
48e0ac98-66c1-4327-9c0a-aef602d6b5ba	t	Nyankunamir	387afd68-4da4-4bc6-98c0-75332e7fb104
b277811d-99b2-481d-9789-33159088acce	t	Birembo	ba85919f-65b6-40a7-a966-4c1b58b20e13
e2c55b83-8fdf-4595-aded-c545d87d4d25	t	Nyakabuye	ba85919f-65b6-40a7-a966-4c1b58b20e13
0fa591f0-11ce-4ab4-baf4-f6073217decf	t	Nyamazi	ba85919f-65b6-40a7-a966-4c1b58b20e13
8e88a456-5886-4ea4-92a4-c68189c455b2	t	Remera	ba85919f-65b6-40a7-a966-4c1b58b20e13
117de9e5-fbd9-4cc3-8cbc-ca8a92481418	t	Mwanabiri	612346ee-f3d3-45cf-a672-1d1d081fa0a2
cd6fe270-0c6d-42cf-b08a-02ba0d101369	t	Nyarunyinya A	612346ee-f3d3-45cf-a672-1d1d081fa0a2
1c4df638-8437-45b4-80ca-b0e231131521	t	Rutete	612346ee-f3d3-45cf-a672-1d1d081fa0a2
bb745c08-e082-429e-8fdb-20a74575bd79	t	Kabarima	0e513155-f4ca-4c4d-9ad7-6d9d43aa883d
92bfae36-5a12-49ae-995a-e693536de222	t	Kibonde	0e513155-f4ca-4c4d-9ad7-6d9d43aa883d
3d381f79-0a18-4501-9008-a3507ceda645	t	Kigarama	0e513155-f4ca-4c4d-9ad7-6d9d43aa883d
54f2815a-f0a8-42b5-bdb7-d590f5808af0	t	Ruhosha	0e513155-f4ca-4c4d-9ad7-6d9d43aa883d
f46c91d6-a82b-42a2-9e64-f56888367471	t	Buhaza	d40e0d39-0ada-4b36-8930-7d7af5f22968
e57b74dc-6172-49e8-a519-e3f5345b5f26	t	Kimfizi	d40e0d39-0ada-4b36-8930-7d7af5f22968
5acdfd43-e8a7-48a6-bb94-71188699b7cc	t	Ruyenzi	d40e0d39-0ada-4b36-8930-7d7af5f22968
c9b59274-9ccb-4a7b-9fd5-5e66aaaf2462	t	Rwabihanga	d40e0d39-0ada-4b36-8930-7d7af5f22968
ee0f98a9-a84e-4ec2-8faa-ad893126330d	t	Bugina	fff5760a-4a52-403c-aff1-c8c063e389c8
bf95cc0c-3c9d-4484-a5bb-2c69238bca4c	t	Kalilisi	fff5760a-4a52-403c-aff1-c8c063e389c8
93cf8671-65be-4231-9a11-0d1d0e0234ff	t	Kinyana	fff5760a-4a52-403c-aff1-c8c063e389c8
352067e6-eab8-4c3d-a23d-f7682de6e94d	t	Musenyi	fff5760a-4a52-403c-aff1-c8c063e389c8
7e86c50a-b6b5-4b99-aeb7-c4d52b3534f4	t	Nzovi	7110203f-8eed-4c9c-8fdb-437e5cd42430
b15967d0-4157-4061-ace2-6dc8635f1fe9	t	Cyegera	869f9e30-160e-4160-8324-cf864392fc7d
32f7dc07-6c64-4bf5-9914-2b3e1ca377a0	t	Gituza	869f9e30-160e-4160-8324-cf864392fc7d
f8c82295-918c-46ab-935c-0332f8d79f11	t	Kanyundo	869f9e30-160e-4160-8324-cf864392fc7d
a23e68f2-6961-4447-bbf0-ffc02f4afc1e	t	Nyarugunga	869f9e30-160e-4160-8324-cf864392fc7d
781f888a-0d80-4278-a190-8f2a72277699	t	Mugari	4bab2be3-e2ea-4828-b081-7595008073da
56f4bc61-ac23-4253-bb47-1fa78a762de2	t	Nzoga	4bab2be3-e2ea-4828-b081-7595008073da
a2f46675-e82d-444b-82c9-838cdb7403e6	t	Gisayura	7b145b50-2793-430f-bd45-5c23500719ad
40a26cd2-0e6b-4297-a493-84a7b42ff683	t	Kiruhura	7b145b50-2793-430f-bd45-5c23500719ad
49343502-f4b0-4b05-82ed-0a04b0fec593	t	Marabage	7b145b50-2793-430f-bd45-5c23500719ad
c29cd9b8-c9a2-467d-b468-3e0acada3872	t	Ndago	7b145b50-2793-430f-bd45-5c23500719ad
c9a4c047-2a02-494b-ae0a-7e58e77a61cf	t	Rugarama	7b145b50-2793-430f-bd45-5c23500719ad
9a451ff9-0bdf-498c-98f5-9e77e73a335e	t	Kankima	f978d674-1843-4299-baa1-bd8575f811f6
357fd864-922e-4bec-b256-bb317620b3b3	t	Karuyumbo	f978d674-1843-4299-baa1-bd8575f811f6
c3c53051-ad7f-4ca9-9558-bff8231e88b4	t	Mpande	f978d674-1843-4299-baa1-bd8575f811f6
8f8fc806-43c5-4226-b0cd-0aeebf333132	t	Nyabigugu	f978d674-1843-4299-baa1-bd8575f811f6
f443a17f-4e6c-40cd-bc70-ccc2d17030ee	t	Nyarutovu	f978d674-1843-4299-baa1-bd8575f811f6
4891a04b-2504-4df8-9237-3dd697ab69a6	t	Ruyenzi	f978d674-1843-4299-baa1-bd8575f811f6
3bbd1e7f-f390-4d8b-9b60-4393fc0025ce	t	Rwimpundu	f978d674-1843-4299-baa1-bd8575f811f6
334db85c-340c-4bfe-a5bc-34e90c472616	t	Kamabuye	5dab8bf9-62a0-4133-9c8f-2be8f188b4e2
c7ccf0cc-cbcd-43f0-a4cf-afd3f23a8966	t	Ntebe	5dab8bf9-62a0-4133-9c8f-2be8f188b4e2
a5b9a25b-cc14-47f1-8600-991149273542	t	Nyamirambo	5dab8bf9-62a0-4133-9c8f-2be8f188b4e2
b1b7241e-57ef-486a-b411-5193cb1de75f	t	Nyamizi	5dab8bf9-62a0-4133-9c8f-2be8f188b4e2
2feb6ba0-ee7d-4bce-a269-54f5f1640b3f	t	Rusasa	5dab8bf9-62a0-4133-9c8f-2be8f188b4e2
8582bebb-9c33-4fab-aee4-9ae0708b2239	t	Kagarama	8967fb79-7c99-4203-8491-82a59dc14e98
faa504ea-9c31-44e9-a8da-4d7a56e9b30a	t	Kamabuye	8967fb79-7c99-4203-8491-82a59dc14e98
bd06e434-0985-474d-8194-5aa6bafa32e3	t	Muhero	8967fb79-7c99-4203-8491-82a59dc14e98
d9c7ef20-2bc3-4c68-93b0-c2fca29d8c17	t	Munyiginya	8967fb79-7c99-4203-8491-82a59dc14e98
61414624-6b65-4c7a-9243-7c5dc144723c	t	Muyenzi	8967fb79-7c99-4203-8491-82a59dc14e98
9549ffee-b2f6-4220-97fa-95be4d0ff70c	t	Nkombe	8967fb79-7c99-4203-8491-82a59dc14e98
d75810b0-0860-49d1-a92b-cd6b097c4272	t	Rukoma	8967fb79-7c99-4203-8491-82a59dc14e98
aa41f633-5ce8-443f-8342-8e0ee2142401	t	Kigohe	bdfa38a5-fc87-46b5-893e-52dbb49621a2
4423c10c-3757-4db4-ae8a-c71584d1af58	t	Mweya	bdfa38a5-fc87-46b5-893e-52dbb49621a2
c68df647-b703-4d78-a9a4-c0ab8c1dd43d	t	Cyahafi	6c31c140-84a1-48b9-9725-6202d0eb5e23
07233520-0365-47d3-8027-3fc4d2e651b4	t	Gihimbi	6c31c140-84a1-48b9-9725-6202d0eb5e23
6ddad07c-0953-4b33-8467-31ba861be847	t	Kabuye	6c31c140-84a1-48b9-9725-6202d0eb5e23
4f46126a-63cd-4a1c-ae20-84fd92829616	t	Mirehe	dbd07124-1352-4a55-b061-5e61cc4e5eef
ee703134-a13f-4857-bc9d-bd5d0599c715	t	Busenyeye	3f155d28-d811-43f0-8b46-bad9ab3ac670
2bdbb8c3-45b8-46fb-b2ff-b90ad57920a7	t	Bweru	3f155d28-d811-43f0-8b46-bad9ab3ac670
9536414b-5416-4281-a7bc-bc2f929838a7	t	Jarama	3f155d28-d811-43f0-8b46-bad9ab3ac670
c7abcc81-93fb-44ac-b168-5f30613f7504	t	Mpaza	3f155d28-d811-43f0-8b46-bad9ab3ac670
205bee9a-d6c1-41cb-855c-c2ed8188df71	t	Murende	3f155d28-d811-43f0-8b46-bad9ab3ac670
1e24e5eb-fdad-423e-8011-cb741749b7cd	t	Kami	5c3c9d8f-7de9-41ff-9622-1c14accecbaa
5864852a-cda6-432b-918c-cc324067c704	t	Kigarama	5c3c9d8f-7de9-41ff-9622-1c14accecbaa
a0daa8b2-d66d-41b1-8f1c-0cfd679773d8	t	Musongati	5c3c9d8f-7de9-41ff-9622-1c14accecbaa
434daf61-eac7-4b61-b258-ec79bf7f9802	t	Nyamagana	5c3c9d8f-7de9-41ff-9622-1c14accecbaa
32bd1074-03a0-4be0-b52f-69d14f45187b	t	Nyaruvumu	5c3c9d8f-7de9-41ff-9622-1c14accecbaa
517eddff-14c6-4a56-acca-ff1042b747a8	t	Bisambu	1947bf20-8539-484b-b82a-40a59c3fc481
65d6b486-4d54-42e0-9039-83c7aae175d1	t	Gisake	1947bf20-8539-484b-b82a-40a59c3fc481
47d0fc2a-8759-44b9-95ff-435d32d3b036	t	Nyamiyaga	1947bf20-8539-484b-b82a-40a59c3fc481
984c7c1a-49c2-4050-9fae-8ce32230942f	t	Rwamushumb	8298d498-66e4-4b8f-a43b-e7d8f64549d2
55117e28-06fe-432e-b829-a51f1d82aeac	t	Karwiru	a4130359-8f45-4c93-bbff-f32877a9655c
825c55ea-0cc4-45a8-8f8c-a4e90523d814	t	Nyamiseke	a4130359-8f45-4c93-bbff-f32877a9655c
e3f12217-51f2-45a8-a983-fd6be4067140	t	Kirwa	5e8d7cd9-c5fb-4e3b-9b9c-1ac8bfa6dc9b
ae075c2f-73fc-4394-b9d5-a5946f22be37	t	Nyamuvumu B	5e8d7cd9-c5fb-4e3b-9b9c-1ac8bfa6dc9b
3e4a5d7b-2b94-4c7b-9941-bb110ed86871	t	Cyarwa	81c41bc3-d9a7-4312-b614-dd2403c5307c
328c2d36-7fd0-4f76-88e6-ac3dcf2c6c07	t	Kamushi	81c41bc3-d9a7-4312-b614-dd2403c5307c
7e28792c-d479-4152-b45a-8cc4b1bf21ce	t	Kamuvunyi A	81c41bc3-d9a7-4312-b614-dd2403c5307c
170b48a8-e4e3-4072-9385-8dd9f7a6acc7	t	Kavumu A	81c41bc3-d9a7-4312-b614-dd2403c5307c
cb3c49aa-a60f-4c74-a1fa-2be9c7698826	t	Bukinanyana	64e4e5ca-9201-4ad0-b4c6-5a1c84ea8aa7
29b0d18a-aa2a-44b2-a992-34d3cecd9b0e	t	Gisenyi	64e4e5ca-9201-4ad0-b4c6-5a1c84ea8aa7
90b94bb2-4bd2-4242-bdb8-5d5f713806f1	t	Gitwe	64e4e5ca-9201-4ad0-b4c6-5a1c84ea8aa7
39517f75-bc2b-4115-ba94-0521cb7026b2	t	Kinyinya	64e4e5ca-9201-4ad0-b4c6-5a1c84ea8aa7
539533fd-db2f-4dcf-acbf-d52f90362147	t	Masiga	64e4e5ca-9201-4ad0-b4c6-5a1c84ea8aa7
23dd71fd-3ca7-47d8-971a-ed1901c2e818	t	Bitare	51f64ce4-2a1a-4324-b0b9-6df216f8ce86
fd59e87d-4b4a-499b-82f1-251ddf016be1	t	Mutarama	51f64ce4-2a1a-4324-b0b9-6df216f8ce86
2441a85a-b5a8-41b3-a37a-b890b221a9eb	t	Mutobo	51f64ce4-2a1a-4324-b0b9-6df216f8ce86
9a45945c-a968-444f-a6c5-3dac7cc80ca0	t	Nkanda	51f64ce4-2a1a-4324-b0b9-6df216f8ce86
47637d44-1f0a-4a13-8cec-95f1301f3ad3	t	Uwamakumba	51f64ce4-2a1a-4324-b0b9-6df216f8ce86
a9bfd7ca-dd49-4664-9f83-5e824d221b55	t	Kabavomo	d059ae2e-a378-458e-84cc-4296a7410a02
8c93fe49-a97b-4fed-9c73-b2492c71efbc	t	Ndatemwa	d059ae2e-a378-458e-84cc-4296a7410a02
41d3e3a6-7797-4898-9e07-f0a7946dd7ff	t	Nteko	d059ae2e-a378-458e-84cc-4296a7410a02
162d6194-8e07-470a-bc76-fe352af546e9	t	Musebeya	8636e6a3-fd61-4e5e-b698-eeb8cbfb27f6
1aee05ff-bc4e-46d0-89f6-fda6a073584b	t	Rango	8636e6a3-fd61-4e5e-b698-eeb8cbfb27f6
4ca4df5f-24bb-4ef5-92bc-c88b13812da2	t	Ryabusagara	8636e6a3-fd61-4e5e-b698-eeb8cbfb27f6
a41af1f4-21eb-41fe-a24d-717a7e4b1bac	t	Shwima	8636e6a3-fd61-4e5e-b698-eeb8cbfb27f6
fce48aa1-3426-4ecd-9c3b-3d325beb5503	t	Bukinga	156cf424-535b-4d4c-8674-870e08351e5a
f148d4b5-1b04-45e3-9e96-f8686cd0bf35	t	Rutabo	156cf424-535b-4d4c-8674-870e08351e5a
ae59e649-d5e5-45d9-bd1d-6f6d16d7c462	t	Coko	3f329bae-f336-4508-bdff-90f52273133e
611bfea3-f4f5-4c82-ad56-6f8062fc246d	t	Gitara	3f329bae-f336-4508-bdff-90f52273133e
909330ca-d47f-4cf8-b2d9-4ceebc7b70da	t	Ruko	3f329bae-f336-4508-bdff-90f52273133e
f282ab06-a086-4307-be7e-e5471d767d6e	t	Cyahinda	74433fe7-ab3b-4b57-846e-9f8d9c1b3b31
643d463b-8043-474c-addc-b5485b7a4102	t	Cyanwa	74433fe7-ab3b-4b57-846e-9f8d9c1b3b31
d9a82171-3434-4167-a72b-3e3fa959f0db	t	Kinyaga	74433fe7-ab3b-4b57-846e-9f8d9c1b3b31
73bbfa02-efdc-4018-8c78-7b1ba5cb56d6	t	Saburunduru	74433fe7-ab3b-4b57-846e-9f8d9c1b3b31
956fe3e7-72c3-4a00-bed1-80ebe9018227	t	Rutega	74433fe7-ab3b-4b57-846e-9f8d9c1b3b31
628da787-4df9-4542-b820-68318159b5ba	t	Gasasa	ba105993-671b-4194-abfa-4b786de4f96f
16cdc5f4-3254-4d0d-a2fb-8923558b2f6d	t	Kavumu	ba105993-671b-4194-abfa-4b786de4f96f
46006af2-021c-42b3-8f6d-bc3fb64505ab	t	Ryamarembo	ba105993-671b-4194-abfa-4b786de4f96f
17c7cdf0-a4b0-429f-848d-47501a957cef	t	Busanza	57905c22-7229-45d1-9624-c9a1441165e9
b4ba0470-5273-42a0-ba93-a64ad4d06e7f	t	Byanone	57905c22-7229-45d1-9624-c9a1441165e9
9795ebfb-aa14-4ab2-a7fd-7442f0cd3916	t	Gasharu	57905c22-7229-45d1-9624-c9a1441165e9
3ceb2480-eb97-4673-84ad-8688974feb22	t	Kubitiro	57905c22-7229-45d1-9624-c9a1441165e9
7912a516-5e87-4a27-901f-83742bc43161	t	Nyagatovu	57905c22-7229-45d1-9624-c9a1441165e9
8af55f93-9bba-4105-aa05-2662a5faad37	t	Rebero	57905c22-7229-45d1-9624-c9a1441165e9
0c5cc840-b749-492c-9fc5-226814697951	t	Kanyinya	785e2b16-5976-4b5f-8e46-ec4048ecd326
fd120741-1bf1-46b4-a281-2634b7478093	t	Kibumba	785e2b16-5976-4b5f-8e46-ec4048ecd326
78b0e3e9-778b-472f-a964-4bf3c50c49b3	t	Rubona	785e2b16-5976-4b5f-8e46-ec4048ecd326
602f54fe-d13f-434b-80c2-4734d45b394a	t	Rugarama	785e2b16-5976-4b5f-8e46-ec4048ecd326
4a8b92a8-d52e-4cd6-ad71-f706798cc21e	t	Rutobwe	785e2b16-5976-4b5f-8e46-ec4048ecd326
d1535e98-7fae-4a37-bac5-3bf413983e30	t	Viro	1d0dba59-3af1-49bd-ba40-d980f6cd56d1
7b0ac028-404b-4e12-9aa1-7851b9032f0a	t	Agateko	7acfe8bb-8d35-4748-9280-f0f8877ddeb3
4b632218-5c03-48c5-935b-ec0239d80ee8	t	Akajonge	7acfe8bb-8d35-4748-9280-f0f8877ddeb3
b1b0ee7a-a7b3-4610-b7db-91167ea323a6	t	Sinayi	7acfe8bb-8d35-4748-9280-f0f8877ddeb3
b783e332-b83f-42af-8f7c-8a7829c6a285	t	Rwimbogo	ebf88fb6-3833-4685-86cf-16cba05ce905
d10cb6b6-10e7-4346-82fb-57144343294b	t	Banga	f71c732f-f1cb-4fab-9f62-528ce2dd1d90
ebe5e58d-0727-4147-aa6e-24952b19cc4e	t	Kibayi	f71c732f-f1cb-4fab-9f62-528ce2dd1d90
e7ee1ede-b557-489e-bba5-b30a823dfed3	t	Mpanda	f71c732f-f1cb-4fab-9f62-528ce2dd1d90
ace05678-de24-4686-84dd-5da05d344c83	t	Munege	f71c732f-f1cb-4fab-9f62-528ce2dd1d90
dc93a88b-aabc-47ed-a986-33a90e05ac74	t	Mubuga	e1569cde-7636-4726-b1b9-e6b7de475558
92eb70bc-0d35-4e2e-9e83-b512b93b4a49	t	Nyarusovu	e1569cde-7636-4726-b1b9-e6b7de475558
6cc55eda-b0bb-4070-88a6-5cb46d2fc1f7	t	Nyarwumba	e1569cde-7636-4726-b1b9-e6b7de475558
50cff41e-61f8-40e1-8453-55a163d9d1e6	t	Uwintobo	e1569cde-7636-4726-b1b9-e6b7de475558
e968f394-45dd-4e12-9ba6-2cb75c786319	t	Agateko	f66e4ef5-ce39-479a-89e4-0b9701689135
deccbd3b-6e2d-420f-96d8-96068b5df6df	t	Businde	4423552d-ac53-4003-a4d8-4dacd3d8d4f0
97aca0f3-40a5-4a12-9501-2e4196b12ea6	t	Cyanyirankor	4423552d-ac53-4003-a4d8-4dacd3d8d4f0
e9dc6062-0bc5-42c3-8911-a9dbdd682531	t	Ruganza	4423552d-ac53-4003-a4d8-4dacd3d8d4f0
6ab1bc1c-5bb9-4b6c-bc46-123b52a46fb2	t	Gasezo	71074210-f605-4287-a90e-64df124573ae
3c80ef90-02d3-4f1e-bfb9-c558b3b09483	t	Uwamizirikan	71074210-f605-4287-a90e-64df124573ae
31b93c44-7a62-446b-a707-3308a0262a56	t	Kabeza	c10670af-5f33-4527-a85b-45d7ace59d53
54467a13-1aaa-4dac-b1df-6e2d2ea24bf9	t	Kabingo	c10670af-5f33-4527-a85b-45d7ace59d53
7d1fa57a-0e51-488d-8b78-538f795b15c3	t	Uwisaga	c10670af-5f33-4527-a85b-45d7ace59d53
7e14407b-8bb9-4d70-8a95-4b449fb36207	t	Kivu	7cf42d19-3b4b-4e1c-96e6-ffd8457cdc1d
917ace88-ee54-46ab-ab4e-7db8538722ef	t	Murambi	7cf42d19-3b4b-4e1c-96e6-ffd8457cdc1d
8d8b23ec-bed3-4bed-9bc2-d2c6525bf15b	t	Rubumburi	7cf42d19-3b4b-4e1c-96e6-ffd8457cdc1d
fec7dd42-bfcf-4e94-9059-3081217535b3	t	Rusuzumiro	7cf42d19-3b4b-4e1c-96e6-ffd8457cdc1d
2e4edf94-2bc9-4348-97ec-990a75ca1831	t	Kivumu	ac4edaff-9096-488d-bc86-8bb62ac400b9
7b9e69f4-17d5-423d-b350-89be732d282e	t	Nyarwotsi	ac4edaff-9096-488d-bc86-8bb62ac400b9
683045d8-2faf-4b82-9ba1-e65f0c94a342	t	Rugerero	ac4edaff-9096-488d-bc86-8bb62ac400b9
77eb2c92-2caf-4f8b-90dc-8b0a22f272f7	t	Mataba	1a341132-198b-43bc-a69e-f83200886ffb
85b7b09e-6b61-453a-8f19-5e6010e7d429	t	Ruhunga	1a341132-198b-43bc-a69e-f83200886ffb
8a2048c3-da3c-4c2c-b6f4-e404d3abe032	t	Mata	c0fea4ac-df30-4071-9bde-2c293eff3991
67fc96c2-2dc7-4ee8-b079-a2cf967486b7	t	Murambi	c0fea4ac-df30-4071-9bde-2c293eff3991
dd8421fc-047d-4ef5-a260-72430794ff10	t	Nyamyumba	c0fea4ac-df30-4071-9bde-2c293eff3991
564cee16-d2ff-4624-9d82-2d61c700043a	t	Runono	c0fea4ac-df30-4071-9bde-2c293eff3991
eb67de99-f572-4b63-91bf-56bafee56c01	t	Nyacyondo	5cb6d190-6374-42ef-990c-42247ab51a0b
d041c0cd-419d-461b-aecc-9be137f16163	t	Rwinanka	5cb6d190-6374-42ef-990c-42247ab51a0b
bfb76989-51ea-47a5-a60d-dc0eca4dc740	t	Cyafurwe	eb0a6798-d4f2-4dfd-91d1-06e6a6015ccb
74339dad-845a-4e63-958b-747334aad5c5	t	Gasasa	eb0a6798-d4f2-4dfd-91d1-06e6a6015ccb
3b9d90d2-69c1-415d-b5df-81b2d839b443	t	Ramba	eb0a6798-d4f2-4dfd-91d1-06e6a6015ccb
7be547cf-5794-43cc-917d-1aaced6b21cf	t	Taba	abca4f2f-3971-4fd0-9c09-744b0e7d7cfe
a6af7576-5b5c-4e4e-978a-e446a5d7770e	t	Mubazi	2b592fe8-1db0-424f-b8be-ed709648191b
5839b9ca-ebb8-45e5-9f32-144febcfa0d3	t	Muganza	2b592fe8-1db0-424f-b8be-ed709648191b
bb5649e0-74fe-41f3-8554-d43aaf6b4f59	t	Ngara	2b592fe8-1db0-424f-b8be-ed709648191b
b894dd9c-dc1c-43c3-b99c-6f18c82af68e	t	Nyabirondo	2b592fe8-1db0-424f-b8be-ed709648191b
72d7af30-bef5-4aac-ae44-0cb90368ad7f	t	Rambyanyana	2b592fe8-1db0-424f-b8be-ed709648191b
ebf263d8-4a08-47e6-888c-938ff46ea163	t	Nyagisenyi	84a16805-19b7-4e7e-a269-a411bace5db0
e2f61df4-ff01-4830-885e-15e801fdfc44	t	Remera	84a16805-19b7-4e7e-a269-a411bace5db0
21b97bb5-7d9c-4726-abaf-d490c6fa3386	t	Rwishywa	84a16805-19b7-4e7e-a269-a411bace5db0
f9656fd6-6ef8-4084-ba0c-81ddf7d666bb	t	Bigugu	d1205896-87c3-4724-8a04-579e87155dfc
1cfcacee-8607-4554-a389-f029a1f94b43	t	Cyurukore	d1205896-87c3-4724-8a04-579e87155dfc
d63b608d-ccb1-47e8-82e7-87d44e3af31f	t	Gituntu	d1205896-87c3-4724-8a04-579e87155dfc
a35893b2-b9aa-485a-9c6b-bfbc2e921a6e	t	Kigwene	d1205896-87c3-4724-8a04-579e87155dfc
42a85ffc-1d63-4cb8-ac36-5babd0236a72	t	Tangabo	d1205896-87c3-4724-8a04-579e87155dfc
ba745127-4a5e-4e01-923d-fe03ae384263	t	Migendo	7dae4a00-504b-468e-9d7e-313668730d5e
4fd9a45e-1b90-44f8-b530-b2d905ea87bc	t	Mukongoro	7dae4a00-504b-468e-9d7e-313668730d5e
1a3872f9-72d7-49c3-b42f-db013cee8ddb	t	Sekera	7dae4a00-504b-468e-9d7e-313668730d5e
0b1d56c7-f0e2-4c18-b2a8-1c64c5bf7ec5	t	Agatare	1d3207e5-9dca-4703-a8be-b792a159ff21
c53339f4-5e39-47e5-83f3-f28c0ff51e82	t	Gisizi	1d3207e5-9dca-4703-a8be-b792a159ff21
b5be54d9-1093-4bfb-b584-7678603a110d	t	Gitega	1d3207e5-9dca-4703-a8be-b792a159ff21
cafaa424-890b-4eeb-858a-00e0719a0de9	t	Uwumuko	1d3207e5-9dca-4703-a8be-b792a159ff21
de5f4735-ccfb-4e79-8742-a3fbc6fe9959	t	Akagera	30fdb8db-785a-4e5e-a8e5-ed9f7b156ce2
40c6f2e0-9cae-4851-8567-39d1e753d255	t	Mushwati	30fdb8db-785a-4e5e-a8e5-ed9f7b156ce2
5be360ca-5a8f-45c1-aa87-ba77357f0ea4	t	Rubona	30fdb8db-785a-4e5e-a8e5-ed9f7b156ce2
8f1e8083-c326-4da3-a061-433200a78366	t	Ruseke	30fdb8db-785a-4e5e-a8e5-ed9f7b156ce2
b94d5e23-dea5-4309-84eb-27932c7c3f3a	t	Kabirizi	2f8015f5-0783-431c-bed3-203a3ce6df5e
87b0ea18-c52d-460a-bfbf-ff64d648247c	t	Umurambi	2f8015f5-0783-431c-bed3-203a3ce6df5e
1f72383b-c1a2-4b82-9f76-4ffa4c7c2a5d	t	Kamana	b7bb4822-5b37-4bfa-a6ac-23f766c70d46
27042e52-1d49-4297-bcd2-ebdf2faa1bf9	t	Kimena	b7bb4822-5b37-4bfa-a6ac-23f766c70d46
a166fda4-bb16-48f7-8ebe-601dd3e9d02d	t	Muhororo	b7bb4822-5b37-4bfa-a6ac-23f766c70d46
d80657e6-b5e9-4618-9907-26ef071036ad	t	Nyarure	b7bb4822-5b37-4bfa-a6ac-23f766c70d46
bcc98052-78bb-4d2f-90e8-bc8dbaa74814	t	Sheke	b7bb4822-5b37-4bfa-a6ac-23f766c70d46
539c728b-74e5-4a9b-aea0-2c8a56c85d94	t	Sheke	8a011873-ef71-4a88-a5fe-0de66dbce74e
eac89b06-b634-41a9-836d-83c0ce032822	t	Cyamutumba	7e4a31be-ba78-49c8-87e3-7065dd73d0a2
67aca967-2206-46aa-afe4-85f1febb1507	t	Mukuge	7e4a31be-ba78-49c8-87e3-7065dd73d0a2
ff83f10d-5d2a-4d85-8b66-7534e944f9bf	t	Nyarugano	7983746d-e82c-4597-97cd-c0ef000c54a3
9d75a224-3cd6-40de-a65a-51288254fdb3	t	Runyami	7983746d-e82c-4597-97cd-c0ef000c54a3
6f1069b6-800e-4b27-ac0e-4d36dbd50e09	t	Mubuga	3c7cb465-4826-4640-a0df-7bdea3d5e314
0814dc50-9165-4aea-bac1-dd9c04d5936a	t	Gisozi	ce159900-3371-4cca-a182-96ec984b7d6c
c8e315fa-b452-4921-b8e2-25cfcb623eb4	t	Kibingo	ce159900-3371-4cca-a182-96ec984b7d6c
29f5756c-d755-4c96-b281-4e8da139cdc5	t	Nyanza	ce159900-3371-4cca-a182-96ec984b7d6c
24fe9eff-9f0b-4a7a-8b85-b378d73a3d6c	t	Buhunga	c5c81c8b-4d89-496c-933e-3ac37afaa13c
2f263a17-6fe4-444b-90d0-2b6fbe23ffc6	t	Yaramba	c5c81c8b-4d89-496c-933e-3ac37afaa13c
b6161b47-6159-4609-8216-ab42e599afc9	t	Gasha	941b9927-b2f0-4814-b110-7884d6edec8a
5a44da2a-7a53-4387-919a-6215c6610cfa	t	Nteko	941b9927-b2f0-4814-b110-7884d6edec8a
7044c5ad-ad0b-4726-8c52-1b04e75da820	t	Ruli	941b9927-b2f0-4814-b110-7884d6edec8a
7d792ea1-2b8f-4720-b73d-21c5702b33e9	t	Akagano	07384228-a20e-4480-8032-f2ee44c78b3b
13770a3b-3ca6-4d1e-9a85-7c91d05197f9	t	Maraba	07384228-a20e-4480-8032-f2ee44c78b3b
016d2f42-9df9-4aef-b078-30d1cc2f6ae0	t	Munini	07384228-a20e-4480-8032-f2ee44c78b3b
1aa8dea2-5203-4a0e-9ef3-75a6deffdceb	t	Mwumba	07384228-a20e-4480-8032-f2ee44c78b3b
c0139b1a-cedf-4d9b-a03b-4d25c98a3910	t	Ururambo	457580bb-baf6-493c-881a-0a6700d228cc
7eee6da4-7126-4af6-8487-6c0fcc5dc46e	t	Akabuye	2a40439f-64e0-4c22-a143-ab2e9bd297fe
24b06d41-ca10-432b-ad5c-0f7392597bd3	t	Bihembe	2a40439f-64e0-4c22-a143-ab2e9bd297fe
6142da56-9bcb-4371-b7ed-f4f7852e2a0b	t	Nyagasozi	2a40439f-64e0-4c22-a143-ab2e9bd297fe
6fac9be2-9da3-4d5d-82b0-3a9829336acd	t	Rushubi	2a40439f-64e0-4c22-a143-ab2e9bd297fe
11ec7665-cc05-44f6-9a92-334c0f35b9ff	t	Bihembe	61897e48-d0c6-44cb-ac14-5acbdb264d1b
59fe98ce-937d-496c-80e6-3728f2ebd2d4	t	Rugarama	61897e48-d0c6-44cb-ac14-5acbdb264d1b
f453b6fc-c78f-48cc-b2d0-70a96da891da	t	Uwurusugi	ced5a1a8-b779-4408-9cbc-16bee1064578
7c411908-02e3-40c2-8a90-16bdbd5a3fde	t	Mishungero	a129543f-9c32-4018-a896-97740965b4e3
f0c86c6d-c996-44cf-9d75-c2dfcbadd1db	t	Ngarama	a129543f-9c32-4018-a896-97740965b4e3
9c4433df-d6e2-4cd9-a1ad-73d033915f0e	t	Rubindi	a129543f-9c32-4018-a896-97740965b4e3
d268bb6e-849a-46a9-b332-137b653a3375	t	Murambi	f4dbffac-433a-4ba9-be89-18446bdb03ad
8d9068af-7fa2-4281-aedf-9e7aa2c6f23f	t	Mutobwe	f4dbffac-433a-4ba9-be89-18446bdb03ad
065a36e8-a547-4d54-acc0-2d63b5618007	t	Nyabimata	f4dbffac-433a-4ba9-be89-18446bdb03ad
2fd00fe3-16dc-4e65-b72a-0b64c11a5afd	t	Agasugi	648bbae6-3974-4343-92bf-1573d392cfa2
0dfe02b1-d07b-4042-a6d5-8f6bb7bd23d1	t	Ndaro	648bbae6-3974-4343-92bf-1573d392cfa2
24d16f30-c4ae-47e4-a998-1f6c7f47f65b	t	Ruhinga	648bbae6-3974-4343-92bf-1573d392cfa2
126cb3db-5e71-4769-adaf-b66936bf988f	t	Maraba	43961efe-7e65-428f-b916-1bb567fb4b00
685d7cd1-806f-4512-adfe-ee66caedd34a	t	Nkima	43961efe-7e65-428f-b916-1bb567fb4b00
51b574f3-5c32-4bc1-b273-cee48ecf9860	t	Rushunguriro	43961efe-7e65-428f-b916-1bb567fb4b00
e8890567-9d34-4577-8726-d79dfc925bb8	t	Bwerankori	0dff49ab-1673-48dd-aa7f-977616930fd6
b30b81d6-a290-40aa-a192-8be534a850c8	t	Bihembe	a7ae86ad-cd21-4c88-a5a8-5ed2650dd409
fdeb6ba0-1d47-45ad-ac29-71e76baf33b5	t	Nkakwa	a7ae86ad-cd21-4c88-a5a8-5ed2650dd409
9fc83a5b-25df-47f4-bac9-87179e1123fc	t	Rarire	a7ae86ad-cd21-4c88-a5a8-5ed2650dd409
f38cf87c-9efc-4079-b1ad-4ee976a8b1ea	t	Rubuga	a7ae86ad-cd21-4c88-a5a8-5ed2650dd409
d048545e-d4f4-40cd-8e5b-43434f5a67b3	t	Muriza	637d9a00-6146-48ea-a8e6-c33dce05d4c9
aa1bea97-e9b3-4b0c-b206-83d690111e41	t	Nyagishayo	637d9a00-6146-48ea-a8e6-c33dce05d4c9
29375cf7-c112-4a15-9411-1c5c85f791b6	t	Nyamiyaga	637d9a00-6146-48ea-a8e6-c33dce05d4c9
e78dc1f4-e602-46e2-87d6-86233ef65a76	t	Ryabidandi	637d9a00-6146-48ea-a8e6-c33dce05d4c9
e71ac0de-ff4d-484e-b3ac-7d3fd5eed731	t	Uwimfizi	637d9a00-6146-48ea-a8e6-c33dce05d4c9
0e761738-32de-421b-8c9c-2d0d40c076c7	t	Nyacyonga	5c0831b8-57af-4766-94b1-2e2a4d82c5c5
894dcf0f-ac66-43b2-a519-fa44473ff60f	t	Busenyi	99e319ea-81d8-4b52-8b0a-f0a82228276c
b73bbdb8-b5b7-4819-8776-0016bc242772	t	Gambiriro	99e319ea-81d8-4b52-8b0a-f0a82228276c
fbdee0ee-efde-456d-bd39-d019b68a4140	t	Cyivugiza	5723fd1e-d8c7-4fdf-9f7b-2e6a651eeb34
79f9ae27-df3c-409c-9db9-6196cadce881	t	Gitwa	5723fd1e-d8c7-4fdf-9f7b-2e6a651eeb34
9868439a-88e2-49ef-a6e4-04ddbca8bb09	t	Mutumba	5723fd1e-d8c7-4fdf-9f7b-2e6a651eeb34
5019eb31-8594-45f5-a32f-595241e8ba9c	t	Uwinyana	5723fd1e-d8c7-4fdf-9f7b-2e6a651eeb34
a53b7cb7-a87e-4b7b-89f5-27fce4cafeab	t	Ruyenzi	dd1806af-d0aa-429d-822c-daf1734f0faf
72da6a17-c8b5-4ae6-a1d0-bbad451f4572	t	Zirambi	dd1806af-d0aa-429d-822c-daf1734f0faf
e9d87450-80b2-4cd3-8014-36a41bdd4e09	t	Gakaranka	9d43f82e-347e-4c8d-8dbc-acae194ef289
6acd6abb-7b5a-46bd-b03b-a20da94c412e	t	Mubuga	9d43f82e-347e-4c8d-8dbc-acae194ef289
f33c4709-8489-4853-87ea-1b02e43305c0	t	Rugote	9d43f82e-347e-4c8d-8dbc-acae194ef289
a114b369-e232-44fc-9b21-d26774c8e4fa	t	Uwimbogo	9d43f82e-347e-4c8d-8dbc-acae194ef289
e4acd56d-2a50-408d-ac52-de694d4414d2	t	Yanza	9d43f82e-347e-4c8d-8dbc-acae194ef289
84aaabec-4610-40bf-89a2-bbb136f1e906	t	Bukoro	5a6d40ac-5c09-4bc3-924b-63ec56c6beff
ee158d36-0888-4adc-a98f-3755d877f919	t	Kageyo	5a6d40ac-5c09-4bc3-924b-63ec56c6beff
c4489675-3fd6-4db8-987c-3ef56d40cea8	t	Giseke	ecd76e47-cce8-4afb-a3db-c3f03853fa2a
429f1644-6411-452c-a4c4-04da33640202	t	Kabari	ecd76e47-cce8-4afb-a3db-c3f03853fa2a
30afcac2-0329-430a-a600-3a1ae653ed83	t	Matyazo	ecd76e47-cce8-4afb-a3db-c3f03853fa2a
00df09cf-ac37-4a02-a00b-c2bad9c5816d	t	Gisorora	e9ecf79f-3890-4f52-9b4a-9766d3a6450f
c24faeed-0569-4538-9262-0da3cfdad5de	t	Kinyonyo	e9ecf79f-3890-4f52-9b4a-9766d3a6450f
bad03fbf-1cee-45b7-9866-b58816a56141	t	Uruyange	e9ecf79f-3890-4f52-9b4a-9766d3a6450f
e8185151-7288-448a-8b40-97a29786c2c3	t	Bugizi	2d4b2829-a411-4c5a-9be8-e5dcd1c7cdee
e8efae92-3f03-4eef-93c9-2c8843cc2bef	t	Busasamana	2d4b2829-a411-4c5a-9be8-e5dcd1c7cdee
92d87142-7b55-4214-9f50-8e599f27cb27	t	Karambi	2d4b2829-a411-4c5a-9be8-e5dcd1c7cdee
240796dc-eacb-4edf-9d59-e16bf6afc012	t	Ruramba	2d4b2829-a411-4c5a-9be8-e5dcd1c7cdee
5cb7b367-d66a-4199-94c6-2df67c6eca70	t	Jali	3354e3f3-d887-48d1-919a-dac8bf003678
d0848634-1ee6-49cb-9140-82f1bedd3502	t	Toraniro	3354e3f3-d887-48d1-919a-dac8bf003678
aac8ae2b-471d-43ff-9d26-13cbbfe90cf9	t	Cyuna	ea2dad06-6efd-43a4-83fd-a8e4b3c79371
c419cbf0-ffda-4a90-8b7c-a896c7fb91d4	t	Kiramutse	ea2dad06-6efd-43a4-83fd-a8e4b3c79371
90f9a586-0b7a-4647-b8c7-373f173ce220	t	Remera	ea2dad06-6efd-43a4-83fd-a8e4b3c79371
b33a5e92-746c-4c42-9b1d-82a0dada20f5	t	Uwamuhizi	ea2dad06-6efd-43a4-83fd-a8e4b3c79371
4ff1918e-42c1-4711-a30a-ab1df24bceff	t	Kibu	3447688c-fcb8-403c-ab06-88dcfd8aa3cf
c873a1b5-71c4-496c-837c-e028b4924d07	t	Rwabujagi	3447688c-fcb8-403c-ab06-88dcfd8aa3cf
cc37e709-3156-410a-92c0-55e7594c43ef	t	Gihango	5c3d6d38-0a89-4d75-846d-6dc14ba3fb20
a77e7240-159a-45a4-9d3e-da2cdcef682e	t	Kabuye	5c3d6d38-0a89-4d75-846d-6dc14ba3fb20
51ac1100-e326-4026-8e94-21310c135c3a	t	Miko	5c3d6d38-0a89-4d75-846d-6dc14ba3fb20
fe8a01f8-36c2-4fe7-9b7f-e619e06f165a	t	Rasaniro	5c3d6d38-0a89-4d75-846d-6dc14ba3fb20
7970c83e-1a29-4462-97c0-2508ce11d1a1	t	Gasave	c8cd6aaf-a26c-435a-b017-8eefcba8e58c
397deae7-a98e-4212-8be8-97343b019d43	t	Karimba	c8cd6aaf-a26c-435a-b017-8eefcba8e58c
8dbf4f3f-58b3-4fc1-b04a-c677f8552b25	t	Ntanda	c8cd6aaf-a26c-435a-b017-8eefcba8e58c
f7fcf7f0-7d15-4400-89a6-62c8c97f9ea7	t	Kabacuzi	ea9258c0-bbc3-4444-995b-4077d23443eb
ee4cc0c8-2c84-4d5e-9f31-24fdf9823256	t	Kamusindi	ea9258c0-bbc3-4444-995b-4077d23443eb
940183fe-344c-4aad-b08d-b04bd983f591	t	Kavumu	ea9258c0-bbc3-4444-995b-4077d23443eb
4228649f-24c2-4e24-bc7f-caeb6344cf47	t	Runyinya	ea9258c0-bbc3-4444-995b-4077d23443eb
4d104299-6712-49f1-a2d9-7db702bd4d12	t	Gakongoro	3450ba10-bcab-4cea-90d5-9734d5d78b8b
2f758478-a5aa-450c-abac-221db4531677	t	Kabugusu	e6b63227-3ba5-4994-8953-c82e5cd8b8fc
2f3e997b-7f25-45de-ae9b-07587612d358	t	Nyamaraba	e6b63227-3ba5-4994-8953-c82e5cd8b8fc
f97e4d59-89d7-430f-bb07-780168e7b3de	t	Gasharu	254dac9d-e8ee-4b23-abe3-9ab6b8cb8b66
57c03b4a-c11b-430c-b143-d87ab77a0e2f	t	Karambo	254dac9d-e8ee-4b23-abe3-9ab6b8cb8b66
5b1263a9-06d1-4078-b58f-765b745826e7	t	Karutsindo	254dac9d-e8ee-4b23-abe3-9ab6b8cb8b66
712ceab2-4e82-4c70-bdee-4ae04bb0b679	t	Rusororo	254dac9d-e8ee-4b23-abe3-9ab6b8cb8b66
c4f3a6f3-d524-48cb-9c52-e886fa1e1ee0	t	Birambo	3df71cb0-c0b5-4f7f-b3b4-216630878870
74d75f6c-927e-4dcc-936e-142f1a7af249	t	Masambu	3df71cb0-c0b5-4f7f-b3b4-216630878870
eaf3db8c-82ec-422f-b903-eef8b15bda97	t	Nyagasozi	3df71cb0-c0b5-4f7f-b3b4-216630878870
8803fcd9-c163-48e1-91eb-b8086bcc6e9e	t	Nyarubuye	65c21e8a-79ed-4d01-9cd6-7a164a06f726
bc823b40-de66-4724-a933-f026420ae18a	t	Rugogwe	65c21e8a-79ed-4d01-9cd6-7a164a06f726
7b42dab4-e9f5-4d5c-a154-7076e46c29bd	t	Gakomeye	fe1b2f00-9841-4d35-9c05-514d9c4926ae
a917338e-3ea2-4013-bc09-fb955e592b95	t	Gakurazo	fe1b2f00-9841-4d35-9c05-514d9c4926ae
6c39062a-adfe-48d6-9186-8bc2c084a518	t	Gitanga	fe1b2f00-9841-4d35-9c05-514d9c4926ae
4f138708-83b5-410e-96f7-559d8238d9e5	t	Gatoki	3536aa92-67c5-4618-bb51-ea33d3c105a2
1ba8262e-b69a-4597-9cc5-e2a7561797ab	t	Kirengeri	3536aa92-67c5-4618-bb51-ea33d3c105a2
9adb72fb-c5a8-4458-9203-b583d8a971a8	t	Nyabizenga	3536aa92-67c5-4618-bb51-ea33d3c105a2
b2c27763-7f8b-4476-b060-2af894a5dc01	t	Kavumu	ca8d75d3-15b2-459b-9db6-3e2cbcf72b6a
5a5673f6-ee82-4689-ae62-c844697b2fbf	t	Muhororo	ca8d75d3-15b2-459b-9db6-3e2cbcf72b6a
03faee33-a05a-42d1-ac17-66fbe7ff5521	t	Mutobo	ca8d75d3-15b2-459b-9db6-3e2cbcf72b6a
4b8ff8f6-ae36-4276-bf25-6ede517382cf	t	Gitega	65b69639-6853-4dea-934a-c9ab58358924
c1105604-01b2-43ea-99c1-d7b1026e71ee	t	Kanyarira	65b69639-6853-4dea-934a-c9ab58358924
8c731c4b-94fa-4ee0-a69b-4c5e2a871d73	t	Bukomero	36f5a214-aa22-498b-99cd-6a0bec74f9e1
56b44f50-201e-42bd-905b-d3f44689b341	t	Karenge	36f5a214-aa22-498b-99cd-6a0bec74f9e1
342dfbbd-3d6c-4c92-a5de-8d874bc88034	t	Remera	36f5a214-aa22-498b-99cd-6a0bec74f9e1
946be4e0-a337-4594-a1f6-425b11964293	t	Bugarura	3c55941e-f64a-4485-b2d5-074b91d9bcd5
763e7ee3-e983-404f-b58f-1177f94db0de	t	Kageyo	3c55941e-f64a-4485-b2d5-074b91d9bcd5
40513097-4b79-4053-8d14-c5583486d173	t	Ntenyo	3c55941e-f64a-4485-b2d5-074b91d9bcd5
3f8a4681-8afe-4832-ac8a-09e5b4b68e99	t	Gasasa	c7223032-2bb9-43a5-b819-73c25144e2ce
696071cb-9c76-40ff-8c2e-ecb76d359c11	t	Kizibaziba	c7223032-2bb9-43a5-b819-73c25144e2ce
6d949bed-1b3c-469c-8f92-0bca208248fc	t	Ndago	c7223032-2bb9-43a5-b819-73c25144e2ce
3bbea198-c3b1-4016-999f-1d7ff458f60c	t	Nyarubumbiro	c7223032-2bb9-43a5-b819-73c25144e2ce
24fc980a-254a-4dae-ade4-183159bdda6a	t	Bihembe	def1fb70-e7e3-45fc-ac83-6d5aa1001294
c37dc61a-2790-4ea1-a9ed-140635605c55	t	Kirwa	def1fb70-e7e3-45fc-ac83-6d5aa1001294
61afd0f2-c2e5-454c-8a9e-30b440fc4220	t	Kashyamba	49fdb73e-7a77-4c2f-83c2-bcb7e567c82c
8e9e41d4-fdf0-47cf-985d-95a80c6d28f2	t	Kagitare	411f85f6-648b-4a14-9a68-b3787d3c3527
87bdf94b-6d34-4c2b-82a0-e84b67bff7ac	t	Munanira	411f85f6-648b-4a14-9a68-b3787d3c3527
093400b8-d0ee-4fdf-8db6-76b5a1638b48	t	Muremera	411f85f6-648b-4a14-9a68-b3787d3c3527
cdf29171-73b8-4227-8721-acc744e37e30	t	Musekera	411f85f6-648b-4a14-9a68-b3787d3c3527
7667103d-a4b9-4142-9507-a16893173d42	t	Muhororo	e1d164b3-286a-40cf-b3c3-974177555af6
4e97f625-8abe-42a9-abda-fd3f053090a3	t	Rwankuba	e1d164b3-286a-40cf-b3c3-974177555af6
3799bc74-1de5-49e4-9b67-3e9d2e6855c2	t	Rwesero	fb611e64-2fe9-4621-866a-be0e6b703ddf
8e0affa3-4007-494e-9b89-8f5a01554201	t	Serugeme	fb611e64-2fe9-4621-866a-be0e6b703ddf
86581de2-c613-4a3b-8549-3b32196dea07	t	Kanyinya	293ec83b-e297-4ccb-8590-c14c7d05b54b
3d9d746f-c43e-4f8c-933f-91235246c97b	t	Kavumu	293ec83b-e297-4ccb-8590-c14c7d05b54b
13e698e8-1c41-41c0-b50d-847b4bd47896	t	Nyarushishi	293ec83b-e297-4ccb-8590-c14c7d05b54b
7f2e1faf-3d34-4635-8713-bddc7387623b	t	Burima	88afe2d0-be2a-4b06-a2f2-90095ada30f7
91b20871-22c9-4b77-9df9-fadccc9e67fc	t	Mirambi	88afe2d0-be2a-4b06-a2f2-90095ada30f7
73c79794-94bd-4009-b4a1-2205aad5f47f	t	Nyamiyaga	88afe2d0-be2a-4b06-a2f2-90095ada30f7
829ba1a6-bd0d-4aa6-b8e9-39d18239ea96	t	Nyaruteja	88afe2d0-be2a-4b06-a2f2-90095ada30f7
30ad3796-285a-45c0-b49d-dc07a6c8a72d	t	Gisari	1ff97262-1784-45d6-8388-9381e3207fd7
d0b6640a-0e49-4309-9c87-a76eea532141	t	Kabeza	1ff97262-1784-45d6-8388-9381e3207fd7
fa417fa0-5a10-4fbf-be92-b805f383bfe7	t	Kaduha	1ff97262-1784-45d6-8388-9381e3207fd7
222da9ae-7cbc-49f7-af14-81fc18fbb54a	t	Kakirenzi	1ff97262-1784-45d6-8388-9381e3207fd7
4a585100-ed59-461c-b674-fa425b53f7ed	t	Kamuraza	1ff97262-1784-45d6-8388-9381e3207fd7
83e81131-3b83-41a0-9fc3-10e3b26ab326	t	Kanaba	1ff97262-1784-45d6-8388-9381e3207fd7
9f8c4627-420c-4cfc-a3c2-6d2411c85577	t	Matara	1ff97262-1784-45d6-8388-9381e3207fd7
141d84e9-db53-4196-bb02-4039205e6213	t	Nyabusunzu	1ff97262-1784-45d6-8388-9381e3207fd7
6c32fa54-e9b5-4536-9879-5820fb2bfdb8	t	Nyiranduga	1ff97262-1784-45d6-8388-9381e3207fd7
e3f2173f-75ca-4fba-a21e-42d0ada1ee50	t	Remera	1ff97262-1784-45d6-8388-9381e3207fd7
55453cdb-dd35-4dc3-99e5-c87edbba2252	t	Impara	fc4bb967-5450-4249-883d-2fe7e04dc2e6
61a423be-e63c-4f44-950e-ea4fab67b13d	t	Kacyiru	fc4bb967-5450-4249-883d-2fe7e04dc2e6
55f1005f-19a5-4451-a12d-ad8bc5dd1fdd	t	Karuhuga	fc4bb967-5450-4249-883d-2fe7e04dc2e6
ff656f3c-96ae-46fa-8840-ba1061443de8	t	Nyabisindu	fc4bb967-5450-4249-883d-2fe7e04dc2e6
6079cc94-25cd-4899-865a-53d1810e82ca	t	Buhanika	ad1d9a2f-8564-4b82-8833-d5ad4da8af27
2c6d9a83-5078-44aa-92ae-37e644cdc5bd	t	Gako	ad1d9a2f-8564-4b82-8833-d5ad4da8af27
5e2f96d5-1bb5-4285-b31a-d097ae51fd72	t	Kigarama	ad1d9a2f-8564-4b82-8833-d5ad4da8af27
5b0083a6-86e8-4166-9570-386217a99fea	t	Rubona	ad1d9a2f-8564-4b82-8833-d5ad4da8af27
d68f9a32-dcc0-416c-bdcc-692ba190e16d	t	Susa	ad1d9a2f-8564-4b82-8833-d5ad4da8af27
36eece52-ba10-4765-bcc5-09e788b30b9b	t	Gitwa	010139f5-85bc-44af-9ba6-12685623382b
523ab5e4-79ab-4429-965b-2c6ba4d91e92	t	Mukoma	010139f5-85bc-44af-9ba6-12685623382b
03896da6-0fd9-4097-9b6e-34bfebcee614	t	Nyarugunga	010139f5-85bc-44af-9ba6-12685623382b
6bb45710-fee2-4a08-a239-53d641575a7c	t	Nyarunazi	010139f5-85bc-44af-9ba6-12685623382b
fdb45bb4-3a9c-46a0-a345-1d98df80c974	t	Rutabo	010139f5-85bc-44af-9ba6-12685623382b
4f8e9a00-6b76-47eb-b19e-8db935e420b9	t	Gahororo	8af010a6-d21e-4884-8638-e41c12b3040a
d47d7b07-b74e-4c57-9ff5-2f1fccc9adbd	t	Gihororo	8af010a6-d21e-4884-8638-e41c12b3040a
bd6113ae-901a-47e8-af5d-8a4ff5cff505	t	Muremure	84ac168e-115c-4fbe-8052-4d256ae2a630
7d86336e-51c2-439f-a0ea-22df1fadb0a9	t	Nyagatovu	84ac168e-115c-4fbe-8052-4d256ae2a630
da2a69f2-f5b4-4215-97ed-023b3f49978f	t	Nyamagana	84ac168e-115c-4fbe-8052-4d256ae2a630
182b833d-024e-4e04-9c5f-0b32c1ec8518	t	Muyange	2e084a79-b682-48cd-9eaa-ced436b9245a
7bcda1a4-5a25-4c23-bb44-2262925a4ca5	t	Wimana	2e084a79-b682-48cd-9eaa-ced436b9245a
6ce1d285-436a-4c41-adb7-46101d643f84	t	Nyarubumbiro	e1164804-a02a-4e46-bd78-9d0ba2495002
4b6510b3-bc7c-4a27-89ca-9618c695793e	t	Nyarutovu	e1164804-a02a-4e46-bd78-9d0ba2495002
ee15d967-8d45-4b52-be5f-f94e2da6e719	t	Kibirizi	3fb30e85-b174-4897-b6ef-837d8cfdd55b
5496e7ae-f6ea-4b0e-8059-004830791968	t	Rusizi	3fb30e85-b174-4897-b6ef-837d8cfdd55b
2bca139d-050c-4ff3-9591-aabe72acbdba	t	Kabacuzi	aa29c432-43f6-4607-936c-22d512ef1d83
d4c201e0-8693-4239-a5f3-936710e4b325	t	Kabirizi	aa29c432-43f6-4607-936c-22d512ef1d83
ffed0b92-32a4-4066-b186-f0ce59eed837	t	Munini	aa29c432-43f6-4607-936c-22d512ef1d83
71555829-916c-4de0-9207-4b959ea36b94	t	Kabungo	13b16e97-a369-469c-af45-1b4eb651e1f4
19d9dea3-b095-44cb-9acb-ceb500682b36	t	Nyamikoni	13b16e97-a369-469c-af45-1b4eb651e1f4
7f7b638d-114b-498b-a2f2-bdc5b655526e	t	Gishari	06fbade9-5091-4add-8564-f9e5163f74bf
29c32301-9016-4c2e-9d3b-96b9793b85b5	t	Karama	06fbade9-5091-4add-8564-f9e5163f74bf
a2079592-637b-43d3-9241-4910a6f91f0e	t	Kavumu	06fbade9-5091-4add-8564-f9e5163f74bf
90d7a14a-bfe7-4133-b098-eb24fe948c99	t	Kabuga	b8b07bb7-582f-4a8b-81e9-4d61634e0305
889798da-e09e-4465-b995-ff8301423016	t	Kinyinya	b8b07bb7-582f-4a8b-81e9-4d61634e0305
0fe1fad8-a707-47ec-b676-7c55633f0af6	t	Musenyi	b8b07bb7-582f-4a8b-81e9-4d61634e0305
5f191f86-2aff-4ec7-87d0-366069309509	t	Nyakabanda	b8b07bb7-582f-4a8b-81e9-4d61634e0305
0bcc6ceb-d4e2-43aa-aa3d-28ef13a98a39	t	Bereshi	4e06629c-1d4f-4e97-8ecd-f9eae80f0ea3
63566cad-a552-446f-893a-b2e566ee6a38	t	Biraro	4e06629c-1d4f-4e97-8ecd-f9eae80f0ea3
1c4ea3c0-3965-47bd-9eaf-fbd785aeefa9	t	Kizibere	4e06629c-1d4f-4e97-8ecd-f9eae80f0ea3
c7bc9f8e-33d0-4f0e-b0c9-0f4918a8b50e	t	Mayunzwe	4e06629c-1d4f-4e97-8ecd-f9eae80f0ea3
e1a44f47-c697-4287-9fc8-326ac2ed1200	t	Rebero	4e06629c-1d4f-4e97-8ecd-f9eae80f0ea3
27a5fa3a-fe76-440b-98e9-da56cad9174f	t	Buremera	735cdf32-a38a-46a1-ab9d-aef4ac7323a9
22f8f238-59f2-420f-b220-e3e9bc34af55	t	Cyobe	735cdf32-a38a-46a1-ab9d-aef4ac7323a9
77299a91-0848-4bf7-b654-60da3c958e90	t	Kamurema	735cdf32-a38a-46a1-ab9d-aef4ac7323a9
d9f8b011-08e2-469e-a27a-162e9d577d72	t	Rwimposha	735cdf32-a38a-46a1-ab9d-aef4ac7323a9
d250ed95-f536-4dc6-a051-8bb3f8ead8fa	t	Cyanika	47ffb123-d84d-45ed-a2a9-236553221992
e0aa3de0-78ef-4323-9766-a9c4e51646db	t	Giticyuma	47ffb123-d84d-45ed-a2a9-236553221992
cb56bfb0-b966-49d2-9d8d-763a14949bfe	t	Ipate	47ffb123-d84d-45ed-a2a9-236553221992
8c79d0e6-a642-4f7b-bcb8-459feaaa2292	t	Kabuga	47ffb123-d84d-45ed-a2a9-236553221992
010f7b77-22e0-4500-bc2c-9c960843fb21	t	Karama	47ffb123-d84d-45ed-a2a9-236553221992
062ecf44-eec7-47d0-853b-c3ae84306b5d	t	Vunga	47ffb123-d84d-45ed-a2a9-236553221992
9ee36ab5-db18-4f5b-85ad-77c30706a478	t	Kigabiro	441d1804-d8a6-4bec-bfe7-2ad0f17950e8
a3b0b303-cecf-4c0d-b5f9-4f060f6a9662	t	Nyakarekare	441d1804-d8a6-4bec-bfe7-2ad0f17950e8
4b4fe573-c0e9-4d87-8e3a-a5d7386b381c	t	Kimburu	1bd17b8f-d05c-435b-a8c9-96e819c55fe9
55e68615-d46c-45ef-95cd-56cb804c2504	t	Ruhamagariro	1bd17b8f-d05c-435b-a8c9-96e819c55fe9
3b962d22-c64c-4b0a-9e41-64aa093696e7	t	Kanzu	160bf046-1bc7-413b-86c0-d7080ca037d8
89d47d31-e481-4be9-ac34-44504ebace87	t	Nyakizu	160bf046-1bc7-413b-86c0-d7080ca037d8
aee04fde-c3ad-4982-a2bd-c5d7cbd8ef1b	t	Rubona	160bf046-1bc7-413b-86c0-d7080ca037d8
f4334eab-545d-4b57-adea-0d2815829517	t	Nyarusange	fad8305b-8b51-4e88-809c-cb196782afb4
12307054-5fff-4d86-b04b-d0196aada41a	t	Gitaraga	65024bc2-1a24-4911-9613-6d1f26d88b0b
0522cace-afe9-4701-9bb5-6753904a47b9	t	Kamuzimanga	65024bc2-1a24-4911-9613-6d1f26d88b0b
ad791c75-728e-4754-892a-01975fafc6e0	t	Bunyankungu	605d2013-e3aa-49aa-8b7a-95b9451571d1
ed281e0b-6c45-4c26-b4e1-72d90598bc5f	t	Ntongwe	d4dce451-a910-49cb-a6ae-73099a5f8f7e
1fd83aac-3fc7-453d-bee5-0f7ae3ba6083	t	Rugasari	c9f851cf-8238-4387-b1bf-f6113a6f94a2
dfcdc107-c6c9-4050-92e0-beef1c4b093b	t	Gikoma	e5002f9f-a708-449b-bd36-2ae1a643c851
2c04d1e2-3fcf-4b22-a286-911cef89021a	t	Kantwari	e5002f9f-a708-449b-bd36-2ae1a643c851
f783f458-7141-4eef-bfd5-bb5c20462da6	t	Nyabuhuzu	e5002f9f-a708-449b-bd36-2ae1a643c851
dcb6564d-c3b4-468f-ad96-f1613d96dd9a	t	Nyabyugi	e5002f9f-a708-449b-bd36-2ae1a643c851
61d00ead-02d7-4f8a-b4f5-1ef6f8b148f9	t	Kavumu	ce757bc3-3c93-4233-ba56-e89b190e31fd
973b88ca-0feb-44f5-af42-423707f47a77	t	Kibatsi	ce757bc3-3c93-4233-ba56-e89b190e31fd
68bf5a42-e7b3-47ca-b004-de3a548dc125	t	Marimba	ce757bc3-3c93-4233-ba56-e89b190e31fd
1919f438-598a-493b-a35d-c6c4a80bd37d	t	Ruko	ce757bc3-3c93-4233-ba56-e89b190e31fd
df879739-a85b-4430-b83f-a23671ec9b4b	t	Ntungamo	1d9498b2-e804-470e-9ce6-fe7db7d6d013
a1b9f38a-6566-4ccc-a645-cbfface6c02b	t	Nyamigende	1d9498b2-e804-470e-9ce6-fe7db7d6d013
6ce949da-3cd1-41c7-986f-84010662b8de	t	Cyeru	3b0a27a8-bbc4-4f66-9a2a-985c1d8fdb45
de321bad-966c-4ead-83d0-cd4c08b80e72	t	Karama	fb8a026b-9005-4298-becd-87633cb4b00b
cf4c0130-1cf7-4126-8194-7a35412dd4dd	t	Nyarusange	fb8a026b-9005-4298-becd-87633cb4b00b
7bc77e9b-74d9-4af3-bc2f-f1ec2140bc24	t	Byimana	8df454e8-ad3f-4e04-a56c-b86480ba893e
cc290812-bafa-4abf-b561-b3707b4561de	t	Gacuriro	8df454e8-ad3f-4e04-a56c-b86480ba893e
877960d3-2ec7-4c99-b099-ae8f5f257938	t	Karama	8df454e8-ad3f-4e04-a56c-b86480ba893e
0de2c508-807c-4d3f-a24d-eaab000436c0	t	Kigabiro	8df454e8-ad3f-4e04-a56c-b86480ba893e
b2eb2225-8530-417b-9275-cbda83d53b8a	t	Kintore	8df454e8-ad3f-4e04-a56c-b86480ba893e
96bed444-4f7a-4988-bc42-d5bcb59b8844	t	Mutima	8df454e8-ad3f-4e04-a56c-b86480ba893e
5d535c7a-2082-4457-8604-071f9e0b9847	t	Ruhuha	1803714b-49f2-460a-aabd-4319c2863617
861adba8-748a-4656-b41b-b417cc232c26	t	Buhoro	8cdf7a3d-0179-448e-9d1f-c6cfc98e62d6
458e0c10-baf2-4a79-9560-819a5498c5cf	t	Karambo	8cdf7a3d-0179-448e-9d1f-c6cfc98e62d6
a414bf6d-9214-4886-96df-2b59541745a9	t	Muhororo I	8cdf7a3d-0179-448e-9d1f-c6cfc98e62d6
21ebea2a-4d49-4c43-b187-347d171defac	t	Muhororo Ii	8cdf7a3d-0179-448e-9d1f-c6cfc98e62d6
282f9f97-6445-43eb-bb26-338b10fbc948	t	Rwinkuba	8cdf7a3d-0179-448e-9d1f-c6cfc98e62d6
186de643-722a-472f-be58-270eb9b40a5a	t	Busego	76e48cfc-d6ee-4d53-92fa-174a9453b51c
9591cbbb-5629-4296-8b5a-5f32412141f4	t	Kabega	76e48cfc-d6ee-4d53-92fa-174a9453b51c
eef0da76-9cdf-47b4-b97e-45ac7b3e8bc7	t	Karehe	76e48cfc-d6ee-4d53-92fa-174a9453b51c
02768398-26da-449a-a914-4f04010cbff8	t	Kasemahundo	76e48cfc-d6ee-4d53-92fa-174a9453b51c
415673fe-7b06-4225-b941-dc6d90a4c171	t	Nyabisindu	76e48cfc-d6ee-4d53-92fa-174a9453b51c
5aa78521-ec53-41cd-a55a-ae527a10616a	t	Rusebeya	76e48cfc-d6ee-4d53-92fa-174a9453b51c
3829e3f0-9062-4568-b3bb-856bedcec0c4	t	Rebero	96663366-0bc6-4e23-9dfd-2d8e6c2febdb
1e570162-fbe8-4ea7-b4bb-8da8d234d7a6	t	Rurembo	96663366-0bc6-4e23-9dfd-2d8e6c2febdb
d185fea3-eb3c-4eab-9b2a-4a1ddf07ca5b	t	Bisambu	4ba67a5b-3970-451b-958b-bfecab0cc1f5
d38823b2-1e49-457b-bbee-90a830cb63fb	t	Kibingo	4ba67a5b-3970-451b-958b-bfecab0cc1f5
a6baeb86-fc8c-4432-8f15-bc20aebdee62	t	Muremera	4ba67a5b-3970-451b-958b-bfecab0cc1f5
47749853-a854-40f3-b452-292236a02e0e	t	Ruhuha	4ba67a5b-3970-451b-958b-bfecab0cc1f5
8580b263-bc4f-4830-9ae6-d14d918a865b	t	Cana	0c80a5a8-ec15-4f25-a7ef-e06a383d430e
64993989-2abb-40ce-bf70-64312d38a2b4	t	Kabere	0c80a5a8-ec15-4f25-a7ef-e06a383d430e
6f918f53-2393-4e1b-bcd2-e7e7ff8298d7	t	Kamabare	0c80a5a8-ec15-4f25-a7ef-e06a383d430e
d361b3cc-12cc-47e1-8ea6-b60a4665f593	t	Kinama	0c80a5a8-ec15-4f25-a7ef-e06a383d430e
69e88f3f-75dd-487f-a17e-7362554e13a5	t	Mwali	0c80a5a8-ec15-4f25-a7ef-e06a383d430e
1b61d75d-bf33-40fe-8336-a01069c1cb4c	t	Wimana	0c80a5a8-ec15-4f25-a7ef-e06a383d430e
14d538ca-58bc-4389-ade0-1314dc4c798a	t	Bumbogo	fa92fa6e-e0ca-40aa-afd4-de36b94a1dd9
2cbe4c86-9713-4c04-96f2-a9966222c94b	t	Gataka	fa92fa6e-e0ca-40aa-afd4-de36b94a1dd9
35059fa4-dcf8-4598-9273-33be478d6611	t	Kinama	fa92fa6e-e0ca-40aa-afd4-de36b94a1dd9
cafae048-4a75-4385-b6d8-ea5011a835b4	t	Mabera	fa92fa6e-e0ca-40aa-afd4-de36b94a1dd9
4598d0ce-1588-4719-b58f-1286830ad979	t	Ruhango	fa92fa6e-e0ca-40aa-afd4-de36b94a1dd9
247861bd-1abc-4b97-b685-efd8d8f9ff5c	t	Bihome	fe31270b-8371-44e7-9d14-b218b28d89ca
6c9860bc-b57f-4b07-b0ea-25c43038e395	t	Gatebe	fe31270b-8371-44e7-9d14-b218b28d89ca
b9b978e1-14af-47e5-8303-75f5dfcd8f13	t	Kabambati	fe31270b-8371-44e7-9d14-b218b28d89ca
a0cddaa8-21ba-4aa8-b98c-6412fb2ec4d4	t	Kibiraro	fe31270b-8371-44e7-9d14-b218b28d89ca
d937f9ab-e1c0-40ef-95df-a235bb1ed80d	t	Muyange	fe31270b-8371-44e7-9d14-b218b28d89ca
e2c7e77a-d17f-46a4-b8ed-d01ae49a4d7e	t	Nyabisindu	fe31270b-8371-44e7-9d14-b218b28d89ca
c0daa850-0f50-4626-98b5-86243442f770	t	Nyamugari Ii	0630342f-aacb-4cab-b406-3ba1b37f571d
8b584c7c-2062-4971-9512-950b5adfd6f5	t	Nyundo	0630342f-aacb-4cab-b406-3ba1b37f571d
ad7a5ada-9efa-467c-8327-463b071aef74	t	Ruduha Ii	0630342f-aacb-4cab-b406-3ba1b37f571d
08db2f59-2091-46fb-b73c-31f71b66aa17	t	Rugarama	0630342f-aacb-4cab-b406-3ba1b37f571d
91b21298-983f-4d18-81ec-ed27bcc03408	t	Majuri	06e50642-5ce0-496c-b42d-01f93521b089
c588e567-5da3-4fc9-99f5-fc21dd0f1157	t	Nyabikenke	06e50642-5ce0-496c-b42d-01f93521b089
d8787b7b-1c4d-4dc1-b31b-775251a5736d	t	Twimbogo	06e50642-5ce0-496c-b42d-01f93521b089
c80f2601-a28c-4008-a017-654536251162	t	Gafuruguto	9e730a3d-bffa-41b9-af91-c0d86fe41458
aeba9974-622a-4067-a87e-e3b7781ed77f	t	Nyabihanga	9e730a3d-bffa-41b9-af91-c0d86fe41458
c9cad664-5b00-416b-ae82-60dd943b63d7	t	Nyagahinga	9e730a3d-bffa-41b9-af91-c0d86fe41458
9c1d0069-585f-47fb-960c-49c29eae4806	t	Nyarusange	9e730a3d-bffa-41b9-af91-c0d86fe41458
18f0e02c-4bbd-4734-b38c-b1716d14fcf9	t	Ruganda	9e730a3d-bffa-41b9-af91-c0d86fe41458
870ac106-e9b4-4aa1-accf-12649b09777d	t	Gitarama	ff69ef8a-17e0-499c-8633-f8cc73c65f82
1ffa9cbb-e8ee-46a0-83af-d0d07154056e	t	Gomba	ff69ef8a-17e0-499c-8633-f8cc73c65f82
dd87e8f3-cd9a-451e-a032-353eb1578ae0	t	Josi	ff69ef8a-17e0-499c-8633-f8cc73c65f82
3da66ff2-69f9-40d3-8308-9e70eb6a8a68	t	Gitega	6952301f-5ee0-453b-8e66-5ab58ed5cbf4
490bb146-fcd6-440d-b1f3-a8744ee83fc0	t	Mugomba	6952301f-5ee0-453b-8e66-5ab58ed5cbf4
c2f3f607-e229-4e75-bd3d-af8e5c1ed2ff	t	Nyabikenke	6952301f-5ee0-453b-8e66-5ab58ed5cbf4
c1b5cd9e-951f-4007-8db8-795f92b5f217	t	Ruhande	6952301f-5ee0-453b-8e66-5ab58ed5cbf4
26a6a492-8a54-48a4-ae2f-9c1650a701f1	t	Gacumba	ebc23886-7b5f-4d0c-995d-de9808722b02
3fb43e92-fbb8-4bc6-957e-ca34636eb602	t	Gatwaro	ebc23886-7b5f-4d0c-995d-de9808722b02
1268398a-f57e-4b06-a50f-2507cd82db19	t	Rurembo	ebc23886-7b5f-4d0c-995d-de9808722b02
07052aaa-e5e7-450a-966a-19db757d3f15	t	Karutete	fc451f38-f94a-4089-9995-d7594028b899
12baf7bf-7b8b-498c-90a2-f59ea2159911	t	Kiyovu	fc451f38-f94a-4089-9995-d7594028b899
98d23224-a383-42b7-89fb-4e4bc7be5204	t	Maryohe	fc451f38-f94a-4089-9995-d7594028b899
fb77fbc0-d7c2-4c19-95cd-a167282c09c9	t	Nyabaguma	fc451f38-f94a-4089-9995-d7594028b899
e28ba6a0-2e92-4367-8aff-56c3c9e78fed	t	Nyakigezi	fc451f38-f94a-4089-9995-d7594028b899
8f524e80-a9ce-47fb-b915-35a7e88edcf0	t	Nyarurembo	fc451f38-f94a-4089-9995-d7594028b899
994dc33b-6cf4-40ab-b4d5-f651ed6e098c	t	Ruganda	fc451f38-f94a-4089-9995-d7594028b899
c1753a99-661f-4b23-9bdd-8b9e1243b3fd	t	Bupfune	18b5e16c-d26d-4502-a89d-00e396fea18b
fb1e42a0-2a50-49da-baf9-c4c268a92986	t	Bwishyura	18b5e16c-d26d-4502-a89d-00e396fea18b
a13ab861-6346-40d8-823a-57ae92d2c50f	t	Kanyabusage	18b5e16c-d26d-4502-a89d-00e396fea18b
01ee67e0-cb19-43e4-ac34-df6eecf3e47c	t	Karongi	18b5e16c-d26d-4502-a89d-00e396fea18b
5cab1e5b-8390-4518-9a74-2c3d61044a63	t	Nyarusozi	18b5e16c-d26d-4502-a89d-00e396fea18b
5db1100b-2cad-4ebf-a38e-7a643574c071	t	Birambo	3375f6c7-54c6-4fe7-9008-48be90a499fa
e09fad3a-ceb3-47d0-a05f-f301caed0ec6	t	Nyagisozi	dd0bcbee-6175-4c9e-ba0c-0c960f19d638
b98dea2d-8f74-4788-8cc7-ae52164ce2a0	t	Mboneko	3d4f5dc9-5dfa-41b4-bd4a-6cbf9ce2f6bc
3c94a52c-69e6-49e9-a64a-ca7d1550ff33	t	Mweya	3d4f5dc9-5dfa-41b4-bd4a-6cbf9ce2f6bc
64411cad-05d7-4cf6-b326-6ecfeb76989c	t	Ruhunde	3d4f5dc9-5dfa-41b4-bd4a-6cbf9ce2f6bc
24dabc95-c114-4a6c-abf5-9795f25b9f21	t	Tura	3d4f5dc9-5dfa-41b4-bd4a-6cbf9ce2f6bc
55443f38-f3aa-49b5-9c03-51f5558721b2	t	Gataba	0c36c620-f375-4a3a-b272-9c2637a05030
50a3713f-55eb-4fae-b7af-dbfba2ae52b1	t	Gisiza	0c36c620-f375-4a3a-b272-9c2637a05030
e902c684-8cfe-42e1-8120-c5ead4cf1e8f	t	Gitovu	0c36c620-f375-4a3a-b272-9c2637a05030
a09a7c21-0018-44ab-8f7b-fed374f4ac64	t	Kabuga	0c36c620-f375-4a3a-b272-9c2637a05030
179cf9d5-66d7-43e5-93bc-addd9a04d75f	t	Kagano	0c36c620-f375-4a3a-b272-9c2637a05030
f4e30182-7e4c-49b5-8c10-ca4f453f6ae0	t	Mpatsi	0c36c620-f375-4a3a-b272-9c2637a05030
42789205-9a5d-4ca4-9f45-ea1e71412a01	t	Gitwa	19f2dc10-58ef-44f2-8ab6-4fd8bd943c47
d27fb75c-8b79-4fa0-a7e8-41e84dba5501	t	Kabwenge	19f2dc10-58ef-44f2-8ab6-4fd8bd943c47
eb63815e-f3fd-441b-ae8c-e955c498d8d2	t	Karenge	19f2dc10-58ef-44f2-8ab6-4fd8bd943c47
34bb4fc7-4895-4ce3-92ca-b77c886bc603	t	Butare	f1c5287b-83ed-46c7-ae1b-5c7303aeb51c
62772bbc-776d-4abb-84da-c7b849cd5f9a	t	Bweramvura	f1c5287b-83ed-46c7-ae1b-5c7303aeb51c
6feea1da-fe0b-4177-b750-bda8c29ce99f	t	Gisoro	f1c5287b-83ed-46c7-ae1b-5c7303aeb51c
7ac5f61f-2770-4a8b-b5e6-f5ee7971f561	t	Gasharu	4ffe587c-da50-4f9a-bc26-93fda946f056
2d20266d-2439-4705-8d6f-b43afeb1ee98	t	Kabuga	4ffe587c-da50-4f9a-bc26-93fda946f056
84319582-9f3d-497b-9b20-e93bdc9efb00	t	Kamunungu	4ffe587c-da50-4f9a-bc26-93fda946f056
7451ee3a-6252-4f87-87be-de28d4c855e6	t	Kibaya	4ffe587c-da50-4f9a-bc26-93fda946f056
e5043d6e-29cc-4ff7-bfa8-434d5a0460ec	t	Kirunga	4ffe587c-da50-4f9a-bc26-93fda946f056
295cb3eb-2c64-4539-b8f9-31abf5ccbb6c	t	Musebeya	4ffe587c-da50-4f9a-bc26-93fda946f056
ea44ff8b-f6b2-4cd3-b3db-77f7937ee4a2	t	Rwagisasa	4ffe587c-da50-4f9a-bc26-93fda946f056
9a462c5c-1f6b-48f6-bfaf-945e818f8f0e	t	Murambi	d3fa8655-e2c5-4937-868e-1f1a0c1cf003
66a25734-5177-46b2-b3ab-4a0e459d0289	t	Uwingabo	d3fa8655-e2c5-4937-868e-1f1a0c1cf003
a8f6716b-2486-402f-8eb5-e48a590a3158	t	Giticyuma	5fb4c01d-8f1c-4a45-88fe-1305bc6a0ed3
edfb5a22-7b8b-493b-92c5-576482aea384	t	Karongi	5fb4c01d-8f1c-4a45-88fe-1305bc6a0ed3
98e61a97-437e-4db1-968a-a86a9de64329	t	Nyagisozi	5fb4c01d-8f1c-4a45-88fe-1305bc6a0ed3
4d7c43fa-2674-41b0-b4c6-5490279c1309	t	Kirambo	982725af-1fae-49b1-869b-107c761f10a3
5485c56a-f234-4de3-ad72-3b166300efb0	t	Nzabuhara	982725af-1fae-49b1-869b-107c761f10a3
57614bc1-fb85-4afb-b830-2e38d3b4a606	t	Kinama	36eadc54-71b1-412e-94d1-68fcd4b257a4
955306f9-a583-45a1-8e1b-f5e32cec1d81	t	Munanira	36eadc54-71b1-412e-94d1-68fcd4b257a4
116051b7-158c-4f12-8dea-ff9314c84b32	t	Nyabigugu	36eadc54-71b1-412e-94d1-68fcd4b257a4
cd8dc6e3-9c26-4551-8d3c-69d8e64363b2	t	Nyarucyamo	36eadc54-71b1-412e-94d1-68fcd4b257a4
2cfaa8b8-f811-4544-9cd2-9203e10ffe40	t	Gasayo	733f98ac-5d7e-49c6-9bc9-1b5695892b82
15ad20ef-6b0b-4075-b1ac-6ffa78aef26d	t	Muramba	733f98ac-5d7e-49c6-9bc9-1b5695892b82
28ba0114-ab93-409e-bc96-245826c21887	t	Nyabikati	733f98ac-5d7e-49c6-9bc9-1b5695892b82
ed4ebff8-83ad-4d82-95a0-31e5207aea00	t	Nyagahinga	733f98ac-5d7e-49c6-9bc9-1b5695892b82
f4a487c7-bb75-4a21-b0e5-44abaf8f65a7	t	Nyarubuye	733f98ac-5d7e-49c6-9bc9-1b5695892b82
fc0a501f-8c82-4e53-b6fc-dbcd29c731e7	t	Kigarama	d8b0ee7a-6825-4fe1-882b-2f237eebd695
48b01e50-363c-41a2-8cc8-6b581a67753b	t	Kirwa	d8b0ee7a-6825-4fe1-882b-2f237eebd695
877f5939-48d5-43b0-a444-7963331c249f	t	Bitaba	f7b33476-1f4a-48e9-aadc-1a9c760b9260
101e0064-8bdd-46cb-9e32-3fba23a7d0a1	t	Buhari	f7b33476-1f4a-48e9-aadc-1a9c760b9260
a6bea404-48da-4085-9034-b35d4397f9ff	t	Kagabiro	f7b33476-1f4a-48e9-aadc-1a9c760b9260
d29d94c8-b55c-4ce1-83da-1d7bf7442387	t	Mweya	f7b33476-1f4a-48e9-aadc-1a9c760b9260
4580b68b-bd0b-4cf7-b938-2d80c7c3931e	t	Nyabinyenga	f7b33476-1f4a-48e9-aadc-1a9c760b9260
e3fbe11c-6fee-4110-b612-96fd19d2e675	t	Nyakabande	f7b33476-1f4a-48e9-aadc-1a9c760b9260
9fd55140-ff38-41be-8c52-46fdeed50532	t	Kabuga	76ef4619-34ba-4d1d-8685-f83c8f13834b
bd45d266-1adf-4758-8087-49d6cb73aa16	t	Kaduha	76ef4619-34ba-4d1d-8685-f83c8f13834b
a0cb84bf-bdad-408d-803f-4de89f006262	t	Karora	76ef4619-34ba-4d1d-8685-f83c8f13834b
2913a85b-a523-43a1-a861-d451bc944178	t	Murangara	76ef4619-34ba-4d1d-8685-f83c8f13834b
c94efd52-1bbd-4caf-98aa-ee0c20b7c59c	t	Nyabitare	76ef4619-34ba-4d1d-8685-f83c8f13834b
364e2915-91cc-4c03-bc91-b74272458f6d	t	Rubyiro	76ef4619-34ba-4d1d-8685-f83c8f13834b
84132f40-dc04-43cd-adf5-6fd652bd4794	t	Rwakamuri	76ef4619-34ba-4d1d-8685-f83c8f13834b
90443c1f-141b-45d2-99ae-453e87c1e5bb	t	Gisizi	67571a41-208d-4a95-ac92-cee0b9154c6b
8dd7b5f0-df23-4d09-b94b-d8e82ab9366c	t	Mara	67571a41-208d-4a95-ac92-cee0b9154c6b
6cb88a4b-9370-4aa1-bd73-b5c2c912d303	t	Nyagatovu	67571a41-208d-4a95-ac92-cee0b9154c6b
c05a36a0-b1fa-4944-ba04-4d7daa240ffa	t	Nyankira	67571a41-208d-4a95-ac92-cee0b9154c6b
b3144f8e-c459-4e04-826a-0a0c0686a551	t	Ryarugenzi	67571a41-208d-4a95-ac92-cee0b9154c6b
9b3f3701-f068-478e-ac95-dd1c85e784da	t	Bikenke	96ea9160-466c-46fd-b319-ea0d155e8d1a
0696eefe-c2c7-4ea7-b2af-12a90de3a305	t	Jurwe	96ea9160-466c-46fd-b319-ea0d155e8d1a
6482d10e-80c2-480a-bb81-a1717a960138	t	Kizibaziba	96ea9160-466c-46fd-b319-ea0d155e8d1a
0a7a0b47-fbc7-4156-bcba-d5794362af97	t	Mubuga	96ea9160-466c-46fd-b319-ea0d155e8d1a
f88b5a50-54d5-4b7c-906c-9405b7f351e1	t	Ryaruhanga	96ea9160-466c-46fd-b319-ea0d155e8d1a
8ee0ef3b-2b0a-40f6-8c72-376fbf213dc2	t	Gasebeya	ae2e1f11-f394-4b31-90bd-ec9921b5ce76
3b956f12-2844-495b-b013-2f26ce275acb	t	Kazibaziba	ae2e1f11-f394-4b31-90bd-ec9921b5ce76
928bf1d5-1c92-4fdb-bde3-b8a60ec64f03	t	Ndago	a09427fe-8126-446b-b007-5ab608ec24ae
2b410b58-5bc6-46ed-aebf-212263a2a2af	t	Gituntu	6e12fec5-5e75-466b-b43a-2b1754d39dda
b7f6227d-b49c-465e-813b-fa38157df77e	t	Nyaruhanga	bbe443fd-060d-4d96-abcd-ac2eb0d82b8a
110665f4-a4e3-4ee6-9bc4-f0c8e3dcd1fd	t	Nyakarambi	6093e85a-fd9e-4bfb-8660-2a47777a3fc8
dadc6bc6-bd91-4cf3-be4f-b0c422d2bae0	t	Bwenda	00f4d7c0-3b0f-4ab5-b1df-16a85fd5e3bb
e318ed2d-dd49-4f3d-88bb-4c5c7b85385a	t	Kuruganda	00f4d7c0-3b0f-4ab5-b1df-16a85fd5e3bb
aae0fb32-b721-4bd1-803e-20c16f8ab93b	t	Gititi	3db1bde0-2df9-41c9-aaed-41d30ac328a6
3585ea8d-e201-4ee7-9839-937cfb178e08	t	Kivumu	3db1bde0-2df9-41c9-aaed-41d30ac328a6
da0ea039-56aa-48a1-b909-51e74f293854	t	Muhondo	3db1bde0-2df9-41c9-aaed-41d30ac328a6
436daad1-401f-4fd6-8bce-f8210671692b	t	Rugogo	3db1bde0-2df9-41c9-aaed-41d30ac328a6
7368fd9f-b962-47a5-895c-3441efd4934e	t	Gakomeye	bc702389-1207-4d43-b498-2aba3dabbbe5
3ab387bb-a455-42b4-9e96-de88862040d9	t	Kavumu	bc702389-1207-4d43-b498-2aba3dabbbe5
4675162c-edb3-40ad-bb8d-c56aff8b148a	t	Makurungwe	bc702389-1207-4d43-b498-2aba3dabbbe5
7b666787-fa13-49b5-aff2-7ec25fa3f184	t	Gasharu	bcb8ea7b-9f1d-44a3-bade-8faff028e8c1
4d939424-b536-4b1b-abb8-b7bae300a11e	t	Kamuvunyi	bcb8ea7b-9f1d-44a3-bade-8faff028e8c1
6e8208f4-73d5-423c-abc1-c636d2fd1b0a	t	Kamwijagi	bcb8ea7b-9f1d-44a3-bade-8faff028e8c1
c644bafd-c210-485e-9307-8715b52942fb	t	Karehe	bcb8ea7b-9f1d-44a3-bade-8faff028e8c1
a741264c-2f0f-451a-a8f3-7791480317d8	t	Nyarubuye	bcb8ea7b-9f1d-44a3-bade-8faff028e8c1
e5b95368-c34e-48ef-a723-95c9bc686cde	t	Remera	bcb8ea7b-9f1d-44a3-bade-8faff028e8c1
c56457a1-c96c-4a7d-a84f-994911f62a03	t	Nyabitare	c4078805-fa1b-4319-b220-3466cf852899
8dda9efc-64fb-423d-8403-9b8bac8498e8	t	Nyamagana	c4078805-fa1b-4319-b220-3466cf852899
087ce122-d409-4f04-96fd-dbc999585b1b	t	Rubona	24e0b5d9-4fe9-47bf-8ee2-86ea095cb6fc
f678c666-1622-48fc-818d-3e0cf24b737c	t	Buhoro	da975e90-f45e-462d-8b29-fc66dfc468d7
a356fdce-bc58-411f-97cc-05d9506df1a9	t	Cyimana	da975e90-f45e-462d-8b29-fc66dfc468d7
d8a5a6b9-f6c5-4081-81a0-c153431080b1	t	Kabeza	da975e90-f45e-462d-8b29-fc66dfc468d7
4d1b195a-d48f-45f2-b2f7-7b9131b514c0	t	Kagarama	da975e90-f45e-462d-8b29-fc66dfc468d7
c611d877-2b03-4eb1-bf1c-4a48aa526552	t	Kamusangany	da975e90-f45e-462d-8b29-fc66dfc468d7
22f96d28-8a93-4610-9692-5dca6b07c5fd	t	Kimigenge	da975e90-f45e-462d-8b29-fc66dfc468d7
5862edbf-d39b-472f-b66c-645710874411	t	Ndengwa	da975e90-f45e-462d-8b29-fc66dfc468d7
a8193e79-3528-47a0-b817-b8305daf5da9	t	Rubona	da975e90-f45e-462d-8b29-fc66dfc468d7
f7757e14-170e-4734-a624-c2c4439bca2d	t	Gatare	97f7db3a-7ae9-4c4b-93b1-a92763efd9be
20d2c511-5445-4f01-9c3c-cde302a169f3	t	Nkomagurwa	97f7db3a-7ae9-4c4b-93b1-a92763efd9be
2e8ecc5a-cc0f-4e46-aba4-b6f4a703f9db	t	Bunyankungu	edfacb8e-348d-426c-9e32-ef5185dceb1d
75461608-1aef-4f20-a360-11f7dbf2b91b	t	Kabeza	edfacb8e-348d-426c-9e32-ef5185dceb1d
73d944e4-3b8b-4b68-82e1-ed6c5368e432	t	Nyagahinga	edfacb8e-348d-426c-9e32-ef5185dceb1d
6942f393-b315-4311-a5ba-820aa723e885	t	Nyagasozi	edfacb8e-348d-426c-9e32-ef5185dceb1d
3533fbe3-fe93-49e2-aa4d-013802ad4b44	t	Nyagatovu	edfacb8e-348d-426c-9e32-ef5185dceb1d
b311ab23-0c18-4704-9e61-0a699487c9d4	t	Nyakabungo	edfacb8e-348d-426c-9e32-ef5185dceb1d
140ab1a1-dec6-4761-9e87-6e3ccc607b09	t	Rugabano	93d5616e-fe81-4ced-9d91-a57c39512d83
ea1cc05b-b831-4630-a2d2-fb47341a94e2	t	Gihara	09dd6484-2070-473d-9b82-9bf1e7b9c4e1
4af11de2-470e-4f3a-899f-9fc6882a087e	t	Kagombyi	09dd6484-2070-473d-9b82-9bf1e7b9c4e1
e5dcd23a-1771-4b09-b594-b69602fa9a20	t	Kivumu	09dd6484-2070-473d-9b82-9bf1e7b9c4e1
7f26532a-d603-463f-8e24-a58fdeaae1a4	t	Ryangondo	09dd6484-2070-473d-9b82-9bf1e7b9c4e1
e6c08fe9-55a5-4e40-a044-f23ea1bc4b33	t	Bwihe	86c8d163-5ab1-43b1-81d1-e355c6851ccc
beb06b4f-a1fd-415b-ad29-1377c1eeb264	t	Gitabi	86c8d163-5ab1-43b1-81d1-e355c6851ccc
5ebfeb4a-1bff-45fb-aeb1-32cd16339a7d	t	Kanyegenyege	3d6c5b71-a4a8-4345-8144-84c51149bc3a
3293ac7f-80f3-4b4a-9e1e-b4dc4d9e4766	t	Gahunduguru	b4e0f4bf-c388-482b-87b7-d63f0bb93562
a62e1706-0004-4969-a0a9-4accc6f64639	t	Ruhuha	023c6ea7-aea4-486d-a898-0c2767c4b7f7
7c2539b0-f2d6-402b-b658-4ff4654fd08d	t	Jurwe	4da6f92f-fa5c-4086-8a4e-eefbfd667abe
a8b4d5d4-f9d0-4bb9-845a-eecee0e38f26	t	Uwingabo	4da6f92f-fa5c-4086-8a4e-eefbfd667abe
ee1c82cc-17bb-4857-9647-fb2d5cfd0b3c	t	Muhingo	deae96c7-b675-4506-b70e-8975c091f81a
62846d80-abc4-4de7-826f-573c2aeb8a16	t	Rwasheke	deae96c7-b675-4506-b70e-8975c091f81a
c0a41077-3a5d-4c1b-b850-248465f2ba83	t	Kinaba	ebdd9d30-58c1-44c9-b245-97bfee961452
c7d4c547-c36b-4ebe-be0c-117d6d68b470	t	Winzira	ebdd9d30-58c1-44c9-b245-97bfee961452
dbafa984-9012-4c3c-a072-34257abe9c4c	t	Mahembe	e68e347a-0c6a-4b4c-b618-aed96d312234
21a779e6-1359-4afd-97e7-2fd1b22766e9	t	Musango	e68e347a-0c6a-4b4c-b618-aed96d312234
3a09586c-0bf6-43f0-b367-5d456e2fadb2	t	Nyarushekera	e68e347a-0c6a-4b4c-b618-aed96d312234
ad555c85-a7bb-488b-b948-64420db36f78	t	Gasharu	99871166-8ade-480f-8434-5d20c10140c4
0b0b1b0f-64c5-46f6-88b8-32011656a93a	t	Karambo	99871166-8ade-480f-8434-5d20c10140c4
17f73e8d-873c-4ab7-b5a4-52b261037ca4	t	Kigogwe	99871166-8ade-480f-8434-5d20c10140c4
373ae574-4ba8-462f-a860-59f6e6e968b0	t	Kanyege	99871166-8ade-480f-8434-5d20c10140c4
cd2926da-459e-4798-83c9-41d891ad96f8	t	Wingwa	99871166-8ade-480f-8434-5d20c10140c4
1d3031eb-720c-4d7a-aa13-ab4769faf398	t	Ruhinga	45b41f8d-262b-48db-9acd-22fe9ea82cf7
65522d00-d324-474c-b2c0-35f7f2cce7b9	t	Rushishi	1e08c89c-038c-43bf-a067-5b07dff6b7d5
79ca93e1-0081-4baa-bf56-3dae3cc9b078	t	Gakoko	0489cfdb-484c-4624-b476-1c30f30444f1
306917af-16c4-48ba-9183-bf427e172b24	t	Karumbi	0489cfdb-484c-4624-b476-1c30f30444f1
0db3fa0c-b616-4343-81f0-5745e84ccbf3	t	Nyamiryango	0489cfdb-484c-4624-b476-1c30f30444f1
92e124e4-6da9-448a-84b1-86790907d39c	t	Twumba	0489cfdb-484c-4624-b476-1c30f30444f1
934e2029-fb58-49b9-9282-e1e0a1a5ea42	t	Gashihe	eee7bc0b-0f48-4df9-800a-a8572bee62b3
24f81ab7-d837-491d-800e-1f0544601afa	t	Gatare	31c35760-5441-4963-b426-0d311c88fffb
415e1aa1-4c97-4572-acca-1471bdfe4cf0	t	Mataba	31c35760-5441-4963-b426-0d311c88fffb
0bf94e64-38c2-4331-84a1-b8c55e1e0661	t	Nyakiyabo	31c35760-5441-4963-b426-0d311c88fffb
4ad8697c-6727-4b0a-9f8a-569fb6154bcd	t	Tuvunasogi	31c35760-5441-4963-b426-0d311c88fffb
6f8a8122-747c-4d17-8392-862705e8aa39	t	Duhati	85ff4954-a266-4cc2-95c2-c76ada8918da
add051d4-6225-460e-be22-8868d27ebcc2	t	Kirwa	82ef7a95-5786-44ab-b169-cc5decddcaa1
341997f0-cdfc-4c13-8549-9fe52a866296	t	Nkuri	82ef7a95-5786-44ab-b169-cc5decddcaa1
dff6ebbe-ce8a-4d3f-8b79-4eda54d81e4c	t	Rutoyi	82ef7a95-5786-44ab-b169-cc5decddcaa1
1bfb2fdd-dd35-42e6-8008-cc1a420de361	t	Gasasa	5a5acb63-ee76-4012-bfd1-8308caec7e5b
1c8ea0cd-0a03-43d8-908c-9eb799e22fea	t	Gitonde	5a5acb63-ee76-4012-bfd1-8308caec7e5b
b08eefbe-7cf6-44d5-a8b3-4fb6f8b48efb	t	Rukeri	5a5acb63-ee76-4012-bfd1-8308caec7e5b
14aa7a99-01d5-4793-b3de-2ed9ed29f76c	t	Rwamakara	5a5acb63-ee76-4012-bfd1-8308caec7e5b
776229f6-829e-4e1a-ae23-f2731c5f90cd	t	Bereshi	170b6f28-b480-4fcd-b51b-79dc9b5a114c
945dd50f-f5a9-422a-a83b-638235e68e7c	t	Gitarama	170b6f28-b480-4fcd-b51b-79dc9b5a114c
06e348d3-8c75-4f1c-a7dc-7a6df00245ac	t	Kurushishi	170b6f28-b480-4fcd-b51b-79dc9b5a114c
cad5a69d-42dc-4249-8761-e84be18728c6	t	Mukingi	170b6f28-b480-4fcd-b51b-79dc9b5a114c
e7b96bb1-6298-406e-a52f-2071f591c3ad	t	Nyakarambi	170b6f28-b480-4fcd-b51b-79dc9b5a114c
c849f37a-a893-4067-95f6-a161ece988f4	t	Birambo	cd404df6-800a-4d62-8a80-eb78e7900b6d
e1d3b273-8031-42d0-b1fb-cda5e4e45510	t	Mpara	cd404df6-800a-4d62-8a80-eb78e7900b6d
f095b70c-4794-4c4a-911c-2b9e991c6c16	t	Ruvumu	cd404df6-800a-4d62-8a80-eb78e7900b6d
86d14cb1-0d2d-4de4-90fe-907804767743	t	Gasave	586e9c50-0cac-4591-9bcd-1c86c11ed9e3
a765d496-c179-4cd9-8d77-0078e7cb16c1	t	Shyogi	586e9c50-0cac-4591-9bcd-1c86c11ed9e3
bb66396e-9c0c-4c9a-953f-ac60ddf91bdd	t	Byimana	5c9d7d59-8216-42f9-b8af-fc020e3329ac
ceffc924-b407-42ce-8b49-b9200cd1ee20	t	Gasave	5c9d7d59-8216-42f9-b8af-fc020e3329ac
c4172994-ece3-43b8-993a-42819342267d	t	Karehe	5c9d7d59-8216-42f9-b8af-fc020e3329ac
a439ef8f-6691-43e0-a986-454fe3cb15bc	t	Kavumu	5c9d7d59-8216-42f9-b8af-fc020e3329ac
27408d38-52b8-4656-92aa-12f60f757f8d	t	Kimisagara	29a3f998-33d5-48b6-a839-f9ea186c81b7
470a3b1c-499e-4cba-a83f-d2fc9da563e0	t	Nteko	29a3f998-33d5-48b6-a839-f9ea186c81b7
aba1ce3a-18c7-47bb-9608-cbfd65fcefea	t	Rugara	29a3f998-33d5-48b6-a839-f9ea186c81b7
fffda179-e9dc-49ba-89b9-e608dcba38ba	t	Butare	b2cdb9a4-9ea6-4b1d-ac92-c8ddbc4fedf9
57afe051-40b6-438a-96a9-615ffcb03129	t	Jimbu	b2cdb9a4-9ea6-4b1d-ac92-c8ddbc4fedf9
9cf43e2a-f497-458d-9004-d12d6cc7a424	t	Kabeza	b2cdb9a4-9ea6-4b1d-ac92-c8ddbc4fedf9
3630f0de-dbce-49ff-bcb4-feb336aa5256	t	Kagarama	c013f99c-ea7e-4e73-aeab-848a8ef408bb
9823579c-bc8f-4724-82ca-4e2c9de11a7c	t	Mukaragata	c013f99c-ea7e-4e73-aeab-848a8ef408bb
5dbd6729-1855-45ab-82ef-8f4dafef9394	t	Buyungu	71658468-11ef-4fc7-adff-3dca5448b85c
11103045-ab32-4ac5-a2e9-a3770a058d9a	t	Gapfura	c52dfc94-861a-42fd-ab51-fa9fa82b73ea
7e98d731-4b70-4ed0-af1d-206d3904a6fe	t	Gasovu	c52dfc94-861a-42fd-ab51-fa9fa82b73ea
82ab19a9-c815-4d9d-8139-75688666a66c	t	Kabenge	c52dfc94-861a-42fd-ab51-fa9fa82b73ea
74009c33-629d-4df6-9b99-75bb3d1cc135	t	Bwoga	03c9cf72-a998-4104-8312-2bd65ef3b689
ee0637f8-85c7-4600-98ef-075c27537435	t	Kamana	03c9cf72-a998-4104-8312-2bd65ef3b689
1df09518-39b9-4743-8c08-47e37b69e73d	t	Rugari	03c9cf72-a998-4104-8312-2bd65ef3b689
af3415e5-9d3c-4bd9-a606-06b9a74294fb	t	Kagugu	124e9af9-fc19-4ef5-a29e-da47210209f4
b4a140cd-2b45-40eb-85de-ab0eb4c6fca9	t	Kiribata	124e9af9-fc19-4ef5-a29e-da47210209f4
fa7d8b26-dcef-46dd-bb4c-ebb3ca8b9a38	t	Muvugangom	124e9af9-fc19-4ef5-a29e-da47210209f4
7ed5ce96-9823-4346-b956-bb9b7366bae0	t	Kabuga	fefcb4c4-919f-4a18-90b1-d2a56d1f7a52
81ce33de-13a6-42d5-93d1-f43fa1807bc1	t	Kamonyi	fefcb4c4-919f-4a18-90b1-d2a56d1f7a52
dba01672-b783-4ab3-8405-f0e3e1501749	t	Gitaba	cde976ec-28c6-4e9d-877c-b3db22f2ff5c
820146f7-f024-4360-a130-72f7deab624a	t	Kabere	cde976ec-28c6-4e9d-877c-b3db22f2ff5c
23818bf7-2318-4c47-80c8-c2347c4473bb	t	Kabusizi	cde976ec-28c6-4e9d-877c-b3db22f2ff5c
f84d341b-ac5e-49df-9f34-f8a3a29bf161	t	Kinyamiyaga	cde976ec-28c6-4e9d-877c-b3db22f2ff5c
2cbcd050-d0a0-4afd-b782-906741e43cff	t	Mbandari	4a4dfe09-2c57-4dba-893b-e0b9ad3a6154
22782b41-c617-4bb5-82c3-ad6d1d7b6ba7	t	Mitabo	4a4dfe09-2c57-4dba-893b-e0b9ad3a6154
893cca81-ece1-4812-993e-6e1f3179bd69	t	Muturagara	4a4dfe09-2c57-4dba-893b-e0b9ad3a6154
036cec19-d555-4f40-82d1-df14f58e196e	t	Nyamweru	4a4dfe09-2c57-4dba-893b-e0b9ad3a6154
1577b589-dd6c-4d35-8e66-88cf141c7f70	t	Rugari	4a4dfe09-2c57-4dba-893b-e0b9ad3a6154
b630a831-480a-4e7f-b9c5-01efabe630d3	t	Kiyovu	63f08127-dc36-41e9-a318-63213ae12caf
72cff2e9-b127-4f0a-a357-11a4184b21e0	t	Migongo	63f08127-dc36-41e9-a318-63213ae12caf
4fbc0a74-44b8-4010-947d-5bc02172ce6b	t	Rebero	63f08127-dc36-41e9-a318-63213ae12caf
d8d5a7aa-fdb0-40b7-9b56-114230647d2a	t	Rurembo	63f08127-dc36-41e9-a318-63213ae12caf
22d08625-8a76-4062-9580-eefe85c730f1	t	Rwantozi	63f08127-dc36-41e9-a318-63213ae12caf
877bdaf2-7a33-4934-9b6c-68701ce33798	t	Bukonde	c2b54c07-a502-4787-b753-892285868940
e06ce01f-575d-4e0d-a055-a35fbabcd885	t	Merabuye	c2b54c07-a502-4787-b753-892285868940
5e4238bc-2664-46e1-9216-1cafe4b7e5f5	t	Nyabarinda	c2b54c07-a502-4787-b753-892285868940
6dd07863-10b7-4c97-b15a-02c2d418a562	t	Rubambiro	c2b54c07-a502-4787-b753-892285868940
c1fd04a5-0748-4264-9b5f-17539236de9b	t	Gisebeya	2ffcd141-29df-4e5f-a134-2abd0c874be9
5e065d46-3fc2-46ea-832a-871e745c3d8c	t	Gitumba	2ffcd141-29df-4e5f-a134-2abd0c874be9
413ee9e2-02e3-4df6-b369-eeec9d2cccfa	t	Hanika	2ffcd141-29df-4e5f-a134-2abd0c874be9
edf28687-b617-4050-97ca-79fa18113c64	t	Ngoma	2ffcd141-29df-4e5f-a134-2abd0c874be9
feb5cd28-55c0-446a-842a-a7a37ba41a64	t	Nyamugeyo	2ffcd141-29df-4e5f-a134-2abd0c874be9
2d404705-683a-44e0-8faa-92557656b236	t	Rukorati	2ffcd141-29df-4e5f-a134-2abd0c874be9
cd4507c1-eff3-4ba8-a2bd-02421b9d924d	t	Bukonde	3da8bdfc-f9f5-42c8-b52d-63b1d21b453b
d8de5fbb-ba2a-457d-b339-0fa587f90756	t	Kimiramba	3da8bdfc-f9f5-42c8-b52d-63b1d21b453b
be9dc1c5-7265-4522-89c0-8d21af2426ea	t	Kirwa	3da8bdfc-f9f5-42c8-b52d-63b1d21b453b
69b9a25d-ab2e-4063-b15a-26511714f388	t	Kariha	2db868d2-18fa-4cb0-b029-f15182456993
6311ad84-6233-46b4-9817-a7fb351d4740	t	Ruganda	2db868d2-18fa-4cb0-b029-f15182456993
94c2906a-81b8-487a-8255-358d35d921b9	t	Rusenyi	175f6736-3418-4f58-a40b-0cbfa53fab33
88b6b737-0191-4afb-9586-470d46a86b96	t	Rurambo	01874478-101a-4788-96b8-cd8c5b966939
c3cb63ec-5645-4ef0-b1cd-f9ca8d64ba6a	t	Kabuga	2141b7bd-574d-4a03-a4a8-1a77fc12ba37
5fa6ec92-33e6-41a3-9b0b-18e7077c7f63	t	Gasiza	5bb842bb-6dac-468a-92b7-6170c74560c0
41a1f402-28ac-4e17-af3a-d04ffc94a1ec	t	Giseke	5bb842bb-6dac-468a-92b7-6170c74560c0
375c752f-1d82-4032-9d57-81bb53695183	t	Mubuga	5bb842bb-6dac-468a-92b7-6170c74560c0
b6531976-adca-450f-bb63-3684426d640a	t	Buhuma	1c538910-db1f-4db6-88f3-45129f977445
934c3b06-635d-4aa9-ab4c-10adf51f8db6	t	Gashaki	1c538910-db1f-4db6-88f3-45129f977445
d41267ad-22e4-41a7-b093-03e4b6da41bf	t	Nyabitsina	1c538910-db1f-4db6-88f3-45129f977445
0eefb90c-046a-42d5-af4d-278720b40792	t	Karambi	b0e55656-96e4-486f-b245-b5fdf9e37559
64d3c982-3dce-40f7-b7a5-09bf09a49e38	t	Kaziba	b0e55656-96e4-486f-b245-b5fdf9e37559
304ff71e-d3ba-48fc-b1f7-be78adaeb2f8	t	Nyarukara	b0e55656-96e4-486f-b245-b5fdf9e37559
e950200f-3cb0-45bd-8610-e9efae1be782	t	Cyasenge	cf5466af-87e5-441d-bd7b-81e44c66b7f3
fdaff1f0-d79c-43c9-92fd-7084420c39b5	t	Gasibya	cf5466af-87e5-441d-bd7b-81e44c66b7f3
172ecb07-e70a-47a7-94af-8d157d9bb803	t	Nyaramba	cf5466af-87e5-441d-bd7b-81e44c66b7f3
c4da3dd4-c37b-48e2-a580-f4768d25379b	t	Ruhurura	cf5466af-87e5-441d-bd7b-81e44c66b7f3
41025a54-b26d-47e7-89f6-6c4ff6558c05	t	Gatovu	1f207ac7-2a3b-4ebf-9bc4-134265fd31d6
5678a481-36c0-4f09-b36e-302bbb2b5607	t	Kabere	1f207ac7-2a3b-4ebf-9bc4-134265fd31d6
c2c9b9fa-0681-40c3-8a7a-715278f04ba7	t	Murimba	1f207ac7-2a3b-4ebf-9bc4-134265fd31d6
396e1ffd-120f-4467-b40e-3363d831ebcf	t	Mwiyanike	a6d4f2b9-a6d7-4087-851c-a4fd20d4b3c3
24986b00-eff8-45c5-86b3-924ff46cdaad	t	Bereshi	c4bdda45-312a-4be4-8b4a-ecf42b6dead2
3b2493dd-313d-4f38-b23f-44db26c43c32	t	Kasumo	c4bdda45-312a-4be4-8b4a-ecf42b6dead2
734ba53e-f578-4205-a7c1-a0de63fb2a6b	t	Busoro	d743704c-ad64-4d5f-ad7c-8910a36bc0e2
0cc9ba26-af57-41c8-845a-55893184c274	t	Nyagisozi	d743704c-ad64-4d5f-ad7c-8910a36bc0e2
b142043a-3451-4dfb-8a0a-ef3d616f51b8	t	Barama	2c18cce9-3e82-4129-8366-92bce146cb11
52e8d6ce-2f2f-467c-8625-970db89ffa7d	t	Gitega	c72a5926-a197-454c-a425-f52f84d74c1a
94c16b5e-634c-4e6c-8817-f30dd7d756c4	t	Ruhurura	6578bd06-ff58-46e7-a454-215f1c80c525
0368f77f-0587-4a2c-b0ea-c4bed334b17e	t	Nyakibande	8a73742a-b866-4822-a940-b9815007a6ad
02f8f605-fdde-4392-a913-90511c6efb85	t	Rwamiko	8a73742a-b866-4822-a940-b9815007a6ad
0624243a-c113-4c33-ad28-674df787b7dc	t	Bugarura	3bf3a136-b285-4559-ac78-66b5eeaf73df
036095bd-faf6-4d1f-83c9-ea24ec7a8d77	t	Burorero	3bf3a136-b285-4559-ac78-66b5eeaf73df
1b4cd58c-6fe1-4c57-bd8e-b62fe92980be	t	Ngando	3bf3a136-b285-4559-ac78-66b5eeaf73df
edf202a5-2433-4983-a3bc-341798e60fde	t	Nkongora	3bf3a136-b285-4559-ac78-66b5eeaf73df
fcf5640b-7794-4f24-9447-43d067c7e1fe	t	Gasiza	14c34249-e0a3-41c9-baf5-c33cc1dbc946
391eddc2-f52f-44d3-98d9-01c5bb826272	t	Kabeza	14c34249-e0a3-41c9-baf5-c33cc1dbc946
963c67f8-c79d-44a9-a37c-e64dc4beb9a4	t	Kigina	14c34249-e0a3-41c9-baf5-c33cc1dbc946
24011f81-94fc-41fc-8c0f-65a2df4574d6	t	Rwantobotobo	14c34249-e0a3-41c9-baf5-c33cc1dbc946
b2694c33-9249-4e52-b87d-dcf109c23814	t	Byerezo	52f239c8-bb26-457a-8336-eca97f44ce22
f02b90b0-c0a5-4a9d-b041-5f1d8aa2338e	t	Kagano	52f239c8-bb26-457a-8336-eca97f44ce22
3ff4ec64-8940-4210-99a0-e24afe160a28	t	Kazuba	52f239c8-bb26-457a-8336-eca97f44ce22
d99267d1-7b3b-4d68-806e-f3340e35e1c9	t	Rubaya	52f239c8-bb26-457a-8336-eca97f44ce22
93f1cba3-8f0b-4c55-83d5-96c81bcbb150	t	Gisebeya	2dba63d0-79db-4bc8-8fe6-c1470d1cfc10
28cb0b86-b595-410b-ad2a-55e310de61ef	t	Gisiza	2dba63d0-79db-4bc8-8fe6-c1470d1cfc10
85067a1c-b108-454d-a83c-84f65aaae1f1	t	Gisunzu	2dba63d0-79db-4bc8-8fe6-c1470d1cfc10
d03b86f5-4eb6-490a-8598-237b8c9ba37d	t	Misemburo	2dba63d0-79db-4bc8-8fe6-c1470d1cfc10
068d63e0-251f-40bf-be3a-98c6200acb32	t	Gacaca	119cd1f5-49c1-4129-9de0-b75639a77f20
bed0d1da-34b3-411d-8b88-4098c9c81758	t	Ntendure	119cd1f5-49c1-4129-9de0-b75639a77f20
a68b1752-86c7-48b2-a333-3ab324e6a640	t	Ruganda	119cd1f5-49c1-4129-9de0-b75639a77f20
9a899962-4317-4b3f-ab58-bed20b5b5c8c	t	Bambiro	bd6f4c49-22aa-44df-96cb-603ac948f660
87677826-5bb1-4867-a443-876330ceb10d	t	Nyamutoni	bd6f4c49-22aa-44df-96cb-603ac948f660
ad4e10b9-11fc-475c-83f2-895efd792a6d	t	Nyanshundura	bd6f4c49-22aa-44df-96cb-603ac948f660
a7c6a8e3-5bd3-4a0b-93ee-7624b4c18a74	t	Rukondo	bd6f4c49-22aa-44df-96cb-603ac948f660
3b25b9fc-b2e4-4330-b4cd-5ff91f7f6c28	t	Burengo	151c928a-db56-41e1-92ea-c6c31fe94986
18f584b0-a63d-4715-8400-e180ea09f305	t	Gashonyi	151c928a-db56-41e1-92ea-c6c31fe94986
becc6f4e-0799-4aee-a9d0-28947465f741	t	Mitsimbi	151c928a-db56-41e1-92ea-c6c31fe94986
57dc5ed5-c4b0-47b2-ad8f-9e4e3c39397d	t	Nyabigogoro	151c928a-db56-41e1-92ea-c6c31fe94986
e68cab33-c510-44aa-ac86-f36305990a68	t	Nyamirama	151c928a-db56-41e1-92ea-c6c31fe94986
8372fa59-2ccc-47a7-b06b-bec2cd7530ea	t	Kibingo	8d133c7b-cf60-42d9-be45-53916a8a7ca5
726487ae-26cd-4d5d-b8ab-29d3a91c2916	t	Buhiro	df815002-5463-4ab9-862b-030b9626971d
7c475c19-1110-4231-8464-0a7fdd0e8968	t	Gapfura	df815002-5463-4ab9-862b-030b9626971d
3f28e0d1-a441-474c-be09-76db6f3f351f	t	Kagunga	df815002-5463-4ab9-862b-030b9626971d
8e69b382-fe90-48ec-80d5-25bea563c3af	t	Ryabadanga	df815002-5463-4ab9-862b-030b9626971d
3bca751d-5e22-46e9-a023-1e1d63256060	t	Kansi	4b09a7b5-505a-42df-9b85-366eb9cd8525
56e462ee-e45d-4adb-a43c-21e83986bcce	t	Kavumu	82cda267-5c24-490b-ac65-95b6ee8772b5
1dc07b08-d1e1-49de-b2ee-b37c1378e15a	t	Kibuga	82cda267-5c24-490b-ac65-95b6ee8772b5
30014559-7890-46e1-811f-b8c48218d8e0	t	Kamuyobora	082ec884-1275-433d-9b97-bc0218dc6cc1
02e0b218-c9d1-44b4-b00c-a6a018ce0af5	t	Ngugu	082ec884-1275-433d-9b97-bc0218dc6cc1
ff58c2c8-c800-47e5-825d-b864411bfaf5	t	Rwamikeri	082ec884-1275-433d-9b97-bc0218dc6cc1
048e38a2-364b-441b-8511-09a8e639fcb0	t	Ruhanga	725e3ddf-13ae-453a-aad1-57b62330252c
78450d16-dfa8-4b3c-8900-68b009fdb9ae	t	Kideberi	d3a04cad-da6f-498a-9099-158a4dc3924e
fd98322d-f051-4417-aaf2-6af46d6924cb	t	Kimirehe	d3a04cad-da6f-498a-9099-158a4dc3924e
b94e24aa-0b01-4134-adc6-148a437598da	t	Rutambiro	d3a04cad-da6f-498a-9099-158a4dc3924e
046e5856-88d3-461a-8947-e2b3576d9201	t	Rusebeya	c344a5c5-2be1-4b22-a489-403dbf9213de
f679b973-9081-4589-b391-4850198940c9	t	Cyandago	61085cee-c2af-4675-a1d5-5a43ba49bb3a
0596e05b-0850-495c-b202-bb8fcbd2a473	t	Gatare	61085cee-c2af-4675-a1d5-5a43ba49bb3a
e16d1823-55d3-4603-a6a7-2f5ff47d3a26	t	Kabeza	61085cee-c2af-4675-a1d5-5a43ba49bb3a
050ba4fc-6831-4e5e-a2a4-dc9f4375b2d8	t	Kabusunzu	61085cee-c2af-4675-a1d5-5a43ba49bb3a
817deb25-84ea-4953-b1c5-fde53073cb0f	t	Kanyinya	61085cee-c2af-4675-a1d5-5a43ba49bb3a
0a8f7e1a-8e8d-4b74-aba8-2e82a9e77ffb	t	Nyamabuye	61085cee-c2af-4675-a1d5-5a43ba49bb3a
78f71b96-5003-498b-bdb1-68cfc5b6e954	t	Butezi	4dd5732a-2ca5-4dbc-bbc1-92bd37fd63c0
294a211f-8d87-4c02-a741-a9119d7dfcd0	t	Cyansi	4dd5732a-2ca5-4dbc-bbc1-92bd37fd63c0
0ef0c3af-055c-4f5a-92b2-e3c0d860e75c	t	Ngororero	4dd5732a-2ca5-4dbc-bbc1-92bd37fd63c0
97802804-84c8-4169-b690-f9125ddd7d1f	t	Kabuga	c200aff1-250c-4080-9ec1-16454b9ff05c
715bec62-4aa8-49ed-97e6-94c050c70084	t	Mpara	c200aff1-250c-4080-9ec1-16454b9ff05c
cb6cd4a9-d77e-4668-8a1e-1c81c67efed8	t	Cyumba	abd2f9e6-0212-45c2-bcf4-41118a35c95a
403442ea-41aa-4bc0-9b6d-6841cad2dde2	t	Kabagari	abd2f9e6-0212-45c2-bcf4-41118a35c95a
45f1b9c5-57a3-46e8-993d-b2fa683584b2	t	Rukaragata	abd2f9e6-0212-45c2-bcf4-41118a35c95a
0fa132f4-dc53-43cd-8551-77162462070a	t	Rususa	abd2f9e6-0212-45c2-bcf4-41118a35c95a
49737464-241e-4157-84b4-df5474c5c714	t	Nyakariba	f4e10f90-a5ab-4ab7-bdae-d8edd2ef428c
f12cd2ba-5400-405f-bb78-fdca07ae8219	t	Gakoma	a611f7d4-3419-44ce-bbbd-ec1b200e2cb7
ba7288c6-f84c-46a9-af0e-3790b98663b0	t	Birambo	429f4142-bc17-4967-9f07-cc2840c149a0
968b484a-32c7-49b3-b1f3-2e87c462f772	t	Dutwe	429f4142-bc17-4967-9f07-cc2840c149a0
05906c32-e3af-4983-a61c-7864808414a8	t	Gaseke	429f4142-bc17-4967-9f07-cc2840c149a0
1125d721-59e2-4c11-8e1f-0be420cdd97c	t	Giko	429f4142-bc17-4967-9f07-cc2840c149a0
415859f5-0dfe-4115-bba4-5e650d0a1c5b	t	Ngobagoba	429f4142-bc17-4967-9f07-cc2840c149a0
5d5aba0a-0557-4724-aaae-43574f4dd0e2	t	Cyambogo	78809bf0-3494-4666-8df0-3df921b391cd
adb9bbe4-7460-497e-b404-2fc38c9ae14a	t	Muganza	78809bf0-3494-4666-8df0-3df921b391cd
76a8c2df-14ac-4ad9-9ef0-74b7b01b85bd	t	Murambi	78809bf0-3494-4666-8df0-3df921b391cd
6850cb4c-1960-4ae4-a7d6-412055e9573b	t	Nyange	78809bf0-3494-4666-8df0-3df921b391cd
efeb7c47-5e93-4def-9ec0-6e083a1771b8	t	Nyarusange	78809bf0-3494-4666-8df0-3df921b391cd
b657c825-b0e0-481d-80b4-22491d5a93a8	t	Vungu	78809bf0-3494-4666-8df0-3df921b391cd
725da674-5b9d-4dc3-a573-864f3340733e	t	Zegenya	78809bf0-3494-4666-8df0-3df921b391cd
e584da01-0fd0-4475-ad11-692afa77f85b	t	Karambo	26ea2ced-0d1e-4fc6-9d89-dbed10ae64b4
af1d2d47-7668-41ec-a713-d678218ca8bd	t	Nyagatama	26ea2ced-0d1e-4fc6-9d89-dbed10ae64b4
11fbf7d5-b170-447c-ba4e-e13d9ddc646a	t	Nyamyungo	26ea2ced-0d1e-4fc6-9d89-dbed10ae64b4
ae31bb17-d86d-4d38-9f01-f7fbfb03f1a3	t	Kabayengo	3870e813-8e90-4bd0-8c92-74eea083a969
b751b34f-52ef-4689-9e8a-8decb55c0b8b	t	Nshano	3870e813-8e90-4bd0-8c92-74eea083a969
76ade5d0-d3fb-472d-872d-615061927a70	t	Ndagarago	f531462b-6e66-40ba-90ca-ffb079784521
91b024ed-c446-460a-b57d-65491632d14d	t	Nyamuza	f531462b-6e66-40ba-90ca-ffb079784521
6613e928-20da-426d-b847-f76452b4381c	t	Butenga	c503f200-767e-4bc1-bd65-0454d703adad
a1bda175-2a28-4730-b689-71e8381216e1	t	Gatare	c503f200-767e-4bc1-bd65-0454d703adad
4edac117-8a86-4f89-b4fe-7edd3db801fa	t	Migendezo	c503f200-767e-4bc1-bd65-0454d703adad
70a197e1-990e-44b0-bee4-8bf9a0cfe601	t	Nyirabwina	c503f200-767e-4bc1-bd65-0454d703adad
053204f8-50b6-4c9e-8e4b-84fccc3e1944	t	Arusha	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
171d14d4-3d58-4a18-a45b-57a9fdff8394	t	Bukinanyana	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
8c299032-6552-4f6f-b2e4-ed3759d19f72	t	Busasamana	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
55db88c2-2ed1-4b1e-bb86-90ec103ca7a6	t	Ngamba	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
1b191e06-be75-483c-a1a5-3dc48c071192	t	Ngandu	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
adce87c7-613c-4c00-bebf-a66781d208ea	t	Nyabishungur	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
a240242c-0c8e-430a-94c5-a3cd98002f66	t	Nyagihinga	e55ea82d-75d5-44c0-9b3a-28ebfcb4a59d
ad637f02-bd9a-4c43-b76a-bf37c4c9d4fa	t	Gasizi	09195c52-e93e-4899-975e-5aa10f4afaad
76b69a84-425d-4581-806b-496d64fc9ddf	t	Giticyinyoni	09195c52-e93e-4899-975e-5aa10f4afaad
4a3c5490-48f9-44f8-b169-883c30e2f180	t	Ngando	09195c52-e93e-4899-975e-5aa10f4afaad
e2ad6906-18a9-4662-b323-ae43d97111f6	t	Vuga	09195c52-e93e-4899-975e-5aa10f4afaad
f74fb147-370d-40d6-94ec-ee55d593c1fe	t	Kazuba	66c12866-1b54-426d-9b7e-83372b3cbc26
86df2d17-a544-4368-8f1c-8b2b77c455f8	t	Kijote	66c12866-1b54-426d-9b7e-83372b3cbc26
b841656c-abf9-4d58-b2d6-559283ef2965	t	Kabatezi	3d8502a8-ceef-416f-83c7-8ee3cbb9cc40
ec9baa7c-bac4-41c3-946e-e41e5eb6a3d0	t	Kabuga	3d8502a8-ceef-416f-83c7-8ee3cbb9cc40
ab503ed1-b1eb-4238-b0a9-43b1d89bb5b3	t	Kageli	3d8502a8-ceef-416f-83c7-8ee3cbb9cc40
853bc4a1-8db6-43be-a6f0-302b4ad27c41	t	Ruhinga	3d8502a8-ceef-416f-83c7-8ee3cbb9cc40
ba69c907-5d4f-4e54-9cd5-499ce195d473	t	Rukore	3d8502a8-ceef-416f-83c7-8ee3cbb9cc40
1c3f8d5a-7dbd-4063-854f-ebf9006e304f	t	Rwankuba	3d8502a8-ceef-416f-83c7-8ee3cbb9cc40
75622ac0-ebbd-486f-a6d4-83945f4dcde8	t	Bihangara	1ace4911-a002-4f9b-9582-24f7bb56e351
f3cbdc49-a4bb-41d4-8830-c23064cff437	t	Kagano	46bcb3b1-5069-454d-a3a9-3ed46d2d0804
de1492af-880c-4351-b090-6687b0588d2a	t	Kariyeri	46bcb3b1-5069-454d-a3a9-3ed46d2d0804
0dee63fa-548b-46f3-a3af-ffa6d1dd4a9a	t	Kinamba	46bcb3b1-5069-454d-a3a9-3ed46d2d0804
f56f7622-8347-4252-abfe-eb5800b2812c	t	Mizingo	46bcb3b1-5069-454d-a3a9-3ed46d2d0804
cbe98c4f-8805-466f-9892-3a3542f89625	t	Ngangare	46bcb3b1-5069-454d-a3a9-3ed46d2d0804
0047cb75-e132-48dd-94a2-1a3f7111a7a4	t	Nyagafumber	46bcb3b1-5069-454d-a3a9-3ed46d2d0804
d4e4c7e7-d950-4f71-8a34-51a4fc8a7ae4	t	Bibanza	e9c6fb70-46c4-4a9e-b5ed-628075973d2e
dd5d5532-b191-4a69-8f85-e32eddd3ffa0	t	Bukinanyana	e9c6fb70-46c4-4a9e-b5ed-628075973d2e
a33d1099-f2f0-450e-a8df-f43f6fdeb82e	t	Kageri	e9c6fb70-46c4-4a9e-b5ed-628075973d2e
0d3a9714-fa8c-4d3b-911a-0db48f82fd25	t	Karuhirwa	e9c6fb70-46c4-4a9e-b5ed-628075973d2e
a48ff1e2-783e-40de-b7a1-fb858367178a	t	Kibaya	e9c6fb70-46c4-4a9e-b5ed-628075973d2e
a8395c48-78b8-4dde-94e1-298975bb3561	t	Nsakira	e9c6fb70-46c4-4a9e-b5ed-628075973d2e
42992f25-853f-46ed-8a31-aee6b1af02d4	t	Kagano	afaba8d8-1be5-4209-a484-d277fe15f126
4e136d7f-c45b-4db4-8511-26820da9327c	t	Kanyaru	afaba8d8-1be5-4209-a484-d277fe15f126
37a93d78-4995-4d85-9d04-625c68812963	t	Kinyengagi	afaba8d8-1be5-4209-a484-d277fe15f126
d9c2b805-3c1d-4d09-865a-9bf3a951ef44	t	Mikingo	afaba8d8-1be5-4209-a484-d277fe15f126
ad993cf7-11fc-4db7-b44f-fb81b0df76d4	t	Rwanamiza	afaba8d8-1be5-4209-a484-d277fe15f126
96b1bed4-0568-488c-9374-bdbd897b93ec	t	Gitambuko	9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a
f19e2482-2907-4eb9-96fb-3bca721b17e8	t	Kagaga	9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a
32aa01e7-e765-4bba-9d2c-09c125f5a832	t	Matara	9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a
872f3264-a486-4363-b49c-4629bbc6b9b5	t	Musumba	9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a
69967f46-4084-439a-b651-806b48f97f38	t	Ndorwa	9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a
f225785f-6078-4652-9996-cbe5315cec99	t	Runyanja	9058f6a4-0a19-4f9d-a83e-ada1d0c6cc0a
03072af3-05d2-450a-98c0-077f2d581d3e	t	Kareba	b7338785-b926-4b7d-b5d6-c5e54d3aba1f
c6a8bfe5-d383-450c-baab-9fffb05af93b	t	Jenda	f00c236b-5bf3-4f8d-b224-860f065e1b0d
d9a07f49-31b0-4477-8599-72cffaa28454	t	Nteranya	f00c236b-5bf3-4f8d-b224-860f065e1b0d
282fa87c-c7a0-42df-90da-39c78baf7b99	t	Rushunguru	f00c236b-5bf3-4f8d-b224-860f065e1b0d
ffee7e66-a867-4cd8-a7ec-44795f7819ef	t	Bihinga	d0e8ea9b-6d85-4939-8b25-471d5c41a3fa
7af7bef4-65b1-44c3-97b1-de8131ecd881	t	Gakarara	d0e8ea9b-6d85-4939-8b25-471d5c41a3fa
7bb6765c-2271-45ec-bee2-e7a87dc480a7	t	Kajebeshi	d0e8ea9b-6d85-4939-8b25-471d5c41a3fa
d94eb396-6734-40b6-964a-8db0f0f23a80	t	Rega	d0e8ea9b-6d85-4939-8b25-471d5c41a3fa
adde5916-e293-446c-879c-d97841374e5f	t	Terimbere	d0e8ea9b-6d85-4939-8b25-471d5c41a3fa
3b1d39f7-56ad-4434-a004-4ea3b5cb2b1a	t	Kanama	6a3c53c2-08cd-4f73-8436-f7bb300aaff8
97b5f1da-ebe2-46b2-ae8a-2f9e8cda4a26	t	Nyundo	6a3c53c2-08cd-4f73-8436-f7bb300aaff8
71b07007-6a0b-4028-8910-0772020839a8	t	Gasura	3e32a6ef-8242-4838-bee3-8a7419697cae
e2a58e56-df90-48c2-947b-3d0301bbb78e	t	Gisoro	3e32a6ef-8242-4838-bee3-8a7419697cae
8a4bc1b2-d496-48c4-8a75-880c46d86b5a	t	Kagano	3e32a6ef-8242-4838-bee3-8a7419697cae
1fb348f1-15ce-4653-82fa-f29023de04a7	t	Ryabirumba	3e32a6ef-8242-4838-bee3-8a7419697cae
ad6b9157-265c-476f-b786-bdeb346b8ae2	t	Futi	1307ea79-72eb-4ffb-84f1-f454316ce25b
9bad5281-a724-4ae1-8f4f-4cafb6506ba7	t	Gikaranka	1307ea79-72eb-4ffb-84f1-f454316ce25b
f6abe880-2398-48f8-bbe7-44ae85e55e54	t	Gisizi	1307ea79-72eb-4ffb-84f1-f454316ce25b
b0d8798e-9bfb-49b3-a31d-5e5fee0eb311	t	Guriro	8231b467-06b0-4e4c-9748-76b5e95e8e20
95647856-0c91-45be-b106-e7eee90fe788	t	Misegwibiri	8231b467-06b0-4e4c-9748-76b5e95e8e20
7e0b702a-3c9f-4ba8-b759-851a1beeace9	t	Ngabo	8231b467-06b0-4e4c-9748-76b5e95e8e20
d574153b-be58-43ce-bba7-bc12b7e42f61	t	Nyarusongati	8231b467-06b0-4e4c-9748-76b5e95e8e20
458639ff-4b6f-46cb-900e-ebebbd3f830f	t	Kavumu	a6aa448c-7ad3-465f-91c6-3848c5cce7d7
3f347b18-7ab1-47f5-a4f5-8299fef65ace	t	Munyege	a6aa448c-7ad3-465f-91c6-3848c5cce7d7
cc4ff23c-bd0a-4cda-b4f0-802f604a9f73	t	Rugerero	a6aa448c-7ad3-465f-91c6-3848c5cce7d7
32bbbf5a-1f9d-4a5c-befc-ce7fd4b2f5d0	t	Bihinga	5014d489-4bab-4334-aabc-f5768e615a98
a803e79a-2332-46c5-accb-d350c62eeb76	t	Ntwaro	5014d489-4bab-4334-aabc-f5768e615a98
66229c46-b9a2-415c-a912-92a3920db939	t	Nyamitanzi	5014d489-4bab-4334-aabc-f5768e615a98
22cc7a8c-48e1-4e0a-bbb1-4e84d3fa664f	t	Rubavu	5014d489-4bab-4334-aabc-f5768e615a98
3b3332a6-07d9-4a0d-bf08-37148cdc7f9b	t	Rugera	5014d489-4bab-4334-aabc-f5768e615a98
ded04536-344e-40a1-aee3-ebbb24ba68d2	t	Rutabu	5014d489-4bab-4334-aabc-f5768e615a98
ad0a64cc-4ce4-42ce-8b5b-69402268fb39	t	Batikoti	97d7cbd6-5db2-4f9b-8bae-c8a6c807670e
69fce640-2218-4ac7-a79b-1b78bfdfa065	t	Kamuhe	97d7cbd6-5db2-4f9b-8bae-c8a6c807670e
f64f7da1-55cc-4924-a228-c73a829e841b	t	Rubare	97d7cbd6-5db2-4f9b-8bae-c8a6c807670e
3797bc31-dd9d-4c0d-963a-1b1bbc5bd082	t	Sake	97d7cbd6-5db2-4f9b-8bae-c8a6c807670e
46185939-9f10-4578-ba70-af19415691c1	t	Kabagabo	ecbc750c-2fe2-4ee1-bdea-bcbbdc453f4c
8005e1c2-b0d8-44e5-9b4f-cc12a6276980	t	Murambi	ecbc750c-2fe2-4ee1-bdea-bcbbdc453f4c
ec0ac9ea-f5b3-4f93-be04-0ab12b0938a7	t	Bisukiro	3021ce04-4d96-4056-b692-c157bdf98845
d8efa0c0-fbd2-4033-93dc-ccf6cae2a20d	t	Kaminuza	3021ce04-4d96-4056-b692-c157bdf98845
1b9b76c1-98f7-42a4-a036-d72bdf70828c	t	Kinyababa	3021ce04-4d96-4056-b692-c157bdf98845
945bb64f-8edd-45ce-ab9c-fd07017b4389	t	Rushubi	3021ce04-4d96-4056-b692-c157bdf98845
ae52e47e-e4d5-4433-a685-42e497f8fb54	t	Akabeza	cc6a9658-fd3a-4197-806b-7721022effda
ee0a11d8-04c5-482f-9257-5233239b44b1	t	Akimitoni	cc6a9658-fd3a-4197-806b-7721022effda
716e1c05-9f52-4cd8-abeb-6c57e272ec14	t	Butaka	cc6a9658-fd3a-4197-806b-7721022effda
1cb2d07f-19a5-4d46-ba1e-58fb5774961a	t	Myuga	cc6a9658-fd3a-4197-806b-7721022effda
a0da97fa-8e0b-4580-b109-afd14a2666a5	t	Gaharawe	b98c6a2b-7fd9-4f15-b752-50d9a34ad43d
d24a656e-ce06-49d0-85b6-e6737a8dbbb7	t	Kiramira	b98c6a2b-7fd9-4f15-b752-50d9a34ad43d
71268100-9501-4f83-abc0-b7eaa4dff55a	t	Ruhango	b98c6a2b-7fd9-4f15-b752-50d9a34ad43d
29013dc6-1666-4b85-bd5c-d6c709e86414	t	Karambi	956510bc-d77d-4a58-96a2-e8c63c57ba89
40a795fe-fa4d-44da-95bf-640f0ca2b51b	t	Kinkware	956510bc-d77d-4a58-96a2-e8c63c57ba89
4ab0880f-50b5-46b5-ba31-d1daec628a41	t	Masasa	956510bc-d77d-4a58-96a2-e8c63c57ba89
6fc4de11-2508-4771-8396-bb3760c6df38	t	Remera	956510bc-d77d-4a58-96a2-e8c63c57ba89
04033452-3a29-4964-aacf-5632a9888579	t	Nanga	f986f9d2-6504-413d-9989-f03e882e6cdb
a3f38493-2b2e-4c3d-b560-134fcb711dd0	t	Nyagasozi	7aab640c-83a4-442d-815a-056aaf9887c4
471e6b43-0e12-4d64-927c-2a9f24e5c570	t	Mwiyanike	7d181aa0-978d-43e7-b3b0-a8012531cdc5
c830ada4-d10c-466a-b011-984ae9645b4b	t	Gatovu Centre	b5d4f782-e0d2-4842-a10b-b6fe1be0bd25
2f86223b-98c1-4921-bf11-abd153e1d9d1	t	Kankima	c4617898-0c91-4eae-b245-fa08693d04f0
f8c0a5d7-8f55-410a-afaf-c035b5b1d27a	t	Sasangabo	cc58f016-2592-407d-a993-2426ada81edc
2b0e9aaa-5b90-4caa-872a-4b1037a69807	t	Butondwe	84f95ff9-da30-4903-b5f2-cdb6d73418c3
9e3477c7-d21c-40d1-9e5c-139b80bd619c	t	Gisenyi	84f95ff9-da30-4903-b5f2-cdb6d73418c3
55f178ad-5059-4da6-bc1e-104eb25feb50	t	Hesha	84f95ff9-da30-4903-b5f2-cdb6d73418c3
f33a52e9-0f50-4eda-b4f1-70c3cc219f0d	t	Nyirabasheny	84f95ff9-da30-4903-b5f2-cdb6d73418c3
66bb370d-336b-4864-9f13-612201fed7ae	t	Rwanyirangen	84f95ff9-da30-4903-b5f2-cdb6d73418c3
89da08bd-4d57-443d-9aa6-5d780b5981ad	t	Kabere	62075b20-1173-4a3b-bd24-206d0e6fdac3
2e9cd600-7b03-4770-b130-757e386f2a43	t	Kanyove	62075b20-1173-4a3b-bd24-206d0e6fdac3
e6d19ffe-6cfd-437f-a2b4-ca3f1a5da35f	t	Cyivugiza	525c1177-dd35-4037-8856-489acb0e1f75
24b0c8e2-a632-4915-84cb-d712e28b2c0a	t	Kaburende	525c1177-dd35-4037-8856-489acb0e1f75
7c1273d3-c7c8-47f7-abf6-69eba1fe309f	t	Karandaryi	525c1177-dd35-4037-8856-489acb0e1f75
32f7ac8c-49e9-45f1-8ee8-9bc8e005319e	t	Cyinkenke	14bd2e2b-0a22-472c-b2e2-1c2ff61c73a6
ba2329c6-c524-414b-96a1-4f55e51fe25e	t	Kamenyo	14bd2e2b-0a22-472c-b2e2-1c2ff61c73a6
561316f0-9c52-4e75-bddb-5d5fd5294503	t	Karama	14bd2e2b-0a22-472c-b2e2-1c2ff61c73a6
6ea344d3-9b3f-4a3d-84bc-94d58e9f5771	t	Kazibake	14bd2e2b-0a22-472c-b2e2-1c2ff61c73a6
02e3a3a5-2f50-472f-bd1e-9492a0421ecf	t	Kazuba	14bd2e2b-0a22-472c-b2e2-1c2ff61c73a6
8c07f538-ff4e-4e14-9747-93dca6d325f0	t	Rutovu	fd66c513-4962-492c-b0d9-6f5e22f9497a
8f51ac44-3ac6-4381-b155-af84198f6080	t	Rwankeri	fd66c513-4962-492c-b0d9-6f5e22f9497a
03f32d80-c06c-406d-a734-2a01d09dd66b	t	Kinihira	2803ef1c-a57a-4c98-bc04-bb9fc9153bfb
8139d706-3f3c-458a-ab1f-58deeb63fcd1	t	Munini	2803ef1c-a57a-4c98-bc04-bb9fc9153bfb
ebaf8ecc-a450-44b0-ac2f-567bc4a1cf7c	t	Bunywero	e26449e7-143c-4483-b4f6-8d304f0f452b
40b02814-8562-4cc3-b98e-d82572b8d232	t	Gakamba	e26449e7-143c-4483-b4f6-8d304f0f452b
7c4b66bc-2dbc-4402-8227-345d5a4effc9	t	Gora	e26449e7-143c-4483-b4f6-8d304f0f452b
97be5f7b-2f25-4b33-86ea-2e536fce44bd	t	Kivugiza	e26449e7-143c-4483-b4f6-8d304f0f452b
36d81f45-b0eb-4170-bf7c-2479f557816c	t	Migongo	e26449e7-143c-4483-b4f6-8d304f0f452b
6d4483db-5a21-4a7e-9850-a0cb78522741	t	Rurambo	e26449e7-143c-4483-b4f6-8d304f0f452b
787235a0-bec4-41de-8b60-4b0f51639be8	t	Mucundebo	778d61f7-4933-4c6a-94e5-6f43584c1286
e0541205-79ea-424a-9893-be3d7a05dc54	t	Musaraba	778d61f7-4933-4c6a-94e5-6f43584c1286
e49b3c12-fa66-4fa2-9cd3-ef3fcef631da	t	Ryanyirandab	778d61f7-4933-4c6a-94e5-6f43584c1286
f53a23ee-e5fc-4914-84f6-20e404cc8d77	t	Kamajanga	a68a0b5a-215d-43d2-98a1-f4f26cc37286
e5282c79-65fc-4aa3-92ae-f5ef45e7917e	t	Kinaba	a68a0b5a-215d-43d2-98a1-f4f26cc37286
0f5dd68f-4aa1-4bea-b57c-dc82893639a0	t	Mabare	a68a0b5a-215d-43d2-98a1-f4f26cc37286
93e1d959-c2ac-423b-a1cf-3d5231032901	t	Muremure	a68a0b5a-215d-43d2-98a1-f4f26cc37286
da6c21cc-f5d1-4db4-b0d0-4398fcf86206	t	Bambiro	190de93e-84a5-4219-8fff-7c2bc726ad22
a5cc36c1-d608-43ed-9b8f-4e73bc8de570	t	Kanwiri	190de93e-84a5-4219-8fff-7c2bc726ad22
4c87b8a7-8771-4fcc-8927-c9e2fd458721	t	Muyange	190de93e-84a5-4219-8fff-7c2bc726ad22
5446fc98-a385-4e74-9ae3-c3ae4e468c5a	t	Nyamasheke	190de93e-84a5-4219-8fff-7c2bc726ad22
f49c3508-61b3-4424-b151-613893502626	t	Rubare	190de93e-84a5-4219-8fff-7c2bc726ad22
8007de18-fe63-4d19-85e4-a330c61a99f3	t	Gasura	d7ba3bf1-04ee-406d-8f00-10251b03d6e8
b321061f-2534-45d8-93d4-b5415ec13912	t	Karambi	d7ba3bf1-04ee-406d-8f00-10251b03d6e8
910da2c6-e230-463b-98ef-9faca13f3f12	t	Musenyi	d7ba3bf1-04ee-406d-8f00-10251b03d6e8
57e50f63-ff4a-4222-8598-675fe4050252	t	Rwandarugari	d7ba3bf1-04ee-406d-8f00-10251b03d6e8
51535610-3aa9-4378-9b83-5c8203795b61	t	Birembo	b4020caa-e837-408c-8408-8d983b9ee229
37139dfe-4096-4cdd-9a6f-dc0c8fd04ae0	t	Rugarambiro	b4020caa-e837-408c-8408-8d983b9ee229
9e0b6417-976e-4eed-8cc6-47fcc4161ef8	t	Kabeza	fdcd5a2d-c4aa-4b09-8531-177d80009d60
ea6d36b1-3464-4468-8bfa-abc0c8b5d962	t	Rwenzo	fdcd5a2d-c4aa-4b09-8531-177d80009d60
37e72fe9-8463-4ae1-8a98-7458d8e66450	t	Bukinanyana	7c43c6a1-ff30-4d40-b631-a10700d69bd1
6e0195ef-fc5d-4813-97d7-2f4acfaa7e18	t	Rusekera	7c43c6a1-ff30-4d40-b631-a10700d69bd1
bedf9344-b77f-4830-ade2-65f174b4a5d3	t	Gasiza	cddbd9ac-bb77-42e3-a049-de14a66543e7
55676370-4056-4732-932c-9665493d8adf	t	Kamifuho	cddbd9ac-bb77-42e3-a049-de14a66543e7
c857b75e-3ecb-4cf9-afee-42ace76ee4da	t	Myumba	cddbd9ac-bb77-42e3-a049-de14a66543e7
14c1be33-8451-4f3a-812d-376f4c8ddd83	t	Nama	cddbd9ac-bb77-42e3-a049-de14a66543e7
39fbfa63-377f-48c9-9f9f-30d886e4e0a5	t	Nyempanika	cddbd9ac-bb77-42e3-a049-de14a66543e7
f5cc3aa4-c68c-4598-812a-97840399121f	t	Rwinkingi	cddbd9ac-bb77-42e3-a049-de14a66543e7
93c956a8-ebb6-4193-966f-89a7940cb1b2	t	Giharo	f9bf8395-74ff-4868-a2d2-64000d647f48
7a21f0ea-352e-49ba-8a4e-1e7b1708c50d	t	Kamiro	f9bf8395-74ff-4868-a2d2-64000d647f48
877e4c19-9472-4687-bd32-bbe82efe17a8	t	Kibumbiro	f9bf8395-74ff-4868-a2d2-64000d647f48
247504fb-9c41-49a6-85d0-3747e0a3bff1	t	Muturagara	f9bf8395-74ff-4868-a2d2-64000d647f48
0c8a3b36-7d0c-4b32-aee4-a7327fe32a34	t	Muturirwa	f9bf8395-74ff-4868-a2d2-64000d647f48
7f5c16e1-f75f-450e-8764-66bf1da62b7b	t	Nkomane	f9bf8395-74ff-4868-a2d2-64000d647f48
d6d05b19-c0c2-44a9-bda0-af7950f3eee2	t	Mubuga	bbf64ad3-5321-4b0e-81fb-dd407b01880a
d055b211-3be9-491e-8674-ae939584693a	t	Nyakigezi	bbf64ad3-5321-4b0e-81fb-dd407b01880a
f4718bb6-77e3-4485-ac0b-9230065a859b	t	Gitotsi	bb56328f-334b-49ae-9e91-ee1f79c36623
fae1209e-e4a6-43dc-af38-f17dd16cb431	t	Muhare	bb56328f-334b-49ae-9e91-ee1f79c36623
622796af-8287-45ea-be10-50672656b974	t	Musenyi	bb56328f-334b-49ae-9e91-ee1f79c36623
bbcfc340-9f1a-44e4-ac13-1ba7bd28a503	t	Mwambi	c39f53e9-55b1-4eda-8372-ddf5dd4a130d
7d726edb-f161-47e7-9788-198f0faeb7e4	t	Cyasenge	a60f65af-26d0-4240-8c48-f9cea24521af
a3dbf59e-09f1-4493-8eda-ff7b0543a999	t	Gahama	a60f65af-26d0-4240-8c48-f9cea24521af
3bb03093-9b6b-4811-8401-c7a40dfc151f	t	Gihuri	a60f65af-26d0-4240-8c48-f9cea24521af
e615ad58-61df-492b-b888-914dfac53d7b	t	Karambi	a60f65af-26d0-4240-8c48-f9cea24521af
68f867cb-d699-447d-8701-de340efd9d3a	t	Nyakiriba	d88f2267-b483-4e64-9e05-a49d701ddcfc
9f09b477-9663-4d41-9c6f-647e90ba82dd	t	Cyanika	968918b5-12a3-42c8-8b9c-5531b3c9e1f9
a98a5847-b221-4a99-a399-e42daa01d050	t	Gitega	968918b5-12a3-42c8-8b9c-5531b3c9e1f9
a592aa11-0a54-447d-b186-73b75441173e	t	Bugeshi	df9417f7-9e3f-4950-90dd-76060e679717
997aef4a-5891-4d80-b5bc-a937d200ed29	t	Muremure	df9417f7-9e3f-4950-90dd-76060e679717
1ea422b1-c293-4ea9-bd38-bf0b840af364	t	Nemba	6f6481c3-2037-4092-8e57-b58de812dd2f
86518135-f9bc-470c-aea4-536294aa7eb6	t	Kabutozi	65b18c8e-b11b-415d-87dd-73f3033277a6
e9a7ad16-71ba-4ea1-88ee-845b1f22c830	t	Musenyi	65b18c8e-b11b-415d-87dd-73f3033277a6
b6a3f962-98c9-4034-9f6b-6f77e41aa6e6	t	Rwanika	65b18c8e-b11b-415d-87dd-73f3033277a6
7db52e22-33dd-497f-9687-a933bdad7008	t	Bihembe	d4777f70-5062-4f7f-9b4c-f67f5423be4f
6602c11c-5947-4fad-a8ed-9439770f8cce	t	Kabuga	d4777f70-5062-4f7f-9b4c-f67f5423be4f
dcf7dd21-bd62-4146-8ff6-b92bc85ed698	t	Mugwato	d4777f70-5062-4f7f-9b4c-f67f5423be4f
93ba7f86-1037-4e90-a501-0cda0b077509	t	Murikwa	d4777f70-5062-4f7f-9b4c-f67f5423be4f
df41032f-7d33-4c1e-b896-1dc2cdbc8437	t	Kamahoro	072ace67-cc9b-4d82-b1db-5c21cf5c9fe8
639954f7-8117-4fc8-badb-01b55357c6d0	t	Kazirankara	072ace67-cc9b-4d82-b1db-5c21cf5c9fe8
c33e9287-0cf4-403f-b64c-53e6232721a5	t	Kigabiro	072ace67-cc9b-4d82-b1db-5c21cf5c9fe8
cca02a15-0d7f-46a4-a714-24972d57468a	t	Kabagabo	f584b14d-eec1-45d7-85be-d4bbc16eb7e4
f653fb3f-57fc-425e-a216-ed91bca3231b	t	Kabuguzo	f584b14d-eec1-45d7-85be-d4bbc16eb7e4
24d2299f-3599-4e6e-b2a5-e3cb44e1c1c9	t	Munanira	f584b14d-eec1-45d7-85be-d4bbc16eb7e4
630eca9e-057a-43ba-872b-7daf67a10de6	t	Gacurabwenge	eeab64b3-02b8-424b-97fe-ed527ca2d5b4
78ea3d3f-2a36-4fe9-984e-2056902f0f6f	t	Kagongo	eeab64b3-02b8-424b-97fe-ed527ca2d5b4
012cf36c-c7cb-4f45-af32-bc4abdb39397	t	Mukaka	eeab64b3-02b8-424b-97fe-ed527ca2d5b4
b93a1bd9-c70c-49ea-9130-e1e7aacbacf0	t	Rwabahungu	eeab64b3-02b8-424b-97fe-ed527ca2d5b4
cc4e38b9-3f2d-4f4b-bd3a-ad29a0d599e7	t	Vunga	eeab64b3-02b8-424b-97fe-ed527ca2d5b4
722ef5c7-5e9b-4b45-9fc2-c6e5bac63efe	t	Kaziba	11fccd4f-58a1-4ffb-83c6-bc301ecfca65
54ffad16-80e0-4bfc-abbd-5cddb1332c69	t	Gitega	c97f7418-ca85-4a12-9d60-b9e185c2e07f
927f5f26-638b-41e0-8596-3c7acd727287	t	Kabuga	c97f7418-ca85-4a12-9d60-b9e185c2e07f
db45bad2-705d-4cac-95e6-46820e44d4eb	t	Kiyovu	c97f7418-ca85-4a12-9d60-b9e185c2e07f
01964891-b453-4795-81e3-706ba9a6256b	t	Rutoyi	c97f7418-ca85-4a12-9d60-b9e185c2e07f
bd8d0903-2fa2-46e2-a120-073fcf3f3b34	t	Buhinga	18caf7ce-0340-44cc-9b40-52da6c0dce9c
ac559a01-7997-4b05-ac29-73442475af86	t	Bushekeri	18caf7ce-0340-44cc-9b40-52da6c0dce9c
353bc17b-86b1-422d-9510-2eda93804833	t	Gasebeya	18caf7ce-0340-44cc-9b40-52da6c0dce9c
f75bbeed-036a-416e-bf0e-c17e11190fa6	t	Mujabagiro	18caf7ce-0340-44cc-9b40-52da6c0dce9c
57ab9b30-a20f-4ee8-ab8b-c0e4fa474998	t	Ruvumbu	18caf7ce-0340-44cc-9b40-52da6c0dce9c
3f298d5f-cf4d-4c39-8bad-2ceba2bf5a63	t	Rwumba	18caf7ce-0340-44cc-9b40-52da6c0dce9c
5ba0c15e-90ce-425b-8cdd-c229f191162d	t	Winkamba	18caf7ce-0340-44cc-9b40-52da6c0dce9c
9ff7af48-bb0c-488a-8801-c568c8c0fd8d	t	Kinini	af428a92-e1c3-4330-8efe-d151924a2a96
9b58dbc7-962d-4745-8e48-8ecdc3f8239e	t	Mubuga	af428a92-e1c3-4330-8efe-d151924a2a96
531491e6-99a8-406a-b837-1f217732797c	t	Nyanza	af428a92-e1c3-4330-8efe-d151924a2a96
273a015e-b768-45aa-9adb-167eb1930abf	t	Kamucyamo	c12e0d21-a493-4f5d-9608-bfdaf991265c
dd9f0725-9725-423d-8635-fa68718f5f16	t	Bushenge	059b8e06-ea4a-4299-a442-61ff1c4138b2
996c89c5-6e12-48c1-b82b-79f39067b077	t	Gashirabwoba	0cecdc62-51ae-4516-826f-cca62cf9b8a6
27b7972d-a349-45a3-9f4f-ddfeba6d04b2	t	Gatare	0cecdc62-51ae-4516-826f-cca62cf9b8a6
a5bef006-10f7-4c89-a13b-1c33801ce5ec	t	Kagatamu	0cecdc62-51ae-4516-826f-cca62cf9b8a6
a1b35728-ca10-4c9c-8529-a17972f0c290	t	Karusimbi	164d4398-2750-4183-b10e-4f4d75e29f6f
c20c6330-cbb6-46f3-b418-a886ddb51051	t	Rwumuyaga	164d4398-2750-4183-b10e-4f4d75e29f6f
986adfca-0df3-404a-884d-0c4992e9de3f	t	Cyato	1675e90b-c693-40f8-bbab-d7d7a3fd1cb0
99813ad7-a889-4fd9-920a-ca8605b82427	t	Kamonyi	1675e90b-c693-40f8-bbab-d7d7a3fd1cb0
d277ca6b-ffc9-4743-8e59-c61644034699	t	Muremure	1675e90b-c693-40f8-bbab-d7d7a3fd1cb0
0d052335-129b-4696-9f6d-35dff69697fd	t	Yove	024ffebd-47bf-4afa-b2b0-1ef6e23bd00d
afb8c87d-bf51-4adb-add6-1d274187bb5b	t	Mbogo	3d38ad78-b2c3-407c-9f12-4727120cd1fa
2028d803-1101-452a-8295-78e3529623f7	t	Rwatsi	3d38ad78-b2c3-407c-9f12-4727120cd1fa
28b5d901-1b76-4f79-9e34-f4ef2b87091a	t	Birehe	47dbd4c2-d250-4b45-a3c4-e7fa1c934aaf
dda57251-1ac6-428e-aa5b-5ae87240ad87	t	Kibirizi	0b569b31-ad00-498e-8b3a-8facef5a1e68
8b2709b8-3aa1-4cb7-8662-b24c6a8e4d25	t	Kigarama	c09aead7-a339-4250-af8d-fd366fdb76e5
2935cadf-06f9-4c33-976b-ab8137f1bdfc	t	Bungo	e0297f03-fc4f-4b35-8954-c89832506a6d
6e52d0c0-714b-4607-81aa-84a7fdaf0baf	t	Butembo	e0297f03-fc4f-4b35-8954-c89832506a6d
c8620441-275f-41a1-bb09-15997e9498bb	t	Mubuga	e0297f03-fc4f-4b35-8954-c89832506a6d
1865525e-2f0b-4bc3-89f8-7b5014e040fe	t	Muhavu	e0297f03-fc4f-4b35-8954-c89832506a6d
7f2fa78b-3902-4203-b212-4f617683950f	t	Ruhingo	e0297f03-fc4f-4b35-8954-c89832506a6d
63274131-2b48-49e4-a72a-b83aac012c2e	t	Gitwa	9d429d4a-6631-4119-a470-4e2307ca6935
8a4478c8-05c9-4d72-a18e-c5b0a3ba110c	t	Kazibira	9d429d4a-6631-4119-a470-4e2307ca6935
828d3d95-1ea9-4d04-8e91-d2089cdf4d26	t	Remera	9d429d4a-6631-4119-a470-4e2307ca6935
bcd8c236-27cb-4b90-a1fd-b5856b48fba4	t	Buhuru	7413afbc-856d-4875-ae32-f768c34e3526
b943630c-5be5-4db9-8f68-e1a9f7bcf46f	t	Rushondi	9d429d4a-6631-4119-a470-4e2307ca6935
f768089f-c049-42db-8602-cc57e8618e9b	t	Gikomero	80e3b37c-7925-450b-8b48-edf6740d2274
fca42fd7-a7c0-4213-a217-d3da65eea5fb	t	Kabagabo	80e3b37c-7925-450b-8b48-edf6740d2274
5fe7617b-af0c-4a11-a5ca-58f4b3a4fdb4	t	Gikuyu	e7ff6a11-b28d-499e-b4bc-a43c8fe22941
f954414d-39dd-43b0-8f82-19efe273795c	t	Kavune	e7ff6a11-b28d-499e-b4bc-a43c8fe22941
d2ea871d-cc96-488a-b2f4-e32dcb1e700f	t	Mujabagiro	e7ff6a11-b28d-499e-b4bc-a43c8fe22941
a430df56-b05a-4abb-8338-ff4a023f813f	t	Rugabano	e7ff6a11-b28d-499e-b4bc-a43c8fe22941
1a2ab6e1-658c-42f7-8eb8-24be9f416281	t	Kijibamba	cea6ad83-3072-4561-a18c-726e75cbe587
716e33be-284b-48d0-b317-ea330e3cf937	t	Kirehe	cea6ad83-3072-4561-a18c-726e75cbe587
b385bd1d-cabe-45f6-b2b6-318f8f2b1dd0	t	Rwesero	cea6ad83-3072-4561-a18c-726e75cbe587
75822dcc-70a5-406e-be1f-053a1745c3e7	t	Gahumba	a5e669c2-3abf-4f49-aae7-7fce58cd441e
f4ed2753-62ae-498f-9904-4d7aa6466418	t	Rambira	a5e669c2-3abf-4f49-aae7-7fce58cd441e
679b4462-0198-433f-b79a-da70000dcd5f	t	Bizenga	c050cf32-84c5-476c-86ce-7729a743ad40
65ea8394-7bf7-4cd1-97b8-5e944b0ce016	t	Gataba	c050cf32-84c5-476c-86ce-7729a743ad40
210f49df-ab17-42bd-9d78-e63ef6d4ed9e	t	Kabuyaga	c050cf32-84c5-476c-86ce-7729a743ad40
e380fa98-a114-4e2c-ad7b-6c4cb8504dbc	t	Kagarama	c050cf32-84c5-476c-86ce-7729a743ad40
3a2ac0a6-19b9-451f-a73b-6329920fcd79	t	Kivugiza	c050cf32-84c5-476c-86ce-7729a743ad40
d09d0c50-aebb-4911-b1e6-962571eb04b7	t	Maseka	c050cf32-84c5-476c-86ce-7729a743ad40
5f84e102-f6a5-4273-a745-8b6267da5a30	t	Nyarusange	c050cf32-84c5-476c-86ce-7729a743ad40
86b52171-ae5a-44da-aa0e-aac8087d3e7b	t	Rwakagaju	c050cf32-84c5-476c-86ce-7729a743ad40
d1b1310f-b2cd-41ba-82b5-07a482273e81	t	Gitwa	72c522dc-38aa-48f9-a45f-c71446a988c3
9f5a5970-eb8a-4d5a-b075-e438f6da03b2	t	Karambi	72c522dc-38aa-48f9-a45f-c71446a988c3
346a18f8-3932-4e0c-9c23-54311cb1e50b	t	Kigugu	cd8993bd-f510-4970-9dfc-f40ab2e6eda2
ec31c2e2-312c-4583-92a2-fcc80b225f37	t	Museke	cd8993bd-f510-4970-9dfc-f40ab2e6eda2
63196388-ec95-40e9-a65d-a150de73cf7b	t	Ruganzu	cd8993bd-f510-4970-9dfc-f40ab2e6eda2
593036c4-27a1-4b9e-9b36-f1dd7c8d96c6	t	Musasa	fff987fd-8349-4d9e-a0ae-17ff25d36811
4f217f13-4171-4e2a-bf6f-eec6c7f369ca	t	Gakenke	375b8d89-5797-4d11-a1bb-30a4f011aa82
25b5ee70-d495-4816-9b9e-37dd6eaa24ca	t	Kamuramira	375b8d89-5797-4d11-a1bb-30a4f011aa82
7fe2ca55-03f0-4075-970e-c58671af5fe4	t	Ruganda	375b8d89-5797-4d11-a1bb-30a4f011aa82
b3ac1e11-73d3-43e4-946c-5a9cd6280d8b	t	Bitare	76c1aaf6-781d-4624-98ca-317568e4a094
e2f91664-a773-41e1-a02d-47025575f541	t	Gikangaga	76c1aaf6-781d-4624-98ca-317568e4a094
6845c50e-0489-4aef-a14e-e9383dc81b73	t	Bugarama	7807fcbf-e00e-45f5-94c4-ed92ed56251b
2de5da3f-47e8-4f56-a4d2-4e5595ed936f	t	Gaseke	7807fcbf-e00e-45f5-94c4-ed92ed56251b
0a1c230f-9103-41ef-84b0-2a680dace9bb	t	Munini	7807fcbf-e00e-45f5-94c4-ed92ed56251b
0927ad45-802b-4db9-a25d-adbeaec7483b	t	Rugano	7807fcbf-e00e-45f5-94c4-ed92ed56251b
eb4a599a-4510-45c2-9f6a-452228e2d667	t	Gituntu	542c3015-b94e-419e-be29-2d38b5ed7e32
7846fc7f-d15f-4566-bb0e-9e37d449a15d	t	Misirimbo	542c3015-b94e-419e-be29-2d38b5ed7e32
fc9ae60b-067b-4617-b75a-0cf55c76d48c	t	Wibungo	542c3015-b94e-419e-be29-2d38b5ed7e32
4784319a-43e1-4f2f-a408-52851dda240d	t	Rubyiruko	fe1cd7bd-1829-4484-b168-d29163972227
118c6c90-7509-4b45-8e88-b327a51b5dc5	t	Rwunamuka	fe1cd7bd-1829-4484-b168-d29163972227
d4346e07-57d8-4e91-84cc-b5a698d31a3c	t	Tyazo	fe1cd7bd-1829-4484-b168-d29163972227
9d81afb4-8dca-4180-8779-49f3e4c66920	t	Gitwa	53e97db6-30b3-4cb9-b742-a10439940659
fe2ad30e-4c3d-41f6-81aa-88cc4ae614ea	t	Nyamugari	53e97db6-30b3-4cb9-b742-a10439940659
3fcdd688-4362-403f-8395-0b523f87901c	t	Nyamurira	53e97db6-30b3-4cb9-b742-a10439940659
ffb39c3a-de9e-45ab-bdc4-ed0807b1d5f8	t	Rubona	53e97db6-30b3-4cb9-b742-a10439940659
9fb7f77e-ca0f-4fd2-bc0a-ce74c198ff44	t	Kabuye	3a67df7e-173a-415b-8313-723b24a240a0
133dc117-c072-4436-a837-121b474e6432	t	Kanenge	3a67df7e-173a-415b-8313-723b24a240a0
967d5b1e-c96e-4937-9384-64cf8e6056c6	t	Karangiro	3a67df7e-173a-415b-8313-723b24a240a0
ecbbd31d-405a-4c73-8b7d-441053268ee2	t	Gitunda	7bb8185e-9c50-4422-aa9e-f086061932d5
aa2f4fba-7e5c-4215-9725-703197beccbf	t	Mpinga	7bb8185e-9c50-4422-aa9e-f086061932d5
0264f632-fd37-4afc-9e2b-ca8c4e22f03f	t	Muhora	7bb8185e-9c50-4422-aa9e-f086061932d5
504d1f60-1715-486d-8e65-8d73109ee229	t	Rukunguri	7bb8185e-9c50-4422-aa9e-f086061932d5
22847038-c5a3-4f18-b106-2c79dc115315	t	Kabisheshe	e20773b9-eed6-4000-a71a-2a87ad6c8785
5e355999-71dc-4a91-9caf-846dbf303012	t	Nyagisozi	e20773b9-eed6-4000-a71a-2a87ad6c8785
844d5dcc-467f-4f4b-bd32-602f092bc5bc	t	Gakeri	8c138796-debc-4ad6-96fb-f043eeab912a
3a973a09-6da9-4c5a-8a03-2a79b514c599	t	Nyagafunzo	8c138796-debc-4ad6-96fb-f043eeab912a
2b839970-2b52-4e37-b8fb-ed487fbbc832	t	Nyagashikura	8c138796-debc-4ad6-96fb-f043eeab912a
24d86520-4e8c-4ec6-a9cb-76fb1950153d	t	Katabaro	8a4f904a-222a-4f2f-af0f-7d3b64e91935
6d5aa511-da72-4782-a033-cc434deabc64	t	Rugeregere	8a4f904a-222a-4f2f-af0f-7d3b64e91935
6b8f0abd-faa4-4ab2-9d0f-d6a8fe9a1de4	t	Kabuga	c7212472-07f6-40b7-9588-2d676015bcb5
2b4a22a4-eb2f-4a73-9c46-735462c24183	t	Karambi	c7212472-07f6-40b7-9588-2d676015bcb5
79f53e4a-d07e-4332-93b1-075cac745ef3	t	Bunyamanza	16c3c207-4926-4398-b171-b4d4d822a2ae
c9f50a31-27da-415f-b19e-82bc8afdcbed	t	Gisheke	16c3c207-4926-4398-b171-b4d4d822a2ae
a1b3bbe0-c7e0-4f70-a52e-bd0234bb4a3f	t	Gitsimbwe	16c3c207-4926-4398-b171-b4d4d822a2ae
852daad4-35f7-459c-b8c2-b473e05681fc	t	Rubona	16c3c207-4926-4398-b171-b4d4d822a2ae
b65dede8-2185-48e1-8854-5646e59ee308	t	Gaseke	b44d0d5c-e432-41b9-8434-bbd8db6fcc6c
05cf88f7-a697-4ae6-98d9-211cf1bf8dce	t	Wimana	b44d0d5c-e432-41b9-8434-bbd8db6fcc6c
9fc9396a-9b34-4f3d-b4d4-333a35b27345	t	Wingabe	b44d0d5c-e432-41b9-8434-bbd8db6fcc6c
7c3f1e5e-00da-47af-af9a-7f2cdd55a5ca	t	Rupango	300685f4-1adb-432d-82f8-f58bb63cd5e8
727f5646-aef7-4237-ae85-450c07ad6908	t	Mataba	8dbf8063-6cdf-4890-a467-25d303b75692
210b87d7-8369-4a36-89f2-03dc9bfcfff4	t	Musumba	8dbf8063-6cdf-4890-a467-25d303b75692
6b961426-2882-4f03-a4ac-cb85c6d8c8f0	t	Mwasa	8dbf8063-6cdf-4890-a467-25d303b75692
df4d831e-32eb-4d99-a015-d77cf95952e8	t	Nyarunombe	8dbf8063-6cdf-4890-a467-25d303b75692
48ed87d5-4a6b-4b2a-a3c3-ad925afadf3d	t	Rugote	8dbf8063-6cdf-4890-a467-25d303b75692
2ee85812-378b-46ae-83c6-db2dc8611800	t	Rumamfu	8dbf8063-6cdf-4890-a467-25d303b75692
b15e2bcc-ccf9-4105-91bb-24ce962220d7	t	Rwankuba	8dbf8063-6cdf-4890-a467-25d303b75692
500e55c6-7ebf-4c4e-9cf5-61f04f878e87	t	Gatyazo	1747384b-7baa-4ba9-9bc7-0f335b8a39a0
9e41917e-d878-4e6e-844d-47e5753d74de	t	Bizi	ac8b1552-192d-48ec-9e46-fdefc70f9365
dfed1adb-8f5a-45a6-9993-3cd171bb563a	t	Cyijima	ac8b1552-192d-48ec-9e46-fdefc70f9365
b6d3b891-899d-4405-860e-920f19664539	t	Nkuro	ac8b1552-192d-48ec-9e46-fdefc70f9365
1da13f94-b82c-4cf3-b168-5e9ceaf82cbd	t	Nyarusange	ac8b1552-192d-48ec-9e46-fdefc70f9365
0c52f0b8-bbb4-4f13-9a97-c24d5f8f4b1b	t	Fumba	aa2adf71-f75c-4f19-bff7-0be2996a8856
a3042165-36ec-48af-98da-2f71895704de	t	Nyabumera	aa2adf71-f75c-4f19-bff7-0be2996a8856
86048959-43a6-4043-ae3a-8be90acf6b63	t	Gabiro	94a8232b-3a7a-462e-960e-1d8c77b703fb
e95bb5a8-863d-431b-81d7-a3a22c047ef4	t	Kigara	94a8232b-3a7a-462e-960e-1d8c77b703fb
a2ace628-a164-4339-9b53-fd40b6b125e6	t	Ruhanga	94a8232b-3a7a-462e-960e-1d8c77b703fb
a1360743-c829-46dd-8565-f59b12c69bb8	t	Rukaragata	94a8232b-3a7a-462e-960e-1d8c77b703fb
0a27f2af-6db1-4426-b679-4131217790ec	t	Kizenga	dd93337d-e070-4ecd-aaa4-e2d56b216892
9c05ea62-2fc0-42c9-8fa3-504e782f1f64	t	Nyagahima	dd93337d-e070-4ecd-aaa4-e2d56b216892
309cffce-b874-49f6-a368-192094f7a108	t	Bigali	bcaadcf2-9a4e-48e4-8e25-6951e94a871e
b63ebd94-ad8b-489a-8965-5e73dfdd6f5c	t	Bisharara	bcaadcf2-9a4e-48e4-8e25-6951e94a871e
63bf9953-7ccf-4126-8084-364572c0d34e	t	Cyinjira	bcaadcf2-9a4e-48e4-8e25-6951e94a871e
7c522e9f-1ebe-45ad-8b99-f7b3dd1e87e0	t	Gitwa	bcaadcf2-9a4e-48e4-8e25-6951e94a871e
55bc1368-be7a-4bd3-86e8-3f6175fddac3	t	Nyarusiza	bcaadcf2-9a4e-48e4-8e25-6951e94a871e
936e0ff4-b66b-4b5c-8ce0-4e4d21577662	t	Bunyenga	d9542e31-18fe-4ebf-b191-afc8ad71d135
d6123987-c01c-465d-b75f-7234c1f712f4	t	Mariba	d9542e31-18fe-4ebf-b191-afc8ad71d135
0892091e-a16d-415c-8f8d-4e0922cc67ab	t	Ruginga	d9542e31-18fe-4ebf-b191-afc8ad71d135
dbb05a4a-73b8-435d-98f1-bec01b9db132	t	Gahwazi	94b9d030-eba5-4fda-a24c-0015e4b15cc3
7fcb975e-6abc-4860-ad87-3de12964d2d6	t	Gasebeya	94b9d030-eba5-4fda-a24c-0015e4b15cc3
59a1e162-babf-4320-bd99-f900a3fe028a	t	Kibanda	94b9d030-eba5-4fda-a24c-0015e4b15cc3
6f4f8626-1893-4e2f-85c8-864d241cee28	t	Mukarange	94b9d030-eba5-4fda-a24c-0015e4b15cc3
c6822df5-e0ee-42df-9351-60b17281bd40	t	Gahuhezi	f55a8031-2b03-4785-beac-57f9cef4efbb
2c645e43-2fa7-4886-aecb-6ed64227fc01	t	Kabacuzi	f55a8031-2b03-4785-beac-57f9cef4efbb
f59b255d-fc1d-4683-884b-45a568f72dfe	t	Buhokoro	76e20690-0b90-4ebe-bdbf-59cc8dbe8178
a66f9915-636b-4199-8c15-d14ce859e6d0	t	Bugiga	0426dac6-9f48-443e-ab2a-0f7e07288ae1
dec1a642-c1c1-45d4-bebc-aafadf6f4fa4	t	Nyamirundi	0426dac6-9f48-443e-ab2a-0f7e07288ae1
1ef1b237-9b6a-4cea-b8c3-2acb0a103803	t	Ruhonga	0426dac6-9f48-443e-ab2a-0f7e07288ae1
6f9f3f8e-3b2e-4a57-a6e7-5690405d3a2f	t	Kaneke	1cfaf7f5-e83d-4712-8ed2-2bef3502c20f
a541275c-d372-4f84-821d-dfde8799e9e1	t	Rugomero	1cfaf7f5-e83d-4712-8ed2-2bef3502c20f
d4f70bc3-0632-4116-87b7-95d75606f9bc	t	Murambi	bc228875-6668-450c-9417-667f2071f5c2
feb25da2-b7d4-4ec2-9f24-587c16cb5d2e	t	Ryamashuri	d0b25ffc-3d9c-459c-a546-52596f10be4d
3a826e9f-d1da-49b0-880b-3a4b95451825	t	Kacyiru	04528616-8782-45fa-852e-5c4a8af6fb5b
05c63544-396c-488e-a3a1-fd31591ee37c	t	Kagarama	04528616-8782-45fa-852e-5c4a8af6fb5b
2b22f7f2-edfd-4066-9b34-243416b5e033	t	Kamabuye	04528616-8782-45fa-852e-5c4a8af6fb5b
4c9cf8cd-a14c-424d-b33e-81b8f08118ca	t	Kamonyi	04528616-8782-45fa-852e-5c4a8af6fb5b
28c34bef-00f4-45b6-9593-74ae78e02c8c	t	Bigutu	af0228f7-282d-4a70-9d33-53f95bff19b2
3dedc043-de5e-4f57-b470-cc63715570e0	t	Gihinga	af0228f7-282d-4a70-9d33-53f95bff19b2
3dc3770d-3716-4257-a678-6b00bc42f627	t	Kanyovu	af0228f7-282d-4a70-9d33-53f95bff19b2
38db6c03-eae6-4a11-8f2c-d215b249cae1	t	Nkomero	af0228f7-282d-4a70-9d33-53f95bff19b2
1a5c9628-0905-42a4-9a02-fe12bc4080f3	t	Nyamuhunga	af0228f7-282d-4a70-9d33-53f95bff19b2
9f1c259f-3261-4a1c-9bd9-a1b6d2e713ed	t	Save	af0228f7-282d-4a70-9d33-53f95bff19b2
59526c95-1285-4028-9cf0-3d15c130a7d4	t	Gatanga	2b2827ba-6a11-4850-942f-e9313ff3ed6e
778c2841-09d7-4947-9f53-972dd2160cc1	t	Ngoboka	2b2827ba-6a11-4850-942f-e9313ff3ed6e
7ee498bc-65e2-4b42-aaf2-e10ebac48a68	t	Rugabano	2b2827ba-6a11-4850-942f-e9313ff3ed6e
82e1dce1-8b44-425f-a33e-2c606956c8f7	t	Ryangange	2b2827ba-6a11-4850-942f-e9313ff3ed6e
29f8c195-f2be-4c5e-b7a7-a94413f55c37	t	Rubayi	647e72f9-07f6-4b21-8a22-672f57264acc
3a1528ea-0531-4557-8124-ae185fd292c9	t	Gabiro	7c2e8e25-5d33-4f08-bb4b-0d9213cec640
a412d5d6-6449-4739-9c05-079b86113a79	t	Karuhigi	1ee34485-af0f-45fa-a1f6-974451e693b3
5db3b84f-a2fe-4b83-bd23-d43c64cef291	t	Nyamateke	a5b729ba-a51a-4214-b9ad-f924e9011913
89d5fe8f-0683-4a9d-abfe-8ac166435ea6	t	Busasamana	b3041454-9088-4d21-8c0e-2d4c9b789e3a
c7181213-98e8-43cb-97e8-8a5c2c0aa2d5	t	Kabere	b3041454-9088-4d21-8c0e-2d4c9b789e3a
f88b51b2-42c6-40c0-9ead-01d364e5722f	t	Bugeshi	f6fd622a-d90a-4581-8392-9faff93ffc0f
569e69e0-5257-4279-9aa1-842db7a7704d	t	Buringo	f6fd622a-d90a-4581-8392-9faff93ffc0f
a6b30db7-5f7f-4ade-b0e1-00e5df00bf04	t	Butaka	f6fd622a-d90a-4581-8392-9faff93ffc0f
d47a95a1-2f6d-469e-ac9e-e4a3e2fd6f2b	t	Gaharawe	f6fd622a-d90a-4581-8392-9faff93ffc0f
eb84af30-cd7e-4147-b495-b54232fb3a2c	t	Gahira	f6fd622a-d90a-4581-8392-9faff93ffc0f
bbcd709a-ca70-4936-90f3-eb59a8e3f33f	t	Jenda	f6fd622a-d90a-4581-8392-9faff93ffc0f
17d5f704-04d5-4ec8-b132-e9d66fd15bd6	t	Mutegengeri	f6fd622a-d90a-4581-8392-9faff93ffc0f
279ec962-584c-43c2-87c0-3be435ea8c2a	t	Akabajara	f674b7fb-72e1-483a-89ae-dbcc6c8c3495
880b9f84-63e5-4c39-84e3-b7036cd3cea6	t	Akimitoni	f674b7fb-72e1-483a-89ae-dbcc6c8c3495
13633a12-4e0d-4cc4-bcb5-aafa5677e651	t	Gaheriheri	f674b7fb-72e1-483a-89ae-dbcc6c8c3495
4426bbcf-4a5f-48b3-99aa-54d6c7d02a9d	t	Kabingo	f674b7fb-72e1-483a-89ae-dbcc6c8c3495
2c51f077-b11a-41c4-b74b-8ac514bff644	t	Kinyamuhang	f674b7fb-72e1-483a-89ae-dbcc6c8c3495
6cf99971-b335-4864-bdf5-4c206558ee7f	t	Muremure	f674b7fb-72e1-483a-89ae-dbcc6c8c3495
04431458-02fa-47a4-a63b-4bd512018c3f	t	Bereshi	f26713d6-224d-47c5-b1b8-6e76b3a5a124
af21806c-fa38-459c-bf2c-995e7232efb5	t	Bweramana	f26713d6-224d-47c5-b1b8-6e76b3a5a124
5cbc5978-5c7f-4667-a153-a9b206d50c94	t	Gasizi	f26713d6-224d-47c5-b1b8-6e76b3a5a124
9ecb5450-82c3-4d63-86c6-115bbf405f6a	t	Gitotoma	f26713d6-224d-47c5-b1b8-6e76b3a5a124
7f141456-0b8c-48e5-b94f-eef0fa32dabd	t	Hangari	f26713d6-224d-47c5-b1b8-6e76b3a5a124
fcff8337-a2b8-4363-b8d0-f9b224aeabb1	t	Humure	f26713d6-224d-47c5-b1b8-6e76b3a5a124
2ace15a3-da77-44b1-9552-ea9ce8c5a731	t	Kabeza	f26713d6-224d-47c5-b1b8-6e76b3a5a124
a73582db-f96d-4df6-aeba-e0b5388af415	t	Bonde	273a5546-b6ac-4331-b659-8bc869083e2b
a7bbd157-c0f1-427b-a332-7afb2a657ee1	t	Bugeshi	273a5546-b6ac-4331-b659-8bc869083e2b
e7085b34-8a22-43d5-9f1b-528812224e02	t	Gashaka	273a5546-b6ac-4331-b659-8bc869083e2b
06ec8213-cd0e-457b-9120-9edf20f84d6d	t	Gatovu	273a5546-b6ac-4331-b659-8bc869083e2b
6654e056-c847-4a84-bbdc-68ae4ca92193	t	Gihira	273a5546-b6ac-4331-b659-8bc869083e2b
26976d2e-1bed-40d6-baab-745cecef4a48	t	Kabumba	273a5546-b6ac-4331-b659-8bc869083e2b
263590c8-37c1-44eb-b2fb-fbc61f848c15	t	Mweya	273a5546-b6ac-4331-b659-8bc869083e2b
87ab2b45-fb70-43b9-bf25-4b0f9166746b	t	Bigaragara	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
9e7e7080-dcfb-4648-a0b0-07f8228d6e98	t	Bugeshi	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
ee140531-eb02-49f7-9d4f-60f8f20ccce8	t	Kabuhanga	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
71c713a8-fb48-4739-a4ee-edb2d15cad03	t	Kimpongo	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
2e1ea111-9bcf-41a7-9c57-aae359d21008	t	Mburamazi	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
2dd136af-1ebd-4c32-bf7f-98fdb593a156	t	Rindiro	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
e4ed1462-ebc4-4f66-b16d-b37f8bc9b44f	t	Vuna	7276cd56-632c-42eb-9ef9-d1784f1f6ea7
fba8b19d-8b48-47d6-a46b-bd6d26151b48	t	Batikoti	837f8811-53c2-4b61-88b5-0ef610a1b040
1f29ad50-8e5d-496f-a40c-0a55688c0466	t	Bipfura	837f8811-53c2-4b61-88b5-0ef610a1b040
0350fc32-e6ca-4e91-ba81-6247fa2e5e7b	t	Bweza	837f8811-53c2-4b61-88b5-0ef610a1b040
2c1d27fa-501b-4e87-8b2c-4928563f12a6	t	Cyumba	837f8811-53c2-4b61-88b5-0ef610a1b040
68106705-17a2-4100-9406-acfcbd932934	t	Gaheriheri	837f8811-53c2-4b61-88b5-0ef610a1b040
b2c1a8fc-9d2f-452e-91e8-a6c2795f692d	t	Murangara	837f8811-53c2-4b61-88b5-0ef610a1b040
8a43614d-172b-46dd-9f02-ec7d024a56bd	t	Bihe	1a205f87-0d77-496d-8150-5a02aacf4ac9
67804529-c180-4d0d-a3e8-5ed0bb28fd24	t	Bunjuri	1a205f87-0d77-496d-8150-5a02aacf4ac9
8b05b59b-da2e-4037-9674-0cace3443151	t	Ryarugamba	1a205f87-0d77-496d-8150-5a02aacf4ac9
3c59ef5b-272f-4669-9004-245413f90347	t	Biziguro	97452734-6963-4e80-861c-cea8b7ef8fa2
cee3d28e-14f1-47ff-9e08-c02ce3c683f8	t	Busanganya	97452734-6963-4e80-861c-cea8b7ef8fa2
2bb81279-0559-4b4f-98a0-53f4aa116ca3	t	Gakomero	97452734-6963-4e80-861c-cea8b7ef8fa2
6321ece2-84f4-451c-8f92-4e6b02a716d9	t	Kamuyenzi	97452734-6963-4e80-861c-cea8b7ef8fa2
649b9ad0-bc64-479c-a45c-b3f1a17bf412	t	Kanondo	97452734-6963-4e80-861c-cea8b7ef8fa2
350d73c1-534d-40e9-8cf7-a3da71440e1f	t	Kanyabijumba	97452734-6963-4e80-861c-cea8b7ef8fa2
7db62972-0141-49e8-b2ec-34b5f8add702	t	Nyarubuye	97452734-6963-4e80-861c-cea8b7ef8fa2
c27d5f80-d838-4ee6-b86e-ba17228595a2	t	Gisura	f7727b55-7d43-4b5c-a167-a8e782dde7c8
fde608d9-4b42-4624-9a8e-00c361e0b896	t	Kinyababa	f7727b55-7d43-4b5c-a167-a8e782dde7c8
a0a0be00-79b6-45e2-b51e-d744775caf06	t	Mashinga	f7727b55-7d43-4b5c-a167-a8e782dde7c8
00906727-9025-4ba4-898c-9742e4064679	t	Munanira	f7727b55-7d43-4b5c-a167-a8e782dde7c8
599f7dfe-0cf6-43d4-bcff-f5738e4401f9	t	Nyarunembwe	f7727b55-7d43-4b5c-a167-a8e782dde7c8
62f76003-17dc-4fd3-8240-fde8efc2da5f	t	Marumba	c086aba0-af28-446c-a615-766b8cfa2dc4
2ece8f02-b4da-4c54-8f2c-468ef62d8f20	t	Mubona	c086aba0-af28-446c-a615-766b8cfa2dc4
7dd3fdf4-3b3c-42c6-8ec8-6478c8f7a0fe	t	Nyamyumba	c086aba0-af28-446c-a615-766b8cfa2dc4
f0d25d53-2c4b-4a9e-973a-899e925c568d	t	Sabushengo	c086aba0-af28-446c-a615-766b8cfa2dc4
e14c3424-ad6c-476e-970d-bdb7a4ead04d	t	Gasenyi	729d463a-e0c5-469b-b26d-eae536ea801e
874af04f-7848-40dd-9c86-812251e07d47	t	Kigezi	729d463a-e0c5-469b-b26d-eae536ea801e
aef876e9-b351-4e53-97f6-494614d6f864	t	Ruhara	729d463a-e0c5-469b-b26d-eae536ea801e
8106eb18-e895-4192-9e5d-f89181b0edf7	t	Rwamigega	729d463a-e0c5-469b-b26d-eae536ea801e
b74af312-2fce-412f-9598-6c641ead30b5	t	Gakuta	ddef402b-8da9-43c2-aa5d-ec5fb0f2ba6d
627c2df4-0811-474e-bb68-28d91c6b2679	t	Kamuzamuzi	ddef402b-8da9-43c2-aa5d-ec5fb0f2ba6d
51232b11-f2d2-443d-83df-1d850021cd1e	t	Karambi	ddef402b-8da9-43c2-aa5d-ec5fb0f2ba6d
352d1086-3bdb-4a39-8563-4248a73069da	t	Kidadi	ddef402b-8da9-43c2-aa5d-ec5fb0f2ba6d
1f6e51b2-ff72-4cf2-bafc-ce5bb2adec26	t	Cyanika	0e4dae82-1825-45a3-bfe9-6f6c833b8876
378c6655-4031-46ae-b951-dfd2cce3bfd8	t	Kitagabwa	0e4dae82-1825-45a3-bfe9-6f6c833b8876
63180645-4847-416a-9bc8-f8335f3f3ce0	t	Cyamabuye	325615d7-081e-43d8-9fd6-2fa43a8276fb
07e94c6c-4c20-4c85-aae3-0fbd1d7136d8	t	Kabagoyi	325615d7-081e-43d8-9fd6-2fa43a8276fb
6de88dd2-3cf4-4016-9dc5-62807380d097	t	Kageyo	325615d7-081e-43d8-9fd6-2fa43a8276fb
10aefa16-7a84-4fa6-a5a5-ebd6d427c1e2	t	Kambonyi	325615d7-081e-43d8-9fd6-2fa43a8276fb
b0c2c26b-e11a-4828-a72f-c06e6443a15d	t	Kamivumba	325615d7-081e-43d8-9fd6-2fa43a8276fb
b0026f40-6431-4d5d-9143-585218ed8d50	t	Kinogo	325615d7-081e-43d8-9fd6-2fa43a8276fb
49a962c6-9bd1-4f12-9518-9fd35cd81c07	t	Munege	325615d7-081e-43d8-9fd6-2fa43a8276fb
9b4f689e-0c6c-4fc8-bedf-d4ed48a32381	t	Rebero	325615d7-081e-43d8-9fd6-2fa43a8276fb
947555c3-0e81-4c03-bc44-506f20929bde	t	Bugu	9136dbe7-f290-4b9b-94c3-4e54111307d0
66b7c80f-4cbe-4977-b9d0-ce150baa94ce	t	Butango	4fcc7a53-b593-437d-83bd-48353e4c928f
75ae164a-8319-4f71-9576-99716a3a6424	t	Cyanzarwe	4fcc7a53-b593-437d-83bd-48353e4c928f
eac50107-96b1-45a3-b0b2-9588a98313c5	t	Gasenyi	4fcc7a53-b593-437d-83bd-48353e4c928f
aff0883a-71eb-49c9-8157-41c0bab4d6f7	t	Karangara	4fcc7a53-b593-437d-83bd-48353e4c928f
2a30e256-79c8-4d6f-bd07-e70750c4d8f9	t	Gora	43ad7961-7ec5-4b6f-bb71-684177018fd2
f6fe9cb6-3285-41aa-99fa-0b88d0ae8865	t	Kabere	43ad7961-7ec5-4b6f-bb71-684177018fd2
46ddabe1-7aa8-4b1a-88d5-0f83339e96df	t	Kanyentambi	8b5d9638-2b12-4183-8ca1-78c06151df6f
4292eea9-827a-4ad0-8ba2-1ebc3788403a	t	Muhororo	8b5d9638-2b12-4183-8ca1-78c06151df6f
b7a6e14a-4639-4b1f-bfea-43d010ddad36	t	Gashuha	f31d9861-35c7-4b13-801d-cc4e5990c2c0
c97fcb2c-1710-4b1c-ac72-2cfdbfbb8e75	t	Makurizo	f31d9861-35c7-4b13-801d-cc4e5990c2c0
2b5773d3-c0bd-4d9c-9533-8c2e1bf55a77	t	Mukingo	f31d9861-35c7-4b13-801d-cc4e5990c2c0
262b900b-dde5-4001-8c3e-24f0824e7145	t	Nyamugari	f31d9861-35c7-4b13-801d-cc4e5990c2c0
c9feb6f7-1a7c-4d26-b224-2e7b2a5b7131	t	Ruhuranda	f31d9861-35c7-4b13-801d-cc4e5990c2c0
31866794-e944-46ec-9e47-9a6c086f5d58	t	Buramazi	adb9e0dc-3161-45ee-bb98-05247a772a5e
fbcf30ea-d5fe-41b8-b5a5-7630fff00634	t	Hanika	adb9e0dc-3161-45ee-bb98-05247a772a5e
89b3300f-86dc-49ad-bffc-7aeff5a021f7	t	Muti	adb9e0dc-3161-45ee-bb98-05247a772a5e
7b681c4b-ed85-4b0a-aa6b-eec3e0a3205b	t	Nyakabanda	adb9e0dc-3161-45ee-bb98-05247a772a5e
fb9a619a-b8ed-41a5-a814-6b2f6f24325d	t	Nyakabungo	adb9e0dc-3161-45ee-bb98-05247a772a5e
ab4927e9-ec9a-4e62-b165-4907908f5613	t	Kabirizi	e9932cb5-5b8a-4a11-b3ef-4c9b240dd156
bd25d253-971a-461f-b57a-7d091cc0aa5b	t	Karambi	e9932cb5-5b8a-4a11-b3ef-4c9b240dd156
40d1bfc1-8a79-4c1c-8bb2-a510fbda420a	t	Kinyamiyaga	e9932cb5-5b8a-4a11-b3ef-4c9b240dd156
c4ef8d6f-d497-4c14-b088-08979a999fc2	t	Munaba	e9932cb5-5b8a-4a11-b3ef-4c9b240dd156
beb81d58-28f0-4abb-95e1-8537bd361d33	t	Rukorakore	e9932cb5-5b8a-4a11-b3ef-4c9b240dd156
e2094f97-014a-4263-ba3d-28ece0931070	t	Burere	1c409088-3254-4a43-bb0f-7d3a2c7f937f
0ac74f93-e93c-4e7a-9682-8bac22985c2c	t	Kanyamagare	1c409088-3254-4a43-bb0f-7d3a2c7f937f
7387c56d-1b72-493e-8bd9-08a52a9991e7	t	Musene	1c409088-3254-4a43-bb0f-7d3a2c7f937f
cd7ec9ab-9719-4c44-a7f6-6e6be63a27f3	t	Nganzo	1c409088-3254-4a43-bb0f-7d3a2c7f937f
2cdec581-af51-4531-b02b-ddbb3128cfb8	t	Amahoro	55ade7dc-1043-46fa-8d21-44fa8fb034b4
869f00e3-68e4-4718-883f-1a4c44942291	t	Kitagabwa	55ade7dc-1043-46fa-8d21-44fa8fb034b4
a559d0f0-6205-4b66-8a29-6968a5184f24	t	Muhabura	55ade7dc-1043-46fa-8d21-44fa8fb034b4
c2db1104-d86b-4359-857b-f828ab761195	t	Murakazaneza	55ade7dc-1043-46fa-8d21-44fa8fb034b4
fc38c6a3-d668-4a19-b705-11c443e69f45	t	Umunezero	55ade7dc-1043-46fa-8d21-44fa8fb034b4
daf77de7-5866-46c4-9bcf-7c81209a3dcd	t	Amataba	03050180-0ace-41c9-8437-c07a5f17c797
b2e69301-5c04-4e52-9c8b-cfbd4c4fcaf9	t	Giraneza	03050180-0ace-41c9-8437-c07a5f17c797
ff8802a9-1d62-48b8-b2a0-70c09526df68	t	Irakiza	03050180-0ace-41c9-8437-c07a5f17c797
0baf4d53-ae48-43f5-90c2-78765fd1fdec	t	Isangano	03050180-0ace-41c9-8437-c07a5f17c797
32731355-86d8-4177-bd72-d6a8fdbae430	t	Kaminuza	03050180-0ace-41c9-8437-c07a5f17c797
957a6910-f20b-475b-9920-db35a0a11469	t	Nyakabungo	03050180-0ace-41c9-8437-c07a5f17c797
32919f0f-348c-4979-9247-35bdb5e56d63	t	Ubutabera	03050180-0ace-41c9-8437-c07a5f17c797
4b278e89-3e37-44ca-94ee-9776dcfcbe33	t	Ubwiza	03050180-0ace-41c9-8437-c07a5f17c797
f4089f4c-dc0f-4c64-8903-21e4a8ef5a95	t	Giponda	8fb6ebb8-ad44-426e-bac2-1a47a5637297
e0d88989-e2b9-4855-a0c4-ebe1930f56be	t	Itangazamaku	8fb6ebb8-ad44-426e-bac2-1a47a5637297
bb6b84c8-9431-470b-8dde-0dc5decf47ab	t	Karisimbi	8fb6ebb8-ad44-426e-bac2-1a47a5637297
c801f28a-5e86-458c-872d-acd9c4496443	t	Murisanga	8fb6ebb8-ad44-426e-bac2-1a47a5637297
a5b99e17-6b83-4165-a92c-e8ac9c59b52b	t	Ubukerarugen	8fb6ebb8-ad44-426e-bac2-1a47a5637297
e8844bf7-f0cf-4370-8da3-cbecce9ee3cf	t	Ubutabazi	8fb6ebb8-ad44-426e-bac2-1a47a5637297
76307b3e-e372-4547-9592-a52ed6570abb	t	Umurava	8fb6ebb8-ad44-426e-bac2-1a47a5637297
87181a41-88b4-4337-b61b-48c4629cc233	t	Urumuri	8fb6ebb8-ad44-426e-bac2-1a47a5637297
795d465d-46a1-47fa-a969-786f764b3f14	t	Amajyambere	fc2ab273-fbc9-49cd-ad55-787a738de632
5f7fcee5-90c3-481e-85fe-6f5a1fdea70c	t	Gasutamo	fc2ab273-fbc9-49cd-ad55-787a738de632
dec95620-f25e-480a-ad29-9dd786816d02	t	Icyinyambo	fc2ab273-fbc9-49cd-ad55-787a738de632
f6b42a0a-e666-4735-b3e0-b8065caf99fb	t	Ikaze	fc2ab273-fbc9-49cd-ad55-787a738de632
407afffc-3f3d-407c-b36f-7cb1388a282e	t	Ikibuga	fc2ab273-fbc9-49cd-ad55-787a738de632
3ae18303-5d33-4173-b373-afaca879c7e0	t	Inkurunziza	fc2ab273-fbc9-49cd-ad55-787a738de632
ac5fe504-dfe5-4c67-a174-0bae9f9311b8	t	Rebero	fc2ab273-fbc9-49cd-ad55-787a738de632
18774a53-c222-4734-882b-f8d851a26bee	t	Uburezi	fc2ab273-fbc9-49cd-ad55-787a738de632
e34d39bf-00f0-4427-9378-493ff3cfcb32	t	Ubwiyunge	fc2ab273-fbc9-49cd-ad55-787a738de632
427568fd-5f84-4dad-914d-5d80d20e7876	t	Umutekano	fc2ab273-fbc9-49cd-ad55-787a738de632
46ecbed8-ab98-4d91-a907-a226176c3b81	t	Gacuba	e742443a-21b0-40a4-ba08-80612c2980fd
9ce5b5c3-1fb8-4f1a-b8e5-7a5f4231e2b2	t	Gikarani	e742443a-21b0-40a4-ba08-80612c2980fd
904f2fab-d808-4db3-8594-1873cc285ba4	t	Kivu	e742443a-21b0-40a4-ba08-80612c2980fd
d2875705-1806-484b-bb83-69c00dd44626	t	Nyabagobe	e742443a-21b0-40a4-ba08-80612c2980fd
e7f5297f-c1ea-46a0-b0ee-653413e3fb17	t	Nyaburanga	e742443a-21b0-40a4-ba08-80612c2980fd
9810605d-8e05-454e-b740-c9bc4b9a0c99	t	Ubucuruzi	e742443a-21b0-40a4-ba08-80612c2980fd
228bc085-13e9-4ad1-be47-94897a032ef9	t	Urubyiruko	e742443a-21b0-40a4-ba08-80612c2980fd
d34abed8-1e0c-40b8-86bc-d34a284fb577	t	Gahojo	6e196c32-fa01-42c2-9666-0b5bc352c983
88c33455-0637-4878-a171-d309ede20632	t	Kamayugi	6e196c32-fa01-42c2-9666-0b5bc352c983
aae8ac29-a2e1-4e15-87d9-d375f173bd8f	t	Rubavu	6e196c32-fa01-42c2-9666-0b5bc352c983
343ce1a7-931f-4fb9-ab23-53ab349e75ed	t	Bonde	38c74439-1865-44fc-9188-63012f2afe7b
0331ae50-2420-4e69-94c4-bfb95c554dd9	t	Dukore	38c74439-1865-44fc-9188-63012f2afe7b
c70514b8-5a37-4512-9692-5d9121cb6d53	t	Kabuga	38c74439-1865-44fc-9188-63012f2afe7b
fb4fc3ed-497a-4fa5-a272-1f90726c13bb	t	Majengo	38c74439-1865-44fc-9188-63012f2afe7b
6d4b0fbf-eeb0-4925-924c-0da89239b59a	t	Muhato	38c74439-1865-44fc-9188-63012f2afe7b
f574c046-ac81-4039-b21b-2836fe96e932	t	Umucyo	38c74439-1865-44fc-9188-63012f2afe7b
86f2c7df-d3b0-49e8-822e-ee89c2d0fe98	t	Umuganda	38c74439-1865-44fc-9188-63012f2afe7b
f1839d99-ac2d-4d08-93a2-8133973f157d	t	Umunyinya	38c74439-1865-44fc-9188-63012f2afe7b
c49233f3-1026-4182-895f-fe5b2e0c0859	t	Bambiro	0d4e85fb-84b4-4257-8efb-1206a01747b3
788b08c6-8b93-41e0-880b-d411039d7d4b	t	Kagarama	0d4e85fb-84b4-4257-8efb-1206a01747b3
347109ff-04e7-41ec-a122-473ba922efc7	t	Nyanshundura	0d4e85fb-84b4-4257-8efb-1206a01747b3
72d8b6f0-679a-452a-870f-b09a4ea87288	t	Rukoro	0d4e85fb-84b4-4257-8efb-1206a01747b3
31241690-0237-44e5-bf56-813bc6fbab1f	t	Rwankomo	0d4e85fb-84b4-4257-8efb-1206a01747b3
c4c8b0b6-298a-499f-bed3-b690093f80f3	t	Ndongoshori	229912a9-6ded-4c5c-ae52-729cb022b01b
8d9d64fa-6a3b-493f-8833-77f9a6c913ba	t	Bikuka	1924aff4-cf93-4dcc-a24d-8d88d830acf7
38ea8900-91db-4bf1-b6a2-fa089064518a	t	Kabeza	1924aff4-cf93-4dcc-a24d-8d88d830acf7
09efb963-9c44-4e93-b3e6-8247ce9d8a3d	t	Kabindi	1924aff4-cf93-4dcc-a24d-8d88d830acf7
d9107704-7fee-46fd-824f-b427e43c2b6f	t	Kanama	1924aff4-cf93-4dcc-a24d-8d88d830acf7
d444cf85-7711-49f3-9022-2b3017806956	t	Kara	1924aff4-cf93-4dcc-a24d-8d88d830acf7
c04dd71e-5f4c-4a56-b466-5a59bc13446a	t	Mahoko	1924aff4-cf93-4dcc-a24d-8d88d830acf7
906f0bc8-b728-416e-a58d-0ec9381b0014	t	Nyagasozi	1924aff4-cf93-4dcc-a24d-8d88d830acf7
b6ee29ec-e779-418b-b66b-c15d21fc649e	t	Nyamirambo	1924aff4-cf93-4dcc-a24d-8d88d830acf7
ada224a3-1df0-4ade-8164-890fac89e20d	t	Nyamugari	1924aff4-cf93-4dcc-a24d-8d88d830acf7
90dfdd54-c783-4a42-ac56-31d10877966b	t	Nyamuremure	1924aff4-cf93-4dcc-a24d-8d88d830acf7
c890a61e-9843-4d71-a64e-e7a43bcd7faf	t	Rubare	1924aff4-cf93-4dcc-a24d-8d88d830acf7
2417b604-e430-442d-b482-481a6af248ef	t	Shusho	1924aff4-cf93-4dcc-a24d-8d88d830acf7
dfd9193a-7724-4b32-b88b-b5a66d7cba3a	t	Kabingo	6c39a762-c74e-4a35-9af8-c2df6f90e541
cef77073-5945-47ae-a010-9d4610c62bc6	t	Kagano	6c39a762-c74e-4a35-9af8-c2df6f90e541
9bd3a8b5-5802-42c3-96c3-73ac423b3800	t	Nteranya	6c39a762-c74e-4a35-9af8-c2df6f90e541
e7c8405b-2d00-4672-ad6d-396dd2f1ce65	t	Nyakibande	6c39a762-c74e-4a35-9af8-c2df6f90e541
4ba12a4f-7520-4fc6-8560-5e9354fcb29d	t	Gatsina	08464b03-0d94-400a-8f51-fe0285121566
06ac5ca6-1123-414c-ae83-0a3dbc66f04f	t	Nyabishongo	08464b03-0d94-400a-8f51-fe0285121566
dfaa6633-f2b8-4e31-b657-c1a770948680	t	Rwanzuki	08464b03-0d94-400a-8f51-fe0285121566
f202f788-101d-4403-99ae-955a636affe8	t	Gihurizo	657759e5-8a6d-4098-98e4-bea48af213d5
6c6a2be0-27b8-470a-bb94-8705b686fb4d	t	Kabere	657759e5-8a6d-4098-98e4-bea48af213d5
1d12d622-1264-4704-869f-2c08ce643582	t	Muvebwa	657759e5-8a6d-4098-98e4-bea48af213d5
cb41bf43-b819-4ddf-a62c-4488ac099262	t	Gikomero	bbd031ce-8d32-46fc-b1bd-c344e73fe89e
85ef6ff3-9a8f-48e8-baf0-3a2ae498837a	t	Rugege	bbd031ce-8d32-46fc-b1bd-c344e73fe89e
88f47d8c-821f-4968-9596-85453698f8c6	t	Yungwe	bbd031ce-8d32-46fc-b1bd-c344e73fe89e
e6b0510e-a9d5-46b7-ab0c-ae2cc768b521	t	Kabana	90cd6bf2-bffa-47ed-b559-cc5f93fed72e
e8280e71-f351-4da9-9b7d-3285cfdd882a	t	Kirerema	ada937e0-37ee-4add-a070-4f0a92ffd1d8
9037c7ac-e14a-4771-af4d-3399cad95732	t	Rushasho	ada937e0-37ee-4add-a070-4f0a92ffd1d8
6f0694bc-3a44-4953-8322-fc49c2e6cce6	t	Cyivugiza	2f8fc502-244d-449f-94be-f8d5cb9d5c96
71dce91f-5fbb-40b5-b440-d4bffc3cec60	t	Kabari	2f8fc502-244d-449f-94be-f8d5cb9d5c96
c0683754-0893-4a0c-b969-539dd5ac255d	t	Nyamikongi	2f8fc502-244d-449f-94be-f8d5cb9d5c96
78c63780-889f-46da-b807-15e4351e894f	t	Rwamikungu	2f8fc502-244d-449f-94be-f8d5cb9d5c96
de4ff6b8-f026-4ac5-b327-dd26bf305f96	t	Mizingo	c752af96-a21f-49be-97ae-ac972e8492a5
8de573b7-6b9f-4171-bd78-7a4af089f28c	t	Kabere	8a065958-0b27-457a-8e02-561c2fafd563
5d03a106-e5c7-4942-87e8-a931ab28d1d9	t	Bivumu	7e1f4f28-1474-4708-96d9-1b70a9c06f5f
e788444a-1015-4934-8fcc-834b712d794b	t	Bunyove	7e1f4f28-1474-4708-96d9-1b70a9c06f5f
0d355134-518d-4505-adc1-bccf1dad5f2e	t	Mwirima	7e1f4f28-1474-4708-96d9-1b70a9c06f5f
0019264a-d72e-4736-a223-93d575888c88	t	Rukeri	7e1f4f28-1474-4708-96d9-1b70a9c06f5f
bf3cdfcb-c554-4faf-9394-bc5e66dda819	t	Gahanika	2a03e9d5-8145-4bb4-aaa1-829d3327d31b
50d3dd59-2397-438a-8d20-c0be0d11d085	t	Mugongo	2a03e9d5-8145-4bb4-aaa1-829d3327d31b
eaa1a1af-6a87-4997-a95a-fdf844550dd7	t	Murambi	2a03e9d5-8145-4bb4-aaa1-829d3327d31b
c7a7b622-7a66-4292-a584-0bf2e47f46a7	t	Nyamirama	2a03e9d5-8145-4bb4-aaa1-829d3327d31b
435243ff-5cda-494f-a6f6-2ac6fcf2fe79	t	Gasiza	682547e2-7776-4aa1-8b79-27968139a628
0f59746c-c916-41b6-993a-f9a304360388	t	Kanyamitura	682547e2-7776-4aa1-8b79-27968139a628
994493d6-017a-4d4d-b699-dab1b2094fe6	t	Tetero	682547e2-7776-4aa1-8b79-27968139a628
e4efbc85-fff0-4548-941e-380b2aae6a36	t	Gasumba	9eb86f26-72b6-473d-b931-cbe6771645fc
d59ce345-5c0f-411e-b26e-fe4eecae8c64	t	Mirindi	9eb86f26-72b6-473d-b931-cbe6771645fc
5c2ea7e8-a088-417f-bb95-dc0f2aa7d083	t	Tamira	9eb86f26-72b6-473d-b931-cbe6771645fc
43c21b65-ac8d-4df6-a81f-67333d1a59fe	t	Gikuyu	42d103db-ab92-4cc9-8529-a95018c02de4
9c722601-c558-4c37-a88b-7e0b4a57407b	t	Nyabishongo	42d103db-ab92-4cc9-8529-a95018c02de4
c4e39de9-1df1-41b2-8cbd-e7ad8686d13c	t	Bihe	92a98898-8eb7-476b-bce8-6353225221f7
22784aa2-0397-42a0-a142-48d03507a041	t	Gahenerezo	92a98898-8eb7-476b-bce8-6353225221f7
6a4aa9fc-c963-430c-a113-8ede0a46d0bd	t	Rungu	92a98898-8eb7-476b-bce8-6353225221f7
668f7d98-7cdd-4ded-a0da-605755c9a68f	t	Kabunoni	ad0c68a5-c0a6-4962-b7cf-4755fef22294
8fdc628d-fb0f-4b44-9bbb-439035dabcf2	t	Muyange	ad0c68a5-c0a6-4962-b7cf-4755fef22294
1b634fb2-b206-4514-aa5a-eede80fba78a	t	Nangurubibi	ad0c68a5-c0a6-4962-b7cf-4755fef22294
4225fcba-f929-4141-baaf-41271cd4744b	t	Nyamugari	ad0c68a5-c0a6-4962-b7cf-4755fef22294
38bdef56-5e65-4bb7-8091-b87c08bc6e4f	t	Bweza	90bf6f48-2862-4838-ac42-55e35b28f4f2
a2dd02ef-cb99-432e-97c4-eadb510fd9a3	t	Gisangani	90bf6f48-2862-4838-ac42-55e35b28f4f2
bf1ab881-adee-4d0d-9059-8a1c3c4db2c0	t	Kamakinga	90bf6f48-2862-4838-ac42-55e35b28f4f2
2eb8e769-5e9c-4600-aa6c-3cd5740f0d60	t	Mwumba	90bf6f48-2862-4838-ac42-55e35b28f4f2
6f98adae-19d1-44b8-bba5-e2835e54ca61	t	Kitarimwa	948138e8-cd1c-4661-a796-dc229511794b
aae85500-3270-4b23-9fb0-63799e4066c9	t	Nyabibuye	948138e8-cd1c-4661-a796-dc229511794b
11bf0744-439a-49a9-a2da-0049578c81ed	t	Nyakibande	948138e8-cd1c-4661-a796-dc229511794b
644bc426-cfc6-4208-90a7-e9b0cda141df	t	Rugerero	948138e8-cd1c-4661-a796-dc229511794b
df51d938-eff3-4b36-a14e-946503d76c10	t	Rushubi	948138e8-cd1c-4661-a796-dc229511794b
c3b88b52-8aae-448e-9253-dc79ab621d59	t	Kiyovu	ead505da-54fe-42e8-91ce-c05530b51161
ee5bcd17-1ca3-4fcc-bdbd-939fcf4bf52f	t	Muhira	ead505da-54fe-42e8-91ce-c05530b51161
b498c465-484c-4527-9b71-dab53d665a9a	t	Nyakabungo	ead505da-54fe-42e8-91ce-c05530b51161
4ea64019-67b8-44e1-bded-b33b0c92c94f	t	Rebero	ead505da-54fe-42e8-91ce-c05530b51161
14c9b295-5577-4bdd-8ec5-8214f3159e8c	t	Rukoro	ead505da-54fe-42e8-91ce-c05530b51161
e4bd4dc4-34ba-43dd-91db-11aed9bcbea1	t	Bazirete	b76092ee-190f-4d9c-ac65-7c7962e6a4d5
d1314a80-edc6-433a-a914-3c669aab4386	t	Kivumu	b76092ee-190f-4d9c-ac65-7c7962e6a4d5
557e26fc-2634-40aa-8f61-22b464fc6a42	t	Makoro	b76092ee-190f-4d9c-ac65-7c7962e6a4d5
440ea566-5c6c-4425-b224-cd2d343e986d	t	Nyonirima	b76092ee-190f-4d9c-ac65-7c7962e6a4d5
1212ad6e-31b7-49bb-9c6d-da9f4458bfc7	t	Ruhangiro	b76092ee-190f-4d9c-ac65-7c7962e6a4d5
96113e52-2b49-4c58-b65d-02d9882bc0b5	t	Kaberamo	9376f468-e4df-48d2-abce-e9b40d115752
3f41f7ed-a7e0-4914-a452-f11be4f35dd5	t	Kabuyekera	9376f468-e4df-48d2-abce-e9b40d115752
545b5843-c1ae-44e5-928a-a81c2179957b	t	Karuvugiro	9376f468-e4df-48d2-abce-e9b40d115752
272f1ea4-462b-464d-8f37-0a3f8744f581	t	Muhingo	9376f468-e4df-48d2-abce-e9b40d115752
6f6c7ffa-fd3d-4f74-9d2e-3c11bf7f2be0	t	Mutembe	9376f468-e4df-48d2-abce-e9b40d115752
1e02d1c1-f433-4ed5-8574-18a2567790d2	t	Nganzo	9376f468-e4df-48d2-abce-e9b40d115752
507290eb-a848-4ca5-9f3c-059e1ae507be	t	Wintwari	9376f468-e4df-48d2-abce-e9b40d115752
44d08a6e-0934-4de6-9d07-e5a7140ae062	t	Bujenje	dc174b5f-c625-4aca-909f-9da2e57cc45f
01be5a31-e287-4227-91fa-67a00b8f5a62	t	Bushagi	dc174b5f-c625-4aca-909f-9da2e57cc45f
a4553ab6-ac4a-4a4a-8195-4a6978132a50	t	Kabushongo	dc174b5f-c625-4aca-909f-9da2e57cc45f
2e9f5611-755f-4c81-b46e-931480c8d0ad	t	Kanajana	dc174b5f-c625-4aca-909f-9da2e57cc45f
ff91137d-d612-4630-a923-66b20240a9c1	t	Kiguri	dc174b5f-c625-4aca-909f-9da2e57cc45f
4433a3ec-51c3-40c3-be1a-dfbe6ed2f7bb	t	Burevu	4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7
82c56f1a-ed0f-4867-8591-0cc9369a604f	t	Byima	4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7
c7b28b4d-e2ad-43e6-8dd4-70436ede8b64	t	Karambi	4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7
35aef9ee-c5de-4a5e-b507-58026d3f3115	t	Nyabisusa	4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7
e37a9800-46fa-4aa8-84f6-353af69523d6	t	Nyamiko	4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7
1cecc8a8-daf4-489c-a766-c3025cf37f9d	t	Pfunda	4df5ca93-dd8f-49ff-a2ef-c5e246b8eea7
38246fb2-1f77-4545-8c51-7e889448ab01	t	Buhogo	0e4db960-8b19-4ca5-9b29-35adbb5c89ed
322a21eb-fff8-4904-b01e-0ad56ef335b2	t	Kigufi	0e4db960-8b19-4ca5-9b29-35adbb5c89ed
6a316dbb-5be8-403b-88d2-9e6f8516fdaf	t	Mukondo	0e4db960-8b19-4ca5-9b29-35adbb5c89ed
a7425721-fb47-48d4-80d5-978177638715	t	Rambo	0e4db960-8b19-4ca5-9b29-35adbb5c89ed
753828c2-b855-44e3-866e-54376ab8465b	t	Kabakora	3dab6681-0923-4c2a-a12a-369022b33fc0
09b4794b-8197-42e7-9452-a5fe9ee258f5	t	Nyamirambo	3dab6681-0923-4c2a-a12a-369022b33fc0
66cf44dd-a5b9-431f-b9a6-1952d2e4d275	t	Rebero	3dab6681-0923-4c2a-a12a-369022b33fc0
968a01eb-adae-4644-98a0-9b55e5497fd4	t	Shusho	3dab6681-0923-4c2a-a12a-369022b33fc0
21f93d61-a45b-4461-9a5d-011bc3657293	t	Bugasha	70cc9446-f0f6-427b-b11e-f0816235cb88
ac882025-3539-42de-88f9-ca3888b5d123	t	Buharara	70cc9446-f0f6-427b-b11e-f0816235cb88
d6e91089-f731-46e5-b166-d7b4ee600448	t	Bunyago	70cc9446-f0f6-427b-b11e-f0816235cb88
3164c1eb-c3e5-4559-b17f-573fc1db854c	t	Burima	70cc9446-f0f6-427b-b11e-f0816235cb88
ff450706-3a9f-4adb-a492-c120a859ea23	t	Butotori	70cc9446-f0f6-427b-b11e-f0816235cb88
a0439977-4391-45c7-b8d6-0acbd850276c	t	Kabiza	70cc9446-f0f6-427b-b11e-f0816235cb88
d5f91787-fcf3-4e22-b3db-6de7fff29bfd	t	Kabuyekera	70cc9446-f0f6-427b-b11e-f0816235cb88
4033ec51-0fcf-44d1-b787-da2990e4d694	t	Remera	70cc9446-f0f6-427b-b11e-f0816235cb88
2763692e-7e61-4baa-b3a8-bdac89bcf66c	t	Rushagara	70cc9446-f0f6-427b-b11e-f0816235cb88
1dc2fca2-ebb9-4e84-b838-a8edb42101ed	t	Buhozi	98d24b31-de13-45c4-957c-394f3d06aec3
d058dba1-b002-4e46-b7fb-bba382cb5a1a	t	Gatuntu	98d24b31-de13-45c4-957c-394f3d06aec3
8ec28efb-2c8b-4282-af14-2bbe3e3421a6	t	Kagera	98d24b31-de13-45c4-957c-394f3d06aec3
2c917a8d-e280-40e5-9ea4-d34cd8315eba	t	Ngege	98d24b31-de13-45c4-957c-394f3d06aec3
cec666b3-e025-4882-9ad9-531f5950dc5e	t	Rurembo	98d24b31-de13-45c4-957c-394f3d06aec3
94b51bdb-1ae0-4463-bb46-fb93cf4a148f	t	Budaha	f78df667-ffa3-4765-9a2d-b1cd0353e695
222d63eb-f75c-4ae0-ab80-77c839b25af9	t	Busheru	f78df667-ffa3-4765-9a2d-b1cd0353e695
92f7738c-04fd-4bc4-8fbf-28afc160ae3f	t	Cyima	f78df667-ffa3-4765-9a2d-b1cd0353e695
18d983df-23da-4895-bc4d-f13adb5eac32	t	Kanyahene	f78df667-ffa3-4765-9a2d-b1cd0353e695
67e1af67-dd81-42f6-8940-9e31596c89d6	t	Burambo	5d27be5a-a350-4d17-a67a-7b7228cbfe0d
c76a5cf1-c60c-4df9-8dd4-c0e6aaf61c13	t	Gitwa	5d27be5a-a350-4d17-a67a-7b7228cbfe0d
b8efcb59-f501-4137-9eba-08b8f4de186f	t	Kinihira	5d27be5a-a350-4d17-a67a-7b7228cbfe0d
fae772f1-bab2-47d2-8cb2-396e391d9cba	t	Kinyendaro	5d27be5a-a350-4d17-a67a-7b7228cbfe0d
8cdae7b3-a99a-41e5-b56e-12add4bc9f62	t	Shonyi	5d27be5a-a350-4d17-a67a-7b7228cbfe0d
5ac7ca86-5490-45f9-9e5a-407c34ebd2ae	t	Busesa	933be8a1-8feb-4583-98c0-647f13791737
fb08f3b8-601a-4a8a-a227-d4101a5fd43e	t	Kazabe	933be8a1-8feb-4583-98c0-647f13791737
58adad59-4441-45f5-87f7-7ba8257e9c89	t	Mwali	933be8a1-8feb-4583-98c0-647f13791737
b5e4f4b6-19f1-4f57-8452-3acb699b1e50	t	Ndamiye	933be8a1-8feb-4583-98c0-647f13791737
73940fac-8ded-44ae-ba98-16858bd78a35	t	Rukore	933be8a1-8feb-4583-98c0-647f13791737
00a76eae-9c91-4a07-9737-806c36ee36f3	t	Buroha	766d7706-e75c-4735-8d48-399515030cd4
5d625555-c212-4b58-9f79-b9cc265adc0a	t	Kabitongo	766d7706-e75c-4735-8d48-399515030cd4
89f9cfac-c20b-4096-8fcd-0ed9ed1ff628	t	Kanyamisuku	766d7706-e75c-4735-8d48-399515030cd4
b93cc6d9-be82-4ff6-b668-998ae6145912	t	Nkora	766d7706-e75c-4735-8d48-399515030cd4
a90391ab-0e14-4780-adc1-5ef364f46c66	t	Remera	766d7706-e75c-4735-8d48-399515030cd4
eb94fb97-1da1-4fde-8fbd-18c538ff3993	t	Tanda	766d7706-e75c-4735-8d48-399515030cd4
ba8f0e50-4d8f-4fcf-a6c4-eb7265086520	t	Huye	ffb880ca-5a1a-4bc7-a99c-42e412b4dffb
f72f7f8a-3c40-4484-a072-970a2a48a993	t	Kayanza	ffb880ca-5a1a-4bc7-a99c-42e412b4dffb
a4ea84dd-1aa4-4acc-bd9e-12b108c4de11	t	Nyakagezi	ffb880ca-5a1a-4bc7-a99c-42e412b4dffb
592ca167-aafc-4247-a4b2-5daa3c1ead83	t	Gahama	08956ecf-ecc4-4761-ba40-1619b0929393
8677a561-6326-4d68-97fb-8b8874e4b570	t	Hanika	08956ecf-ecc4-4761-ba40-1619b0929393
7b641e07-395f-4eca-b933-3960f098a225	t	Kanyamatembe	08956ecf-ecc4-4761-ba40-1619b0929393
2cde63c1-2128-4f04-b187-7260d44328ef	t	Keya	08956ecf-ecc4-4761-ba40-1619b0929393
5f94d3d7-dfcd-4e7f-b67b-9afe1ba21c90	t	Nombe	08956ecf-ecc4-4761-ba40-1619b0929393
83232ef1-3bc5-40e6-8ad6-76047fd37b45	t	Ruhango	08956ecf-ecc4-4761-ba40-1619b0929393
ce200c0e-2d16-4925-a531-6ff2376e70fb	t	Terimbere	08956ecf-ecc4-4761-ba40-1619b0929393
89ac230c-6969-44e1-b3f5-2ea604cb8440	t	Gabiro	098f8695-588a-4cac-8a22-edfb6a08fd01
0a8889c5-decb-4da7-b4e5-5965222c4070	t	Murambi	098f8695-588a-4cac-8a22-edfb6a08fd01
405b42a5-f847-4266-aa49-9e9375ecbce0	t	Akasengore	e0207896-f266-4a3b-9644-a796a4d215a3
dad96830-e84d-4b1b-ad49-2282161c7f6b	t	Gasenyi	e0207896-f266-4a3b-9644-a796a4d215a3
2a241ea9-7102-4cf7-a22e-b752de3ffca0	t	Nyabantu	e0207896-f266-4a3b-9644-a796a4d215a3
b4a8db56-6c6b-4677-895b-bf2ac4543d41	t	Nyamwinshi	e0207896-f266-4a3b-9644-a796a4d215a3
c01bb8fc-bcde-492b-8a1a-69a4e022ce50	t	Rwezamenyo	e0207896-f266-4a3b-9644-a796a4d215a3
22f666c6-ef94-46a5-835f-f9bf7807e61c	t	Isangano	7413afbc-856d-4875-ae32-f768c34e3526
088ee665-d3ff-40a1-b74e-43adde605b5d	t	Mikingo	7413afbc-856d-4875-ae32-f768c34e3526
3c523142-d1b1-4b86-8f19-b68c7349d073	t	Ngugo	7413afbc-856d-4875-ae32-f768c34e3526
a735f63c-407b-4ee1-83bc-96ac978f000c	t	Rurembo	7413afbc-856d-4875-ae32-f768c34e3526
3d3724b6-21c5-456f-8d26-069aefea3224	t	Bambiro	2d5b652a-1d25-43d8-82c1-282374fa59ea
ff409a97-0431-4c94-947c-c48d1ab97dc0	t	Bushengo I	2d5b652a-1d25-43d8-82c1-282374fa59ea
45675ec7-5d90-40a4-8786-322529051a66	t	Gafuku	2d5b652a-1d25-43d8-82c1-282374fa59ea
19489887-c903-4246-a4ba-23ee6c9a65c8	t	Mubuga	2d5b652a-1d25-43d8-82c1-282374fa59ea
8925b642-0fc1-458a-ba64-1d6b475d7062	t	Rebero	2d5b652a-1d25-43d8-82c1-282374fa59ea
feaa1f40-0df7-4d8e-aa34-c8da4968eee5	t	Buzuta	aad1acbb-933b-4af6-bf5b-c2d4aa0f6e43
09df6b32-15cd-4df2-aba5-bd1de6d22a8d	t	Bwiru	aad1acbb-933b-4af6-bf5b-c2d4aa0f6e43
3b6b097b-46cb-4da3-9300-f1c628ae9532	t	Ruvumbu	aad1acbb-933b-4af6-bf5b-c2d4aa0f6e43
27c145a9-3028-42e0-b3e0-6fbabd1bba9e	t	Rwangara	aad1acbb-933b-4af6-bf5b-c2d4aa0f6e43
e36dce7b-a3f3-48f3-aebe-d638406ecf4a	t	Bugesera	3776ba00-8d04-4ddf-98eb-7b03cedc93d8
c9bdc372-9caa-4b6b-b691-390a538081ed	t	Kabere	3776ba00-8d04-4ddf-98eb-7b03cedc93d8
e97c8a48-0c66-4d32-9018-571504996caa	t	Bisizi	79d41259-22b1-41ed-9221-032856812be2
bdbddc6c-267f-4550-9b57-ddd66ae856f0	t	Isangano	79d41259-22b1-41ed-9221-032856812be2
a80219dc-b771-4a09-adcc-5029a4abc6f3	t	Kitarimwa	79d41259-22b1-41ed-9221-032856812be2
f4876ca5-c2ce-412d-89f3-655d499c6d1f	t	Rutagara	79d41259-22b1-41ed-9221-032856812be2
1bad3db9-690a-44ca-8009-fe2b696587df	t	Buranga	0af901fa-9b09-4a68-8a85-228ab61c0233
8a6f89e4-7e86-4081-88f5-c3ad9c3b2cc9	t	Gahinga	0af901fa-9b09-4a68-8a85-228ab61c0233
60b2f9ef-ee6e-4222-acde-e4bb784df76f	t	Kanyukiro	0af901fa-9b09-4a68-8a85-228ab61c0233
ac7ca875-5932-4cf7-b81e-3778a789130d	t	Nyaruhengeri	0af901fa-9b09-4a68-8a85-228ab61c0233
b7474912-e5af-49d9-97b3-f25f81f221c5	t	Tagaza	0af901fa-9b09-4a68-8a85-228ab61c0233
d0d5c843-9694-492b-99f8-1f4f310fc0c9	t	Gatangare	773921ba-4669-481a-b782-639f2253653d
7cffcf0d-ec82-48f5-9130-a9ddb762d0b8	t	Gihira	773921ba-4669-481a-b782-639f2253653d
a447a566-ea11-49a7-b6c8-e6b161474858	t	Gisa	773921ba-4669-481a-b782-639f2253653d
3c5af5d1-ea00-4da1-8e8e-e9fb01447b9d	t	Kabashanja	773921ba-4669-481a-b782-639f2253653d
cec381df-f5a0-4c27-9a36-d179e9c516ec	t	Kaniga	773921ba-4669-481a-b782-639f2253653d
3a7d1609-1d68-41db-8de7-2ef9f59b0866	t	Ndobogo	773921ba-4669-481a-b782-639f2253653d
203a5363-9710-44a7-a071-b4186e02ae8b	t	Rusongati	773921ba-4669-481a-b782-639f2253653d
5bab5402-27ba-4be0-a9a1-243d16b471aa	t	Shwemu	773921ba-4669-481a-b782-639f2253653d
80f9ccdf-634c-42b8-bb5e-7056af982457	t	Amahoro	277eb3fd-a261-4f07-bae5-58e7bf64aacf
f6539083-d842-4622-866d-be258608c78d	t	Gakoro	277eb3fd-a261-4f07-bae5-58e7bf64aacf
69e2ab94-8c24-49e8-9d79-fa139d7a8f9f	t	Nkama	277eb3fd-a261-4f07-bae5-58e7bf64aacf
66c735bb-8219-4487-8f02-874186821f8d	t	Nyamyiri	277eb3fd-a261-4f07-bae5-58e7bf64aacf
a9045a40-d36b-4b6f-8a42-b37fad3f6df3	t	Ruhangiro	277eb3fd-a261-4f07-bae5-58e7bf64aacf
39603ea6-4cd3-4cec-bbfd-66341d50eed7	t	Gatebe I	f8caef92-9598-4745-aae7-b7d2e3f07ea2
15012c3e-ed61-4117-a31c-6c78f9994913	t	Gatebe Ii	f8caef92-9598-4745-aae7-b7d2e3f07ea2
f6261e5c-fc30-440c-98a6-f68bbf2987e6	t	Gitebe I	f8caef92-9598-4745-aae7-b7d2e3f07ea2
05c43200-149b-419b-91dd-8023923377ad	t	Kasonga	f8caef92-9598-4745-aae7-b7d2e3f07ea2
54733caf-1634-4e47-990d-ff1aef9f771e	t	Kizi	f8caef92-9598-4745-aae7-b7d2e3f07ea2
e75589b3-81a6-462c-aced-3b20be5ad1ed	t	Rusamaza	f8caef92-9598-4745-aae7-b7d2e3f07ea2
38c2cf6c-04cd-4248-a0df-64a32591a8ec	t	Kabarora	1d980e3a-6a49-429e-b614-65d4d9061280
ff3abc13-286e-4cd8-9919-35a258fdb901	t	Kibaya	1d980e3a-6a49-429e-b614-65d4d9061280
c3a041d5-cd16-4861-8116-68c43ff5173a	t	Nyantomvu	1d980e3a-6a49-429e-b614-65d4d9061280
47e8da1b-dffb-42c2-863c-9a6cf5e33e9a	t	Nyarurembo	1d980e3a-6a49-429e-b614-65d4d9061280
e127625a-5402-425b-b017-0213ad194681	t	Rukingo	1d980e3a-6a49-429e-b614-65d4d9061280
9239931d-4f52-40dc-becf-8a3d911204b2	t	Ruranga	1d980e3a-6a49-429e-b614-65d4d9061280
e4c6dee4-5780-40b6-ba0a-ac52959984b5	t	Busheke	148200fc-75f6-47e8-bc63-41ef3387075b
99c1aeb5-83ad-48ac-8b70-d579c25607bc	t	Butangi	148200fc-75f6-47e8-bc63-41ef3387075b
b10e275e-0702-4854-9955-f7b3e8a939a4	t	Butumba	148200fc-75f6-47e8-bc63-41ef3387075b
a3e649e8-503b-44e9-a9c5-836e2900e215	t	Kabashara	148200fc-75f6-47e8-bc63-41ef3387075b
aa848345-be51-4bf2-aa88-83fb069954be	t	Kazika	148200fc-75f6-47e8-bc63-41ef3387075b
2c809048-ce49-4cdb-aca4-88028e6fea93	t	Kimina	148200fc-75f6-47e8-bc63-41ef3387075b
282e071b-b414-4dfb-b6b2-7a281cb266aa	t	Byima	6af11253-cbbd-46f1-9582-512080ed9740
7263eff0-09d2-4655-a3c2-d980c2417207	t	Cyanika	6af11253-cbbd-46f1-9582-512080ed9740
4eef092a-0258-431f-a8a4-59e496795326	t	Gashovu	6af11253-cbbd-46f1-9582-512080ed9740
4be05fa2-1b53-4ba0-b5c8-33d066716f03	t	Gateko	6af11253-cbbd-46f1-9582-512080ed9740
4294f189-c544-4f7e-9f89-a17d252d560e	t	Kiroji	6af11253-cbbd-46f1-9582-512080ed9740
92e109f3-52cc-492f-8115-46b2e59be102	t	Mushoko	6af11253-cbbd-46f1-9582-512080ed9740
f5f324ad-0d96-43bc-b04c-41c3c53dfa2b	t	Rebero	6af11253-cbbd-46f1-9582-512080ed9740
a513330a-3802-4d07-a04e-a2aa58676a5c	t	Rohero	6af11253-cbbd-46f1-9582-512080ed9740
4b33c89b-1a04-4c9c-82c5-eb8790822288	t	Rucyamo	6af11253-cbbd-46f1-9582-512080ed9740
34606503-6b52-4ddc-9006-1e2ae358c689	t	Rwaza	6af11253-cbbd-46f1-9582-512080ed9740
a1455b7d-1d6e-48b5-9b30-6d803317fc1b	t	CitΘ	704bce49-b552-4056-9289-d422b4c93f4f
de05a45a-c8c6-4ff0-a637-0a14ec76c76f	t	Gatebe	704bce49-b552-4056-9289-d422b4c93f4f
6bd1293a-fb0e-4fff-a360-bd342d1e36a6	t	Kabeza	704bce49-b552-4056-9289-d422b4c93f4f
b08024d4-7255-4ea3-a4f4-568d4cec92e9	t	Mihabura	704bce49-b552-4056-9289-d422b4c93f4f
9af5c125-8f6b-4820-87b5-3ee5b557909b	t	Mubogora	704bce49-b552-4056-9289-d422b4c93f4f
a1cd46d3-196c-468a-857c-46c77c3d6282	t	Munini	704bce49-b552-4056-9289-d422b4c93f4f
b3511771-a015-4474-8ea4-b22e630d9669	t	Nyange	704bce49-b552-4056-9289-d422b4c93f4f
43240a6e-1ca6-41da-b030-18bd7e5bc6d0	t	Rubumba	704bce49-b552-4056-9289-d422b4c93f4f
cafb89ac-9678-4fad-919c-391ee7d53344	t	Buhanga	bbec4e32-e286-402a-9b7e-22a2700e1ca5
803f030b-c29f-4ddf-b2d4-590c61c2e428	t	Kabuye	bbec4e32-e286-402a-9b7e-22a2700e1ca5
ff855a9a-d468-49bf-ab99-e5070fb60706	t	Kiyovu	bbec4e32-e286-402a-9b7e-22a2700e1ca5
c5dbcc3a-f049-4959-a68e-5368e31950d6	t	Murambi	bbec4e32-e286-402a-9b7e-22a2700e1ca5
ce0a25b2-6155-44e4-bfd1-2facbf8eca02	t	Mwaro	bbec4e32-e286-402a-9b7e-22a2700e1ca5
90110c9c-f981-4c39-a281-c611836f0709	t	Pera	bbec4e32-e286-402a-9b7e-22a2700e1ca5
1d9f3c88-2431-4471-b41f-6e51fbb53b46	t	Gombaniro	23cf5d83-9ef5-4b70-97cd-6206a474831b
2c0b28fc-8bdc-4bfb-b085-0baf16d501fd	t	Kabuga	23cf5d83-9ef5-4b70-97cd-6206a474831b
7d4d828b-5559-480d-9b8a-3579e350cdbc	t	Kayenzi	23cf5d83-9ef5-4b70-97cd-6206a474831b
fdbc4db6-54e1-49f4-8d07-fec6aa8e066e	t	Mahoro	23cf5d83-9ef5-4b70-97cd-6206a474831b
7b06e0fe-ddc0-4fa1-95a5-03a1fbb6be63	t	Muyange	23cf5d83-9ef5-4b70-97cd-6206a474831b
faea0bab-911e-4cef-a969-d8d40c3e44de	t	Nyehonga	23cf5d83-9ef5-4b70-97cd-6206a474831b
cdf78f1d-2e16-44ed-be3d-3894f7ebbb60	t	Rubyiro	23cf5d83-9ef5-4b70-97cd-6206a474831b
e572e64a-2996-4864-9c6d-96db8eb01a79	t	Rusizi	23cf5d83-9ef5-4b70-97cd-6206a474831b
1616e1b1-858b-499e-8afb-089c5e09accc	t	Buganzo	c03ebbf0-f169-4c70-b36d-6709e73db551
81f7e639-31f8-4f8f-910a-1b19759c5ac1	t	Gasihe	c03ebbf0-f169-4c70-b36d-6709e73db551
55f2e6c4-7a54-41ce-99d5-c881993c5a04	t	Rugera	c03ebbf0-f169-4c70-b36d-6709e73db551
6f2da01f-b3b2-47f1-aa92-f27a744dc715	t	Rujagi	c03ebbf0-f169-4c70-b36d-6709e73db551
5f50cbb0-3f40-48d2-8b2a-8408a6d6b039	t	Karama	65fb9cfb-ec20-4adb-a4c3-58450745133c
5e6367cd-febb-430d-8dc4-ef39244f2549	t	Kareba	65fb9cfb-ec20-4adb-a4c3-58450745133c
706a0131-f45b-4836-830c-6e2f80f07784	t	Nyaburenge	65fb9cfb-ec20-4adb-a4c3-58450745133c
1db0c3dd-5a93-439e-b22b-7b5c21168daa	t	Nyakibanda	65fb9cfb-ec20-4adb-a4c3-58450745133c
19d169de-d4ae-435f-856f-b917af4fd5bc	t	Ruhinga	65fb9cfb-ec20-4adb-a4c3-58450745133c
c3310ccb-0c48-4072-b459-f0d189ecd6e3	t	Rwibutso	65fb9cfb-ec20-4adb-a4c3-58450745133c
3da23c1e-2950-4ec0-9349-5b6829e25dc9	t	Kirwano	950dcb06-f9ee-415a-b77f-0ea5e9ca28bb
e16dcc32-9fca-4a0c-b39b-314a389fae2d	t	Munkamba	950dcb06-f9ee-415a-b77f-0ea5e9ca28bb
1770a395-e028-4617-8329-5bfbeb26b5ef	t	Mwimerere	950dcb06-f9ee-415a-b77f-0ea5e9ca28bb
2edce005-8030-4568-a73c-1f7da6a73bb4	t	Ndengerezi	950dcb06-f9ee-415a-b77f-0ea5e9ca28bb
958a08c5-d70a-4dc3-a513-fac870acd87a	t	Rushwati	950dcb06-f9ee-415a-b77f-0ea5e9ca28bb
a8df526c-be1e-4ca5-b46b-4195c0a557b5	t	Bisengo	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
1c113e78-3ede-4563-84b6-1edd83a7870f	t	Byimana	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
f19ac21f-6288-485d-847d-039beeb46047	t	Gasumo	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
f066438c-a2bc-46d6-80c1-f00f601f0c89	t	Karambo	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
b20494fa-dd32-458d-a55a-36c3e4f2813a	t	Kigarama	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
d5b81457-a369-48e0-950d-51305fdd6187	t	Nyaruteja	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
04fcc13b-a8fd-49a4-9f7a-c68a6080d9e9	t	Rutovu	76abdad1-03d5-4a4d-9a7e-f29245d80c1f
b58ead8d-fef4-4b29-98ca-9bb1faf75b07	t	Kibonajoro	95ebe2e6-ec87-458d-9397-f519a8a43266
db7cbbc0-d76b-4bc3-a8ad-c17841c192fe	t	Rwamagare	95ebe2e6-ec87-458d-9397-f519a8a43266
a2ec9e62-2444-4070-a581-1b97ab6277f3	t	Matyazo	d79edc0d-dfed-4053-bf15-52278874f69e
69985265-1609-4fb7-80ea-6c954e237eac	t	Mbisabasaba	d79edc0d-dfed-4053-bf15-52278874f69e
09da32a6-5b9b-4572-ae00-347d0d2c2fd1	t	Mudasomwa	d79edc0d-dfed-4053-bf15-52278874f69e
43ded312-16f0-43cd-9a36-64f4166e2ef4	t	Mutara	d79edc0d-dfed-4053-bf15-52278874f69e
337b97a3-e221-4375-be48-0ea1a143903a	t	Ruhondo	d79edc0d-dfed-4053-bf15-52278874f69e
ef018290-4914-4c8c-91e6-18e2a67736fd	t	Runege	d79edc0d-dfed-4053-bf15-52278874f69e
b5694c58-abc6-44cc-812d-2566357dc03a	t	Rutobo	d79edc0d-dfed-4053-bf15-52278874f69e
be4870e5-6db7-4a28-a6a6-d020bf9b894b	t	Muyebe	6fe814f3-1c13-4ce1-a63b-28e9ea566500
8d607b87-afff-47a0-8037-5bd40adb4400	t	Nyabigoma	6fe814f3-1c13-4ce1-a63b-28e9ea566500
be873770-02b6-4121-ae42-800435f29c1e	t	Gakopfo	19dd961b-dff6-4b92-bbca-72c2c156c285
aacb617e-bd76-4ff5-a810-3829e25b1c04	t	Muhiza	19dd961b-dff6-4b92-bbca-72c2c156c285
8f9994ae-056b-481a-b718-40cd23b4cd83	t	Rwamisave	19dd961b-dff6-4b92-bbca-72c2c156c285
d4ec5a07-04bd-4d01-bc77-122f717f7937	t	Banamba	fcc301d5-3850-4a7d-8bc2-8ce854700d3a
889d4677-a8f2-47db-91d1-c31ef0421c62	t	Kabuga	fcc301d5-3850-4a7d-8bc2-8ce854700d3a
85efc360-683f-49ef-ba6c-97001deb5c6d	t	Nyamirambo	fcc301d5-3850-4a7d-8bc2-8ce854700d3a
1d05d802-3a48-45d1-826d-6b83757b3980	t	Runyami	fcc301d5-3850-4a7d-8bc2-8ce854700d3a
6eb83fb7-ad94-4901-9168-699f65d368c0	t	Runyovu	fcc301d5-3850-4a7d-8bc2-8ce854700d3a
87cb5c8b-ea78-493c-b346-22ae26ab9ee0	t	Mariba	d33db643-cfeb-42b6-b991-519f76bbfea6
d4488e6d-2205-4b52-99a3-ca9c17f9b582	t	Burama	d33db643-cfeb-42b6-b991-519f76bbfea6
9c4d4ab3-4df2-413b-9cbe-b41fa80874c3	t	Ryagacece	a406e98a-bfdf-47bb-bc0e-edd5e20a956d
ae694426-b934-4c97-966d-b3181b4966f1	t	Gatare	16dcbb78-7e38-454a-b982-3075957ad973
c39e25d2-80f6-4cc6-a89f-4cc219436784	t	Munini	16dcbb78-7e38-454a-b982-3075957ad973
31e7cebc-1c26-48e7-9d06-d5e4ecaeb1f1	t	Rango	16dcbb78-7e38-454a-b982-3075957ad973
935257d8-7707-4633-9db3-6cf51ae4edc8	t	Mubuga	952c775f-1af6-42e2-8a70-07f7a1083bad
0a8075b7-babf-40dc-80b2-bcbbe529481c	t	Mukaba	952c775f-1af6-42e2-8a70-07f7a1083bad
465e16e1-a120-4638-a2b9-6b51740e771f	t	Rango	952c775f-1af6-42e2-8a70-07f7a1083bad
d91dc4a0-0f55-46c7-8ee5-deca575b7aa3	t	Torero	952c775f-1af6-42e2-8a70-07f7a1083bad
26d50f38-243a-4ffe-b880-07c10ea167c2	t	Gacyamo	6cd83c32-87dc-451e-a836-90cc93720f53
bf20ec7c-f2df-438e-84c0-6332203f3a25	t	Kamonyi	6cd83c32-87dc-451e-a836-90cc93720f53
c2dcbf8a-458b-47a3-98e3-af2cfe6ebd03	t	Mashya	6cd83c32-87dc-451e-a836-90cc93720f53
4ce36ece-b88a-44c7-b5a4-d536c136e094	t	Nyabihanga	6cd83c32-87dc-451e-a836-90cc93720f53
5ab1c322-6c1d-4449-b1f5-eb11a3dfb40e	t	Rebero	6cd83c32-87dc-451e-a836-90cc93720f53
3d93494a-8fbd-4a77-8e34-db36f5c4254a	t	Kagikongoro	ed6d74ad-1f50-4a97-8a00-4081b5b146c9
ef7346da-d14c-49ba-86da-30bcd3c6e1b0	t	Mibirizi	ed6d74ad-1f50-4a97-8a00-4081b5b146c9
b27a06f6-114d-4379-af25-531410ad4f55	t	Gakombe	6a7df2cf-9fb1-462f-985e-83cb5b00ef5c
eb940d1d-66af-439d-b503-5fcc1d1dece6	t	Kabeza	6a7df2cf-9fb1-462f-985e-83cb5b00ef5c
a210a1b8-497e-48ab-860f-ad47a8c36f77	t	Rugende	6a7df2cf-9fb1-462f-985e-83cb5b00ef5c
0e644e85-8b3e-4921-8df2-5e6a0b613730	t	Kamuhana	9ff034a3-9565-4be5-93dd-5b2cff727598
695550f7-7dd6-4564-9209-3c36461f4690	t	Kiremereye	9ff034a3-9565-4be5-93dd-5b2cff727598
9559c62f-83b8-4c4c-8845-c1d686a5f890	t	Misave	9ff034a3-9565-4be5-93dd-5b2cff727598
378c6697-3f69-4063-ad0c-043b4acb269b	t	Nyamutarama	9ff034a3-9565-4be5-93dd-5b2cff727598
a7a91782-11cd-4825-b483-ee9bf16f5e92	t	Ryagatebe	9ff034a3-9565-4be5-93dd-5b2cff727598
0b4aae59-fa0d-4b7b-8fdb-4e3db3be5343	t	Burembo	821c6a6e-2885-46c3-91b4-fec799d89462
98e5ce2b-89c4-46d9-9fb6-9e243567f8fd	t	Kabeza	821c6a6e-2885-46c3-91b4-fec799d89462
c43bab26-149c-4e74-89ff-6942c8f1aee4	t	Murinzi	821c6a6e-2885-46c3-91b4-fec799d89462
cb88d4fc-9bb1-453a-9346-3747c45d136f	t	Buzi	ff3937db-f196-474d-ab77-bdec4b959ac1
3425e926-ce79-4f67-b9f9-72866435c442	t	Gacyamo	ff3937db-f196-474d-ab77-bdec4b959ac1
fd7a5a99-b908-44e2-8157-ee1ab1305f26	t	Kabuga	ff3937db-f196-474d-ab77-bdec4b959ac1
362fe991-abfc-4ff9-af0a-48fcf0fd5bf3	t	Kagarama	ff3937db-f196-474d-ab77-bdec4b959ac1
23f091b5-c6a7-43dd-8582-0bbd33e99518	t	Ruvumbu	ff3937db-f196-474d-ab77-bdec4b959ac1
fbc8ddeb-f5b6-4c2a-99b1-4e9b46865cb3	t	Murambi	ba150e02-329f-4b27-9d6f-6018b87f341d
9a771921-0bd7-4466-8314-9d492cf580c7	t	Rwumvangom	ba150e02-329f-4b27-9d6f-6018b87f341d
d8c3100e-1ea4-4f98-88b9-e5d989f08c3a	t	Wimana	ba150e02-329f-4b27-9d6f-6018b87f341d
3cef8b5e-a517-4f4e-86d3-17fe4f17b977	t	Isha	307e96f9-368e-49b6-a23a-23f054432b93
693f9195-f191-419c-bad4-d7a1389dc6c4	t	Gahinga	f3612641-2293-4782-a340-12ca6baf2de7
a21acd0c-fa45-4e7e-9922-be4c3e344c1c	t	Gahurubuka	f3612641-2293-4782-a340-12ca6baf2de7
c09669c4-511d-4d06-9b64-e6b19750892e	t	Rwamiko	f3612641-2293-4782-a340-12ca6baf2de7
7ebec9cc-18ed-4fb0-944c-ec9ff68d34b5	t	Bubanga	212321e8-c546-4784-8cad-dfc934610e55
6ecb28c9-a91b-42e3-947e-fce03f9f852b	t	Kabujyogoro	212321e8-c546-4784-8cad-dfc934610e55
e258d35c-e6c6-48f7-931a-f132c1f92268	t	Karambi	212321e8-c546-4784-8cad-dfc934610e55
3eedc0d3-c33a-4777-b96a-6fc36a5abafe	t	Kigenge	212321e8-c546-4784-8cad-dfc934610e55
696090a7-39bb-4ec6-9268-89a0d3af72db	t	Ntura	212321e8-c546-4784-8cad-dfc934610e55
2ded93ad-d4ca-4a2c-8c9a-a6dbeede0ad3	t	Rebero	212321e8-c546-4784-8cad-dfc934610e55
f0043d84-6f02-4bdb-8b0c-5238f16ea320	t	Kamuhoza	fa35b13a-7e6c-4f11-b286-901d90d00522
168a94bc-2483-4475-a8e5-7fc886d369fe	t	Munyove	fa35b13a-7e6c-4f11-b286-901d90d00522
c788f4cc-940e-44ea-ba0b-338de0500042	t	Cyapa	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
c18feb2a-87b8-41f3-a711-8883ced2012f	t	Gacamahemb	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
e87d6abe-6a97-49f5-9241-2593b761f72c	t	Kamabuye	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
2784605d-56fd-4dc1-a491-e1239955fda2	t	Kanombe	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
fd26f13f-2550-410f-a5e5-9b062a4a91e2	t	Karangiro	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
a7fa77a6-30de-4cb2-b4e2-c842a7a5b829	t	Karitasi	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
e6ee12b5-ed0f-4271-b99c-9ad56d9747a6	t	Karushaririza	3b2d6ddc-c37d-4d5c-aab8-76ecb1128d2a
23c6129a-baf3-4248-babb-0f304d2c1ec6	t	Mpongora	b2325290-e43f-4bf2-b870-e6a1a7022e29
f63db078-a6bc-4f38-a878-c53ae665862b	t	Tuwonane	b2325290-e43f-4bf2-b870-e6a1a7022e29
72b08c52-ca6a-49be-b8a0-7bef851435c4	t	Rubenga I	fb844e9e-56de-4c06-a401-b1e531096406
08074637-d944-48c3-a61b-24e2896bdf72	t	Rubenga Ii	fb844e9e-56de-4c06-a401-b1e531096406
62d89594-cd8b-4e21-876c-6840da73b35d	t	Cyinzovu	7037f7a5-c9cb-4b28-abfb-86b57c69237e
f81e0322-e9b3-42ed-a819-22039263f498	t	Gahwazi	7037f7a5-c9cb-4b28-abfb-86b57c69237e
5d238c5d-503c-40b8-a00d-8dbce9ddd336	t	Kamanyenga	7037f7a5-c9cb-4b28-abfb-86b57c69237e
46930fa4-75ab-4381-9423-5982921f7321	t	Muhari	7037f7a5-c9cb-4b28-abfb-86b57c69237e
5a2cb3c4-3a82-4c21-a54d-21be4211ed00	t	Munyana	7037f7a5-c9cb-4b28-abfb-86b57c69237e
5b30f44d-813b-4aee-9014-77a02d3de718	t	Ngoma	7037f7a5-c9cb-4b28-abfb-86b57c69237e
4f1bedaf-799b-4c84-a15b-968f06720df8	t	Bisanganira	b25c7a10-8812-488e-8ce5-a8892ec5cf21
9404bb59-c778-4b83-80fe-6d74b4a02a29	t	Gitwa	b25c7a10-8812-488e-8ce5-a8892ec5cf21
ffef1229-7711-4a61-8969-33e95b64fdc6	t	Kanoga	b25c7a10-8812-488e-8ce5-a8892ec5cf21
e07cbcd3-3d0b-4484-b28a-3e9b5e9eb780	t	Nyagatare	b25c7a10-8812-488e-8ce5-a8892ec5cf21
bac82903-a65b-449e-951a-f61004751225	t	Shagasha	b25c7a10-8812-488e-8ce5-a8892ec5cf21
11528595-680d-4b18-90dd-c1f24bccefad	t	Gitambi	748bd728-7aca-46f6-b4ca-91e9430f433b
80aa466d-72be-46a3-a33c-3c984b80241a	t	Hinduka	748bd728-7aca-46f6-b4ca-91e9430f433b
27fe9980-20d2-4418-a23a-b176920551eb	t	Ituze	748bd728-7aca-46f6-b4ca-91e9430f433b
c41ba8b5-567a-4b9e-863c-0c3f9664e724	t	Kamabuye	748bd728-7aca-46f6-b4ca-91e9430f433b
1d46db6d-aee7-4ac6-83bf-2898932c9a9f	t	Mubera	748bd728-7aca-46f6-b4ca-91e9430f433b
ae2baef9-c21e-40f6-a913-64f04cee998e	t	Mutonga	748bd728-7aca-46f6-b4ca-91e9430f433b
59bc8572-9b25-468e-a50c-93a3593eae87	t	Ruhango	748bd728-7aca-46f6-b4ca-91e9430f433b
c252b795-60a2-4afe-bc14-7f9e8ee1264d	t	Rukuraza	748bd728-7aca-46f6-b4ca-91e9430f433b
85ea9a9f-37c3-480f-a094-a031ea4de27b	t	Shanike	748bd728-7aca-46f6-b4ca-91e9430f433b
ca128899-a856-40eb-852a-f4e66df75974	t	Birindiro	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
71956a6d-1a13-4023-90f7-cb20cb6a5f3b	t	Busarabuye	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
3e2615f0-8196-40f5-82fa-33ad760bd5c4	t	Bushenge	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
4102b3cb-b246-41b9-adb8-1b250f250fbd	t	Gihomba	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
1b36d9d2-5445-4d7b-abf8-63e2594b1d0c	t	Kirume	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
4af1a7ec-343d-483e-b6c9-358f78ce5a35	t	Matyazo	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
969a99b6-f1f9-4d19-b489-9961c0338991	t	Mpuzamahanga	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
2a54d4ea-0933-4cca-a12d-8d6faedd985f	t	Mubuga	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
14256166-ed8d-4eb7-8598-e0ef994659e9	t	Nyabihanga	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
4fc2d240-b4dc-4dff-ae38-e22ae18d0961	t	Rebero	dec792c2-2a19-4ab3-a4b5-3e6cab86af15
a59af4b6-6eae-4fdb-b800-976707330d3e	t	Binyaburanga	fe6d04b8-714e-48e3-86a5-ce39b9794e09
2159a5fb-754a-4157-a425-8a525253ecf7	t	Buhinga	fe6d04b8-714e-48e3-86a5-ce39b9794e09
d92d4d52-3b7a-44c0-a6f1-e33ede128fc0	t	Bumaranyota	fe6d04b8-714e-48e3-86a5-ce39b9794e09
544a6d06-a9e0-47db-9b5b-6b536b6cf714	t	Kabugarama	82a5afa2-6f56-410d-b75e-fe38890b35c6
5c5baf3c-ab85-4c1c-bec0-419f052850d2	t	Mpinga	82a5afa2-6f56-410d-b75e-fe38890b35c6
fbe71700-5b8c-4f9c-b561-41aa8bdf4a45	t	Kamagaju	82f84d0a-290f-487d-94b6-05f98f131a9a
fa11bddc-3a8a-48fd-aa4c-d3bc61920703	t	Njambwe	82f84d0a-290f-487d-94b6-05f98f131a9a
9ef09b7f-6e63-412f-b7a8-4c102f5c4bf3	t	Nyakibingo	82f84d0a-290f-487d-94b6-05f98f131a9a
41940ef4-3717-4952-8656-117a2ae6bc99	t	Nyamaganda	82f84d0a-290f-487d-94b6-05f98f131a9a
ee886508-ef52-4619-9c46-f6c2aa33600a	t	Nyantaba	82f84d0a-290f-487d-94b6-05f98f131a9a
b93d1c22-1c4b-4e2b-b272-96266c8de2d2	t	Kabonabose	2787e16a-6390-424f-b626-cca470469db5
3afd1330-7cea-4396-af04-0f943a7538fe	t	Karambo	2787e16a-6390-424f-b626-cca470469db5
eb3bfc3e-0252-425a-bab2-e07389137e77	t	Kirehe	2787e16a-6390-424f-b626-cca470469db5
2236fb0c-19eb-4ae6-9548-073d73ba484f	t	Idaga	c2efc3c8-a878-4cce-a583-c89e5980eba5
3565d736-25b4-42cc-99b5-0f213dcd4831	t	Kankuba	c2efc3c8-a878-4cce-a583-c89e5980eba5
8c7a1328-44d8-4c7f-8262-775b6c0ef51f	t	Nyakivomero	c2efc3c8-a878-4cce-a583-c89e5980eba5
6b2875cb-15aa-46f2-b415-55dfb1ee4c58	t	Gatovu	43248804-2f12-4415-8bfa-8eec0130e06f
fdcc7933-35c7-4840-9ba6-092e8f82fad0	t	Karambo	43248804-2f12-4415-8bfa-8eec0130e06f
f0051d49-4050-4527-8dc7-1bc6285f0acc	t	Karangiro	43248804-2f12-4415-8bfa-8eec0130e06f
cca44efd-b677-49e7-b0b3-ca58a5818d23	t	Mont Cyangu	43248804-2f12-4415-8bfa-8eec0130e06f
6c14ab84-93d1-486d-b465-82938a652962	t	Mundima	43248804-2f12-4415-8bfa-8eec0130e06f
dca936bb-d909-4e14-8f37-8c8962fcb934	t	Ngoma	43248804-2f12-4415-8bfa-8eec0130e06f
8449a2c7-250a-42fe-ad10-6cf227ebf74f	t	Ntwari	43248804-2f12-4415-8bfa-8eec0130e06f
e3e0e6b0-f947-481a-9766-24ef172c4cf4	t	Batero	d2dde728-8784-4eab-8e05-be04371078b5
37a4cd45-2dc8-46c3-af5f-bea7f1fa77bf	t	Burunga	d2dde728-8784-4eab-8e05-be04371078b5
d75e447e-5c59-40f2-b1c3-7ae8c4363f25	t	Kabeza	d2dde728-8784-4eab-8e05-be04371078b5
25f319b7-ff72-4115-8589-4e89e1a2deb2	t	Munyinya	d2dde728-8784-4eab-8e05-be04371078b5
65ac737d-30a7-4823-83c7-74850512aaae	t	Murambi	d2dde728-8784-4eab-8e05-be04371078b5
b64054f4-02b9-4358-9e3b-bc373c2f3d44	t	Amahoro	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
8bafde95-e788-4ce4-97c1-6d9d49fac4f8	t	Badura	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
2c27f31d-9a91-4d6e-96fe-99ac670eb27d	t	Kadasomwa	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
57d10745-df3a-4603-9019-efbd932ee915	t	Kannyogo	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
96fb1261-51b6-49de-8998-3a03e17c82a0	t	Mbagira	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
8c70055d-be25-4224-beed-35b2d3e2ca45	t	Mucyamo	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
a4d6bea2-73ba-4081-a464-236ed86f08be	t	Ntemabiti	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
c88ebf50-6535-40e1-9069-b4eff140c075	t	Nyakayonga	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
13e2de88-beef-442b-9983-e4efa9a7d474	t	Rushakamba	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
515e991e-47da-4527-97a0-2ffa87867a6b	t	Umuganda	1f227be5-e1d1-4c7f-a6dc-38970ed96f20
a9807323-e85a-4999-8ad0-a41e12aa9bdb	t	Cyapa	a7d18bde-3404-49ce-98f4-f374617c56f9
3796ff4f-d55e-4f47-9f84-0969e57447f3	t	Gikombe	a7d18bde-3404-49ce-98f4-f374617c56f9
a5c616c7-9ad5-4863-847c-c2b52f44c384	t	Kamuhirwa	a7d18bde-3404-49ce-98f4-f374617c56f9
e0986926-4557-49b3-94cc-70aa5c387085	t	Murangi	a7d18bde-3404-49ce-98f4-f374617c56f9
78be9203-f434-4671-8835-0fb2e18f5b90	t	Kadashya	0f716c8b-ed3e-4c0b-af36-bcef898aed7a
71bb5ddf-fd91-4221-a2a3-6e285825bba7	t	Kamubaji	0f716c8b-ed3e-4c0b-af36-bcef898aed7a
303ba09a-8a53-4945-802d-b63a445461fb	t	Murindi	0f716c8b-ed3e-4c0b-af36-bcef898aed7a
5d62cd05-afa4-4943-b5dc-fdfc3bcb14f8	t	Gashisha	f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7
842e80b8-8684-4fb2-911e-508a32c27dd1	t	Kabamba	f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7
1212e87b-3638-4205-9973-c34f6dae4894	t	Murira	f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7
125636f1-8e75-4dc5-b6be-a105905da8c3	t	Nyakagoma	f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7
260d2584-d198-4967-bc07-12d87dfeafbf	t	Rubumba	f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7
59153aae-211c-4c7c-a37b-4e32ee343abb	t	Rungunga	f51abfc3-0700-4f3e-b1cd-6a953a0e9fa7
b15caa43-5d10-4d7d-aa7a-a14d77f5628f	t	Gatanga	3e0d51fa-e77f-4395-939a-b60aa5bffa47
a8193264-7bf8-468b-a42c-69ed8b347085	t	Kiyovu	3e0d51fa-e77f-4395-939a-b60aa5bffa47
97bf2fdf-f96d-479f-a34f-afd233a4348a	t	Rugaragara	3e0d51fa-e77f-4395-939a-b60aa5bffa47
4f95f44e-26a6-4d97-bd1f-7f3d39221ec9	t	Busasamana	ddee841f-2e4c-47bf-8dfe-d122983a4dce
f557605b-e117-4eff-aabe-928f9c622bd5	t	Gakenke	ddee841f-2e4c-47bf-8dfe-d122983a4dce
196d39db-96e1-419b-9be8-5e2160539da3	t	Kabarore	ddee841f-2e4c-47bf-8dfe-d122983a4dce
df638649-8138-4edd-9321-72c65b1300bc	t	Kamabuye	ddee841f-2e4c-47bf-8dfe-d122983a4dce
e23e8aea-bc8b-4385-a2db-d1457ba929ec	t	Murabyo	ddee841f-2e4c-47bf-8dfe-d122983a4dce
390e51b8-044a-486c-91d1-28a800d6b89f	t	Nyabishunju	ddee841f-2e4c-47bf-8dfe-d122983a4dce
97a34110-4d30-4ef6-8e3d-1dbf0bbc50cf	t	Nyenyeri	ddee841f-2e4c-47bf-8dfe-d122983a4dce
97ce8be8-792b-4809-8b7f-f37925402f6d	t	Ramiro	ddee841f-2e4c-47bf-8dfe-d122983a4dce
bdb106ed-9a26-421e-945f-94f2d0d6b54a	t	Rubeho	ddee841f-2e4c-47bf-8dfe-d122983a4dce
a268f5a0-403c-4123-9137-531e8a328cbd	t	Buremera	0be18aa4-9782-48a2-87f2-b57519458e91
5d1c7d23-1c58-406c-a3c2-51035b5bcd2a	t	Cyirabyo B	0be18aa4-9782-48a2-87f2-b57519458e91
ed33a3b3-37b7-4664-94f9-ab1522234dab	t	Gipfura	0be18aa4-9782-48a2-87f2-b57519458e91
fa2e343b-e3a0-4f6b-bb1e-207160a75366	t	Kamarebe	0be18aa4-9782-48a2-87f2-b57519458e91
b279c79c-598b-4636-a830-80ba658e8807	t	Kanunga	0be18aa4-9782-48a2-87f2-b57519458e91
10632576-e686-4303-ba6b-50d1be589a30	t	Mutara	0be18aa4-9782-48a2-87f2-b57519458e91
61793ada-8551-43cd-b6cb-89bc68590111	t	Kabahire	d5acf5ef-6dca-4268-b9a1-c17dc8f8f9b1
2cbec871-3ea5-4824-b7e5-bec468d3a370	t	Winteko	d5acf5ef-6dca-4268-b9a1-c17dc8f8f9b1
f5fdd00b-41b2-407a-9811-ff96e0deda28	t	Bitongo	802961df-47b3-40a3-b431-10c0c6bce9c9
7e608d2e-d1e1-46e5-a00e-2ce37d8acd9e	t	Cyete	888d6a61-0c62-40a7-9505-82325210c620
00b5e2c8-24e9-454d-8b8a-58606eb64b7a	t	Gikungwe	888d6a61-0c62-40a7-9505-82325210c620
3af614ab-87a5-48cf-8b86-87d8832a5c93	t	Gitwa	888d6a61-0c62-40a7-9505-82325210c620
ad051e3b-2eaa-4c9a-b9b5-d94a4011800f	t	Kamatene	888d6a61-0c62-40a7-9505-82325210c620
a6903038-1800-4469-8d3f-51af4c8474cb	t	Bugayi	61020553-76d6-4fe8-8e10-7931eb42d9bf
fed46029-0eb5-4e7d-81a5-c63269bc74de	t	Gihango	61020553-76d6-4fe8-8e10-7931eb42d9bf
3dbc8913-fbb7-438f-92cd-3ec9fe0a3ffc	t	Kagarama	61020553-76d6-4fe8-8e10-7931eb42d9bf
6a6ea425-bce3-474a-bae5-48b6d89e3bfb	t	Ruhimbi	eb31b78a-8dc7-4f41-a134-3476c1ac6961
1399030f-8563-4d78-a94e-e61e9212c4c4	t	Byangoma	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
b8d70432-cd93-4471-905d-f214a3d2e50e	t	Cyandarama	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
cc1d02a1-79d0-4453-853d-e51423b58466	t	Gatimbwa	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
0b3151b4-d4f9-43f9-9688-2cdd0ec6db14	t	Kamutongo	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
977926c3-94b0-472c-a889-d4597f5017e6	t	Karanjwa	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
89e87724-7238-445b-900f-e66584125d88	t	Mukorazuba	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
c37070c6-4e01-49f3-b2b3-9f5357d3373b	t	Mutongo	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
74c9e0dc-63c8-483c-9e6a-5cefb3d0bea0	t	Rugerero	0d739e5c-3641-48d0-8c62-ad9a4b0b7c4d
593d4dc0-cc53-4bfe-bcea-35112bea095c	t	Burege	73322067-c3a0-4dd0-b78f-e02c42c585eb
87ed2a6c-aac1-468b-90d9-a917ffbc64a7	t	Kanyombya	73322067-c3a0-4dd0-b78f-e02c42c585eb
82f99986-2a76-4638-bdf9-bd36d4e84436	t	Muhonga	73322067-c3a0-4dd0-b78f-e02c42c585eb
87561b5b-6578-45fa-b0f6-81b9b495b6c7	t	Rugarika	73322067-c3a0-4dd0-b78f-e02c42c585eb
04082a50-8c9f-4746-a04a-2c11210b11e6	t	Hepfo	77f4f797-c9f2-4fd7-b685-d345cd9bd484
a5ec971e-5990-411e-8aad-1bdb43c0f851	t	Gafoka	ff5ee8b6-930d-45fc-b3bd-ccec424aa4e3
f8724802-9597-4578-b09f-9558cd4a0544	t	Rusunyu	ff5ee8b6-930d-45fc-b3bd-ccec424aa4e3
5d17d3ca-ccf6-42b5-8d58-4e5ccab6adce	t	Kabutimbiri	7ec4eff0-4b5f-4b8f-b97a-2cf04bc2fc69
4b228d10-69fe-4bdb-a0b1-a2f2e44b2255	t	Kinyaga	7ec4eff0-4b5f-4b8f-b97a-2cf04bc2fc69
c1a0b672-9863-43e0-9d3f-607dbc7b3c49	t	Rugaragara	7ec4eff0-4b5f-4b8f-b97a-2cf04bc2fc69
296a0204-fdf7-44ca-b7ea-e0b67bba9f26	t	Sumoyamana	7ec4eff0-4b5f-4b8f-b97a-2cf04bc2fc69
fed5a2c9-605d-4dfb-b8e8-8aaa52d93870	t	Bitaba	3f4fd1dc-b04e-4612-bdd3-18ed00da5ef5
fc7f7a0e-f309-4c2c-87a4-4db4e52d5d19	t	Kagarama	3f4fd1dc-b04e-4612-bdd3-18ed00da5ef5
3c36681e-ba7a-45bc-9dc7-23f399f80b6e	t	Kamahoro	3f4fd1dc-b04e-4612-bdd3-18ed00da5ef5
96fed1b7-bf4d-4b37-83a1-b0a0050ba6b8	t	Karambo	3f4fd1dc-b04e-4612-bdd3-18ed00da5ef5
8fa625f6-6d55-4b6d-adfe-effd20bf3726	t	Rebero	3f4fd1dc-b04e-4612-bdd3-18ed00da5ef5
8f23e08e-0595-45d1-ae0c-b48b048d0d3d	t	Gisunyu	31bc36d8-d739-499c-9f13-35f9835bd0ac
6a924de5-db33-4222-9a13-b1b5280455ad	t	Giteme	31bc36d8-d739-499c-9f13-35f9835bd0ac
21a80baa-59bf-4237-977f-c28e962502d1	t	Kabashinga	31bc36d8-d739-499c-9f13-35f9835bd0ac
07a39b1a-b803-4924-9fae-2a934fe38379	t	Ngoma	31bc36d8-d739-499c-9f13-35f9835bd0ac
60d6906c-4256-4a6c-8309-4c7fd1f9a5ff	t	Nyawenya	31bc36d8-d739-499c-9f13-35f9835bd0ac
ced47e9d-5a75-48ad-9aa8-22037cf4fc94	t	Rebero	31bc36d8-d739-499c-9f13-35f9835bd0ac
390f77f3-d790-4d3e-a7f2-dae21c415818	t	Nyankumbira	2f51db96-c35b-4e84-9a15-0ae919e23dc9
99593fd2-64cf-4ed6-9999-0ce74cb2fc77	t	Biraro	57c20775-8383-434b-a4d9-d96d716efec5
4688a433-648c-45c1-abda-c9e1ab0f75ac	t	Kaboneke	57c20775-8383-434b-a4d9-d96d716efec5
81446133-feb9-4e22-a753-8c15870294fc	t	Kabuga	57c20775-8383-434b-a4d9-d96d716efec5
04642421-2686-482a-9483-9396275d58c4	t	Mapfura	57c20775-8383-434b-a4d9-d96d716efec5
5289e380-ca24-4687-bf9b-afc236762fc1	t	Gashara	bc89e069-2593-4453-831e-a82056659855
dbdefbb6-c2c1-41eb-9baa-381ad20c3643	t	Kabuye	bc89e069-2593-4453-831e-a82056659855
8e7804f1-3dca-4b57-99ca-1cf4d73bc76e	t	Kanyinya	bc89e069-2593-4453-831e-a82056659855
82b04ae4-fcd4-40c7-bb9c-5be5e01abc7c	t	Muhora	bc89e069-2593-4453-831e-a82056659855
7a26e18f-e5f7-4651-a7a2-46c92673b5fc	t	Gituro	72d90a76-30c1-426e-8ac0-895bdbb9c279
e8e660b9-2cf7-4ed7-b195-6a632fc78584	t	Nyabintare	72d90a76-30c1-426e-8ac0-895bdbb9c279
781be2bb-8c90-45e8-acba-e2f423f97684	t	Rutarakiro	72d90a76-30c1-426e-8ac0-895bdbb9c279
e9c62671-337f-4e85-9f1e-4fbe8dd637e4	t	Cyandarama	424fd75f-1eea-4478-b417-0ce0296525e8
db00b3c4-7522-426a-82be-90568e8ae54e	t	Njambwe	424fd75f-1eea-4478-b417-0ce0296525e8
161ca988-fbef-4478-8d7e-1cd7ee1437be	t	Rutegamatwi	424fd75f-1eea-4478-b417-0ce0296525e8
046c36b1-9929-4c87-a00a-d0500cf415eb	t	Byugaro	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
eae0b1cd-a027-4bc4-94cf-f4dd7c2ec904	t	Gasarabuye	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
e0020f63-cf2d-47c3-8053-2627688a9d92	t	Kabigohe	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
8fb90989-ef8c-4154-8088-c1ee750669c9	t	Kabuga	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
26dda50d-c6f5-4fe7-b9ce-103960ee566a	t	Kabuganza	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
f78fb0a3-0652-41de-a35b-0b462819e64b	t	Kadashya	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
d9bf2bf1-29a7-4a96-980c-17ac18fd5e6f	t	Karongoro	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
5b2217b5-e9f0-4fb6-94e9-f475ab378aaf	t	Mpinga	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
efaf6942-2cb5-402e-a645-c070b78090f8	t	Rebero	c2020ba8-bf72-40b4-b81e-5dec98b7e9a3
7a633ca5-a197-4e06-bd16-e67edd4ed2c6	t	Gatondo	efe65fb3-3dc6-4230-8e49-f89a66d784ce
b1a7e943-759d-407a-9b9c-006c0f6c45dc	t	Honga	efe65fb3-3dc6-4230-8e49-f89a66d784ce
cae0d42a-7ed8-456d-9df7-f404b7038b3b	t	Kabinyugwe	efe65fb3-3dc6-4230-8e49-f89a66d784ce
b72eb390-7518-499a-bd90-389121b269cc	t	Kamajumba	efe65fb3-3dc6-4230-8e49-f89a66d784ce
d62b057a-1176-40e5-8e75-6317b2718069	t	Muhora	efe65fb3-3dc6-4230-8e49-f89a66d784ce
67c6ec70-2f32-49b4-af28-e689d3da1b93	t	Gako	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
b958a251-581e-4c2f-82bb-d2c0505b81a1	t	Gatarange	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
194406e7-0c92-4206-aa94-2ecb77dbdcf4	t	Kigurwe	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
4480b3de-fe56-41a4-ab49-9764a76ad3bd	t	Kinanira	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
447a8eac-da2f-46aa-a999-61b51f2fe874	t	Kiyanza	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
924cb98e-eeda-46c9-a867-93aa22b57701	t	Nyarushishi	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
6814444e-758d-4969-83cf-24bf3eadb6f8	t	Rugabe	8c3bbdd4-3fe2-4d71-b7e7-40ff968296f2
4e0a3062-99e0-46fd-89ba-94f49ddfaa61	t	Gacyamo	3601c397-8953-409c-bd66-03cb8fc4d24b
f6c4fc94-6b56-4e9c-baa1-5ddece270132	t	Gahuna	3601c397-8953-409c-bd66-03cb8fc4d24b
f7d3b417-f325-4df5-8808-00a95b25bc4c	t	Gashyuha	3601c397-8953-409c-bd66-03cb8fc4d24b
e4fd82ec-3398-4ce4-9c4e-d5ee66a54abb	t	Kanoga	3601c397-8953-409c-bd66-03cb8fc4d24b
ce1302bd-49e2-4a0c-9b91-3792d3c37bbd	t	Kaveya	3601c397-8953-409c-bd66-03cb8fc4d24b
89645a76-3ee8-4b15-b7e6-92071f344518	t	Kagabiro	9f6ba8a8-9f12-4be4-b033-ca515609c12e
09a083bf-0d5e-4d4a-821a-26650a038172	t	Bugumya	65507ac0-2124-471e-9cd0-77d3803fa053
3f98d7d2-9160-4325-9739-974b6207f042	t	Gatare	65507ac0-2124-471e-9cd0-77d3803fa053
f78ac807-98b3-478c-bda7-a4716bbc79d0	t	Kamusana	65507ac0-2124-471e-9cd0-77d3803fa053
506e9306-ca8c-4b43-8e8c-a3d0fdfa3166	t	Mpoga	65507ac0-2124-471e-9cd0-77d3803fa053
87470a4f-a88a-420d-b2df-74103a5fb3d5	t	Mukondo	65507ac0-2124-471e-9cd0-77d3803fa053
f0419579-4239-4b3d-a74b-b1611dcad14d	t	Murambi	65507ac0-2124-471e-9cd0-77d3803fa053
726a9af2-c955-49f6-ad69-354488b5f01f	t	Nyakagoma	65507ac0-2124-471e-9cd0-77d3803fa053
7a0d5d1e-1990-4fa4-81fb-362f0999ac37	t	Nyeshati	65507ac0-2124-471e-9cd0-77d3803fa053
9bf5c6a3-1990-441c-ab42-330dbe32215d	t	Segege	65507ac0-2124-471e-9cd0-77d3803fa053
60142f63-a227-4928-bce4-c3b87cb4516e	t	Shaba	65507ac0-2124-471e-9cd0-77d3803fa053
3e8af0e0-4df0-4907-a985-528f4b05dfe8	t	Site	65507ac0-2124-471e-9cd0-77d3803fa053
7e72df5c-8446-4d04-978a-d29c3e22fe7c	t	Bunyereri	e2524626-6349-43d1-b4ac-8be1cdc02a6c
2d341ec7-568f-4d6b-b1a6-cd7a6efcb781	t	Nkanga	e2524626-6349-43d1-b4ac-8be1cdc02a6c
e5774b50-5811-4d80-99ef-badb5ad103ad	t	Ruhinga	e2524626-6349-43d1-b4ac-8be1cdc02a6c
37c24787-56dc-4d97-a00c-2b58be9320ce	t	Rwimbogo	e2524626-6349-43d1-b4ac-8be1cdc02a6c
08ada214-ec63-480e-99cb-ae9aedff6ead	t	Kibirizi	73f80fb2-7cc1-47b0-aaad-080211e8d26c
cbd195e2-7b1d-44a7-9f91-8fcfc2ed107e	t	Nyamaronko	73f80fb2-7cc1-47b0-aaad-080211e8d26c
f30def0b-06a6-4b4a-8ca7-afbc2e90746d	t	Ruganzu	73f80fb2-7cc1-47b0-aaad-080211e8d26c
da75a9d4-f03b-49f0-a0a5-3cd7566844ae	t	Barenga	54a51453-75ba-4d36-aa3b-555c61b1d72c
ef37d2c8-5864-454d-94fe-098f402c0d32	t	Gakungu	54a51453-75ba-4d36-aa3b-555c61b1d72c
b2b04e0d-59cb-48b6-9aa7-0dd97a060086	t	Mabuye	54a51453-75ba-4d36-aa3b-555c61b1d72c
f6ed24d6-bf5a-4d85-8c6f-d617145c8515	t	Mizibira	54a51453-75ba-4d36-aa3b-555c61b1d72c
674b5788-ebad-4f93-ac06-44baa10a664f	t	Peru	54a51453-75ba-4d36-aa3b-555c61b1d72c
d5fb0fd0-f4cf-4bb8-8a04-bcb3c65a5f2c	t	Ryarubaka	54a51453-75ba-4d36-aa3b-555c61b1d72c
a62133d8-f747-4310-9cbc-1bb9d893e9ee	t	Bigando	dcf14c98-9d33-45bc-9090-ab5814529c40
802a3acd-758f-4424-9656-0437f1244dd4	t	Bitaba	f2e03616-028e-4e12-bbfd-23f2863fa333
58ea67fe-a036-46e0-8822-1af0b6b010fc	t	Karambi	f2e03616-028e-4e12-bbfd-23f2863fa333
58808330-2ee3-4419-94b1-76c07999fc37	t	Nyamugari	f2e03616-028e-4e12-bbfd-23f2863fa333
b744cd9b-de1d-4d8a-8fa2-ad716d6bcf5b	t	Bisenyi	6b782b57-64dd-444c-b826-52f826fd26bc
1ce96393-1b64-4e65-a8d9-d893814d9609	t	Mashya	6b782b57-64dd-444c-b826-52f826fd26bc
5d7e2222-b1dd-4ff0-90ea-5ebf55976397	t	Mugerero	6b782b57-64dd-444c-b826-52f826fd26bc
7354f7ff-ae89-438e-9a06-0a2e6194824c	t	Nyamagana	6b782b57-64dd-444c-b826-52f826fd26bc
d1b52f5f-63f3-4fb2-9794-67710ca30a59	t	Kamanura	79f001cf-25e2-4ce1-9a82-67f61de188f9
346ab69c-7c52-4ad1-b73b-4a43886ce4fc	t	Kanyovu	79f001cf-25e2-4ce1-9a82-67f61de188f9
e462c3df-9657-4bb1-9eb4-da48a48ce863	t	Cyimbogo	81dedc86-f158-4d64-965e-995e96a27195
6f0669c3-d111-4135-b2af-5fb423156fa9	t	Gihusi	81dedc86-f158-4d64-965e-995e96a27195
417f2ed7-a313-4a60-9d1c-2f91e6d59792	t	Gituza	81dedc86-f158-4d64-965e-995e96a27195
34b402b7-3fad-471b-bbbb-ecf4da9dcadd	t	Gisovu	8bd43f50-eef0-44c1-bc06-2cacad311242
5bb6637e-bab9-43f5-aeeb-1711bb8e688a	t	Njambwe	8bd43f50-eef0-44c1-bc06-2cacad311242
9f0e4e7b-0d1f-48ab-9bc0-594cc4756a53	t	Runyanzovu	8bd43f50-eef0-44c1-bc06-2cacad311242
e7a06266-f083-41b1-98a4-0b1ee4b41765	t	Gataramo	c0396bbe-1aa7-475f-ab9f-e7912c096c1c
ab5435fb-5d5c-4b15-a688-8dee4fdf941a	t	Mugongo	c0396bbe-1aa7-475f-ab9f-e7912c096c1c
c7668629-ef85-442c-9b0c-02cf9d826185	t	Rusambu	c0396bbe-1aa7-475f-ab9f-e7912c096c1c
1eed1504-0834-4207-960b-2df1dcc4770d	t	Karunyerera	a3ff1db2-23c1-439f-b638-4d9e4caa813a
521d3e0e-1c0e-4985-a8e7-2202fa1adb9e	t	Gacuriro	eb5ac054-2457-4ce7-9e18-2c86c6eb350b
6e87aff5-79bf-4600-bb6a-9c7b09c5ab62	t	Nyagasozi	eb5ac054-2457-4ce7-9e18-2c86c6eb350b
f4412505-bd30-4ab6-92d5-6ef692fd9ec1	t	Ryagashyitsi	eb5ac054-2457-4ce7-9e18-2c86c6eb350b
4581821b-929e-47d4-a40b-42f66ed40ddc	t	Gasave	2d732e57-d074-44f0-a4b9-33f82c505f69
462921f4-14a0-4c7a-9821-eb0d7a5bfce5	t	Gatanga	57896833-6103-456e-bfeb-27c4a70ed9e2
e4c7ca33-b756-49de-a644-e67a6f0973a0	t	Nyabihanga	57896833-6103-456e-bfeb-27c4a70ed9e2
c9a033a0-c466-4011-b74c-0df25db98aa9	t	Kamabuye	5669ef08-c7ac-4db2-afc1-e3c7a76121a5
798e2272-1a14-453f-9d6a-78e1f8b9fb95	t	Ntenyi	04028663-e1fb-4576-869f-93ca4b4affc4
82a4e772-f8cf-4180-8d51-bf92bf2ff083	t	Bugarura	f337c3ce-e280-4f62-b821-15962d2cf90c
b9cd43bd-21a2-4194-954e-5177a935094a	t	Kabirizi	f337c3ce-e280-4f62-b821-15962d2cf90c
a936e448-ba6b-4bb1-a0e5-5913879bc46c	t	Kinunu	f337c3ce-e280-4f62-b821-15962d2cf90c
83086301-7787-42ea-80a9-3379738b2121	t	Muramba	f337c3ce-e280-4f62-b821-15962d2cf90c
1970dea2-c49f-4d44-b059-e773544d724e	t	Rwimbogo	f337c3ce-e280-4f62-b821-15962d2cf90c
749b33f2-a3cd-46ad-8944-1b0024da7886	t	Buhonongo	11c5ab87-acd6-43b8-9c75-9f9af61951f6
56f8008d-5487-459c-a8be-3041401d1752	t	Bweramana	11c5ab87-acd6-43b8-9c75-9f9af61951f6
996614e0-d811-4621-a351-5617aa871956	t	Gashoko	11c5ab87-acd6-43b8-9c75-9f9af61951f6
92fa9289-f5ea-4f39-9d23-f7ea33012f51	t	Kamuyaga	11c5ab87-acd6-43b8-9c75-9f9af61951f6
90965d3c-1eb5-4d04-aba7-aceaf41b643a	t	Rugamba	11c5ab87-acd6-43b8-9c75-9f9af61951f6
f0730bd7-2056-4da2-adba-c549223d143a	t	Rwabisururu	11c5ab87-acd6-43b8-9c75-9f9af61951f6
67612ac9-0462-4804-bfdb-2050138bf117	t	Gisiza	042b8d38-17c8-463c-a53c-79713b0683e0
325e7063-4841-4639-8200-44515b7b5eff	t	Gisoro	042b8d38-17c8-463c-a53c-79713b0683e0
453e65c9-2448-4243-8c18-a9ded12a29e1	t	Karukamba	042b8d38-17c8-463c-a53c-79713b0683e0
076ed507-6649-4975-a77b-440501fed12a	t	Kigarama	042b8d38-17c8-463c-a53c-79713b0683e0
f2e6240f-25e2-45d9-81fe-d08544e91c60	t	Munanira	042b8d38-17c8-463c-a53c-79713b0683e0
50d1d09a-a02d-4aa3-88be-f2d236f6ce32	t	Murambi	042b8d38-17c8-463c-a53c-79713b0683e0
07545695-dcf6-4b1f-a8a6-2a6c575e3b22	t	Bigabiro	413a6b3f-a4d8-4f78-b886-28c25e83b226
72f82965-506c-4d9b-b00a-aba6545af2c6	t	Buhoro	413a6b3f-a4d8-4f78-b886-28c25e83b226
6251cf2a-c810-4f0d-be90-b8fb96def5e0	t	Kaganza	413a6b3f-a4d8-4f78-b886-28c25e83b226
0f304ff7-2b77-4617-bbf6-7ec47fa543ed	t	Kamuzigura	413a6b3f-a4d8-4f78-b886-28c25e83b226
aea438ab-5a77-4499-a5fe-25d7f78a953a	t	Muyange	413a6b3f-a4d8-4f78-b886-28c25e83b226
fd6e0ba1-ee6c-4fc6-8555-c212ea276eb3	t	Gishushu	bfb265a3-bc45-4ae3-8c84-9f0fa73b2f3f
f23f113e-e771-4290-b1c9-1f7b60fa4ca8	t	Gitarama	bfb265a3-bc45-4ae3-8c84-9f0fa73b2f3f
f15e31bd-7a87-4439-9409-43aef978b6f8	t	Kagarama	bfb265a3-bc45-4ae3-8c84-9f0fa73b2f3f
251242c8-3431-41db-8745-fb28aef75316	t	Karambi	bfb265a3-bc45-4ae3-8c84-9f0fa73b2f3f
d0dd52b7-2404-4279-8aad-fe110271516d	t	Kandahura	bfb21a2b-c7b0-401c-ae59-f2e1aa7f3e74
f73124e5-9716-4357-a475-25aee0c71c67	t	Kindoyi	bfb21a2b-c7b0-401c-ae59-f2e1aa7f3e74
28bfac00-2b14-43ac-b9c5-039a6bb92867	t	Mukebera	bfb21a2b-c7b0-401c-ae59-f2e1aa7f3e74
07e6f681-cf50-4f56-af89-7b09702f5fc8	t	Nduba	bfb21a2b-c7b0-401c-ae59-f2e1aa7f3e74
664c28fd-42b0-4bf0-9dec-f9578d403084	t	Nkwiro	bfb21a2b-c7b0-401c-ae59-f2e1aa7f3e74
46173784-bacb-41b1-bcdd-abdb92d61b8f	t	Butare	0d114787-68e2-4dce-a568-bbdc91253b76
da1f070c-cf72-409b-8fc6-9a53a294eabb	t	Kamutambiro	0d114787-68e2-4dce-a568-bbdc91253b76
cef10075-e46a-4f56-b650-6af3a10ce933	t	Terimbere	0d114787-68e2-4dce-a568-bbdc91253b76
acadebf1-458b-429a-9c0e-8c5358278a1f	t	Gatomvu	f63ef8b4-9700-47ab-af34-8bedd6355cdf
0f499e14-ec75-4bda-9328-50801eddfed0	t	Karugaju	f63ef8b4-9700-47ab-af34-8bedd6355cdf
f2147581-9b26-4feb-846c-bef91e920147	t	Muhora	f63ef8b4-9700-47ab-af34-8bedd6355cdf
6f947504-d379-45ac-b990-641a77f78920	t	Gasharu	2ff8755f-ade5-4632-bd61-b632bdab5620
d4287993-966f-4d02-af84-33a0a5849326	t	Kabuga	2ff8755f-ade5-4632-bd61-b632bdab5620
a8ac26e8-5938-4bd3-83e8-8cd54f9ee4d0	t	Nyagahinga	2ff8755f-ade5-4632-bd61-b632bdab5620
942c6dc0-7dc3-4317-81e7-d91425a4d9a3	t	Gisunzu	b8907d36-c88d-4702-a3c6-383db72e5b82
1c9c4941-3ba9-4d1b-afac-6af4114fb381	t	Karongi	b8907d36-c88d-4702-a3c6-383db72e5b82
f5c6288b-f8a6-484d-a6b6-35c45e3fb996	t	Rugote	b8907d36-c88d-4702-a3c6-383db72e5b82
262c2c02-a432-47db-83e8-b8cc0f25356d	t	Rwamiyaga	b8907d36-c88d-4702-a3c6-383db72e5b82
711c7167-d27c-404d-993e-700d15ad47fe	t	Bweramana	10ef3144-6873-451b-bb14-2a6ffcd47af9
b5dd141f-8638-4136-b752-361db3e2d692	t	Gasave	10ef3144-6873-451b-bb14-2a6ffcd47af9
f68e8d67-f6b4-4d69-b6a4-eaca3c499811	t	Gateja	10ef3144-6873-451b-bb14-2a6ffcd47af9
8e3af34e-d7e4-404b-bc93-aa9645d5b754	t	Rasaniro	10ef3144-6873-451b-bb14-2a6ffcd47af9
c386dbb4-c987-4d20-9ca3-fb2bb7716284	t	Gisiza	1ce0166d-255e-4349-800e-0099a4db0f76
6baf2780-e653-403b-b690-e5734bcba225	t	Nkamba	1ce0166d-255e-4349-800e-0099a4db0f76
c5b2aa46-b40f-48ae-ae1d-f21d79358a9d	t	Nturo	1ce0166d-255e-4349-800e-0099a4db0f76
df6dab28-9551-448b-8f24-6f9b770e7a5a	t	Buhimba	9c25e820-e35e-49ee-9fb2-70c9c84a1490
b0c0de47-e460-4298-8c05-e0b92896a99e	t	Gahotora	9c25e820-e35e-49ee-9fb2-70c9c84a1490
4df2d563-ee04-4ffa-a40b-f22d20b80ba6	t	Gasagara	9c25e820-e35e-49ee-9fb2-70c9c84a1490
a436c46b-4b6e-4b2f-a260-3eb8056a3027	t	Humiro	9c25e820-e35e-49ee-9fb2-70c9c84a1490
8d32fb83-6da8-463d-a282-688cffe0bfe2	t	Kabashyembe	9c25e820-e35e-49ee-9fb2-70c9c84a1490
8177e4a3-1e40-4416-b2f1-5c5450bc8388	t	Kanyirahweza	9c25e820-e35e-49ee-9fb2-70c9c84a1490
ec5075c5-9c22-421e-97d4-2538c60e2835	t	Kigugu	9c25e820-e35e-49ee-9fb2-70c9c84a1490
bf2928a0-8b6c-4db6-ac3f-2d24c56ff584	t	Rukundo	9c25e820-e35e-49ee-9fb2-70c9c84a1490
c0a4d21e-b1e5-4bad-8423-80293d9b0e51	t	Kampi	fa038e9b-3a06-416d-92b9-5fcea904d8e2
f2d1da07-4765-4189-90a7-762e6dc0fe47	t	Rugabi	fa038e9b-3a06-416d-92b9-5fcea904d8e2
1b86066e-f422-44fe-9f32-41292e641386	t	Rukombe	fa038e9b-3a06-416d-92b9-5fcea904d8e2
a259a09f-d860-401a-9baf-2b3cdbb50d01	t	Rupango	fa038e9b-3a06-416d-92b9-5fcea904d8e2
15bbd5a3-c054-430c-9808-276eb8fdb7d7	t	Rusisiro	fa038e9b-3a06-416d-92b9-5fcea904d8e2
d569f310-6eb5-4ce4-a922-d5843a1869bb	t	Ruvumu	fa038e9b-3a06-416d-92b9-5fcea904d8e2
febda7c0-b517-480e-b4e8-0363a662b3c9	t	Gahunga	a772310a-6579-4391-83fa-b91f11ef2001
3b3fbfd4-2677-4cf7-8cfd-0737a7411c95	t	Kinihira	a772310a-6579-4391-83fa-b91f11ef2001
686feb59-ce30-443a-9d34-49d9853078b0	t	Murambi	a772310a-6579-4391-83fa-b91f11ef2001
89c7da4a-6622-45a5-9650-342ddcf6fbe8	t	Nganzo	a772310a-6579-4391-83fa-b91f11ef2001
c767abb8-9944-40cc-9f20-ad92df094a1a	t	Rwamiyaga	a772310a-6579-4391-83fa-b91f11ef2001
8620c1ba-daeb-47ad-ae52-c030cfbea82b	t	Tagaza	a772310a-6579-4391-83fa-b91f11ef2001
7a1bb8ce-279a-4f38-acb0-528a3daed95d	t	Bureke	30a2461e-6168-4aa9-99ec-095643fe51e2
be0d98d2-a992-4715-8b2e-d04dec67f4cf	t	Gihari	30a2461e-6168-4aa9-99ec-095643fe51e2
90cf4128-83bf-48f7-b07d-5e1f91c49450	t	Gitwa	30a2461e-6168-4aa9-99ec-095643fe51e2
376f9457-2407-4556-bde3-e88775f5b69b	t	Kanyempanga	30a2461e-6168-4aa9-99ec-095643fe51e2
831f6a32-01b3-4c63-aa07-1caa61c53c0a	t	Nyarubuye	30a2461e-6168-4aa9-99ec-095643fe51e2
97ae56d2-1f2c-46a1-9eb0-426476d203c1	t	Cyivugiza	ea80c519-ad72-4a0e-b377-d043bd25013f
9c68851d-8dbc-4b74-b383-db8c1204254c	t	Kamabuye	ea80c519-ad72-4a0e-b377-d043bd25013f
26fe2c5a-b31c-4c9a-b871-29a3cfb605c2	t	Karungu	ea80c519-ad72-4a0e-b377-d043bd25013f
1af34042-daa9-4a33-ad0c-e79877aa18d3	t	Mpinga	ea80c519-ad72-4a0e-b377-d043bd25013f
59eee905-0d2b-403a-87d9-5034d679d369	t	Rwamvura	ea80c519-ad72-4a0e-b377-d043bd25013f
69dd9b66-433c-45c2-859b-e061411700c2	t	Tarafiporo	ea80c519-ad72-4a0e-b377-d043bd25013f
1d9495a2-5daa-4448-8849-aab1535f3f28	t	Burambo	97a97f1b-c5ef-4307-ba59-e67edcfbd5ed
b7a42462-8e55-4088-ba2c-0168fa6007bc	t	Burango	97a97f1b-c5ef-4307-ba59-e67edcfbd5ed
00bac68d-2bcb-4f19-a39b-89ccfc5d2e6d	t	Cyato	97a97f1b-c5ef-4307-ba59-e67edcfbd5ed
116eba9d-7728-4859-b559-a08853f7682f	t	Kabitara	97a97f1b-c5ef-4307-ba59-e67edcfbd5ed
a868e87f-3811-48c6-b566-d3c1f6f8afd8	t	Kagera	97a97f1b-c5ef-4307-ba59-e67edcfbd5ed
e7b63cd6-4b2e-4225-b2a9-d47cb3dfd9eb	t	Bitare	f7d1ba29-602f-4d88-81ea-398f8a1a38dc
1352863f-2717-44e9-a202-e3842695b315	t	Bukiro	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
ecf35db7-2ff7-4af6-9123-76e0f0b5ebc0	t	Bukumba	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
70190f3d-f6d0-44e1-86ea-2704860f0ff2	t	Buroha	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
9c1ce336-76bc-4206-8b78-fdb19d5cd351	t	Bushamba	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
996320f0-f85e-4ae0-8e17-bebddc714f58	t	Kabuga	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
4e0e15f6-3f2f-407b-9257-be5f29f09d07	t	Nyundo	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
b2b99a3f-2ce0-45db-88f7-a86fe7b2dbb2	t	Rusumo	1dc6f6bd-c5b2-4365-b98e-c1d8dddfef28
0b85f8bb-3e3a-445a-b814-9d50f3ee970b	t	Kamwimba	add3873f-8369-4c22-b2e9-c56f8465306b
b7c4f309-768e-4821-9a75-e85de78c8b2c	t	Muramba	add3873f-8369-4c22-b2e9-c56f8465306b
976ac75b-9a03-42f1-9783-9c9899b64370	t	Remera	add3873f-8369-4c22-b2e9-c56f8465306b
a0214bf1-e177-4599-910d-38d4bb0875b8	t	Rwinyoni	add3873f-8369-4c22-b2e9-c56f8465306b
3c1bbbe1-7ef7-42f1-9c09-35f5d3467bb8	t	Tawuni	add3873f-8369-4c22-b2e9-c56f8465306b
1ba0a56b-1f43-4d18-8e30-19c3cb191523	t	Bitabaro	10bec438-6b50-4ce0-a2cd-2c5fe0ad0b18
43e73ab7-c564-4a73-9e71-8aa5e8d915bd	t	Gitwe	10bec438-6b50-4ce0-a2cd-2c5fe0ad0b18
8ca3c2aa-cb4a-4c30-918c-2836fb2dcf94	t	Kivumu	10bec438-6b50-4ce0-a2cd-2c5fe0ad0b18
3494abd0-b0b3-406d-8eb8-c93efd6783e6	t	Kagarama	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
8bfd76f9-9d20-4ce2-88ef-9d5c0b988f7d	t	Kamishunguro	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
e2856c6a-5cfe-434c-b56c-5d7174f1e7e9	t	Kanama	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
d8865745-ecfa-443f-9cad-a1e287b44d3f	t	Kimpongo	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
d628def6-9e88-4c51-8bf4-7b68fbc0c14e	t	Mujebeshi	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
a6e62cef-6e43-433e-b0ce-abf54234047f	t	Muyira	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
be669a77-eadb-4794-94d6-9877b5f6153b	t	Nyakarambi	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
3b3cbe1d-df9d-4f7d-b869-ef2e220e1c1d	t	Rutare	6ca7bbeb-ba67-4bf7-b8bd-ead2c2c0ff9c
eb09aa3d-b1c5-4763-9007-bef48982823b	t	Kanama	f0a17fea-fab5-44b2-a34e-a343d75568e2
6a04c1f6-a405-4dd3-a69c-afbe4447f3cc	t	Kabacuzi	e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7
600e3caf-e6e2-4d72-95c0-74e3c5680bab	t	Kagano	e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7
d20406eb-2008-4c3b-aae2-14111d8667a5	t	Kamonyi	e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7
7ba6d06f-b307-4866-9cfe-6751a026b539	t	Kazizi	e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7
4e6a7408-a632-4690-8efb-174147262393	t	Kiriba	e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7
2a35c202-0f3a-44fa-ac90-1f96f1e0aa96	t	Ntobo	e817f7ee-4694-4bd5-bdaa-9c4c440ce3d7
942b33a0-edf0-415b-af21-a045286e8e65	t	Kigeyo	02800f7e-e4da-4432-93f9-a1ab839e8cfb
c33e0712-85ed-44a3-a00b-53926f657b5e	t	Kimishishi	02800f7e-e4da-4432-93f9-a1ab839e8cfb
26a04703-c68a-4797-851e-6a76045e8889	t	Site Mukura y	02800f7e-e4da-4432-93f9-a1ab839e8cfb
b2fbb4ac-3037-4d4d-84c1-942dadd5da4e	t	Dehero	07befce3-023b-43a5-b367-19922a3fbc03
85859117-bf9b-4a54-a5af-5f06ae0ee93a	t	Gasambi	07befce3-023b-43a5-b367-19922a3fbc03
608fdb19-61cf-4ef8-a6df-a903a6123cc9	t	Karambo Ya 2	07befce3-023b-43a5-b367-19922a3fbc03
c2cd15a9-4aaf-4a3d-b8f7-08cde6b7d172	t	Gafu	7c579874-96b4-41f4-a53c-9bfb81bf4cdc
79b858a2-e374-4369-b702-ca2cc0fd337f	t	Gako	7c579874-96b4-41f4-a53c-9bfb81bf4cdc
595e5f19-b92d-427c-a3e1-8798288d707a	t	Mataba	7c579874-96b4-41f4-a53c-9bfb81bf4cdc
7c33b9e6-e3df-4b11-934a-832836599c46	t	Nyarubande	7c579874-96b4-41f4-a53c-9bfb81bf4cdc
d21f4fde-f3c9-4668-bb59-6ae34f0e1126	t	Nyarusongati	7c579874-96b4-41f4-a53c-9bfb81bf4cdc
4c2553a9-21e8-4d57-ae52-28a1c5757d00	t	Gasasa	f14aa855-fe3a-4384-8097-f56a6317c519
642bffe6-3231-416b-a52c-debb36878340	t	Karumbi	f14aa855-fe3a-4384-8097-f56a6317c519
613881fb-9bb8-4853-8cec-b53a5af11b9d	t	Muremure	f14aa855-fe3a-4384-8097-f56a6317c519
79f2512f-7bf4-4dcd-927d-1bca20c7b989	t	Kamuhoza	f4bbeac7-6a0a-4e74-bba5-fa20d2c3f594
2222aebf-e8b1-4b71-805a-e8b58e60b683	t	Murunda	f4bbeac7-6a0a-4e74-bba5-fa20d2c3f594
00ec681a-2bca-42c9-ae06-2cb59b1d62af	t	Rurimba	f4bbeac7-6a0a-4e74-bba5-fa20d2c3f594
690df1b0-cbc3-4e42-ab12-8c7b151793a5	t	Kamusambi	24e3e682-aa13-4064-8658-75169c68d75e
56568461-f234-4b1a-b3fb-63a582a8eace	t	Karambo	24e3e682-aa13-4064-8658-75169c68d75e
65909dd4-a51a-4e25-8118-c0c4cade06d1	t	Musongati	24e3e682-aa13-4064-8658-75169c68d75e
6323a4d8-1113-4639-983e-fdb8c5286bd8	t	Gatare	0455f824-a68d-4071-98cb-5763bec5b311
4a2c541e-da4a-430f-ad4f-b5c238a45451	t	Rwanika	0455f824-a68d-4071-98cb-5763bec5b311
703f43ae-8200-4ef6-a68e-d192def7e83a	t	Rwoza	0455f824-a68d-4071-98cb-5763bec5b311
811d8645-ba1c-40d4-9d36-29f5c828a53c	t	Gabiro	7edd5637-7d9a-4594-8c59-8ca2d5cd8657
2df96bd6-169a-4171-856a-f4f8a856e884	t	Gitwa	7edd5637-7d9a-4594-8c59-8ca2d5cd8657
8a257c45-8af7-4fbf-9ccc-fbee96f779dc	t	Murama	7edd5637-7d9a-4594-8c59-8ca2d5cd8657
90ee0a7f-575d-45c2-9b3c-ad4746097d3c	t	Nyarugenge	7edd5637-7d9a-4594-8c59-8ca2d5cd8657
c9efc6d7-165a-442e-af73-88d3e637db1b	t	Rugarambiro	7edd5637-7d9a-4594-8c59-8ca2d5cd8657
b7f61987-33cd-40f8-89e9-62795bb1598c	t	Bweramana	e66050d4-d42d-4fda-b375-a9da4265556c
fda23270-e848-48ee-a689-19cb543bb8e6	t	Gihinga	e66050d4-d42d-4fda-b375-a9da4265556c
5e327d57-16dc-4c90-bce0-275e345d72f0	t	Gisiza	e66050d4-d42d-4fda-b375-a9da4265556c
8573a15a-14f2-4527-ad0f-cc8cc7fc5bd9	t	Karambi	e66050d4-d42d-4fda-b375-a9da4265556c
1e489b64-9810-4a61-9e60-64455ac53b88	t	Ngoma	e66050d4-d42d-4fda-b375-a9da4265556c
b72c3d82-d25c-4b6e-abc4-a66cc5444e96	t	Bunnyari	2f75b3b0-8ef2-4783-87fe-4ed20a18f5d6
a4159925-4842-4b75-ba50-2f41cecb402e	t	Murambi	2f75b3b0-8ef2-4783-87fe-4ed20a18f5d6
51f60fdf-096b-458b-aef0-304c135506da	t	Mirambi	0d9296f6-29ed-49e5-84d5-2f301bac1477
d86a1138-9f62-4685-a22a-77ba5da1eaeb	t	Muhororo	0d9296f6-29ed-49e5-84d5-2f301bac1477
4a39c088-4292-40fa-ae1e-0039065d8d2a	t	Rebero	0d9296f6-29ed-49e5-84d5-2f301bac1477
0457dafe-f053-48f4-b7a3-9173206be1bc	t	Buhunde	06977671-3a1b-43f5-ad33-237a532e3a88
8da286a1-9732-4ccf-a13c-2602cc06c8ce	t	Buzukira	06977671-3a1b-43f5-ad33-237a532e3a88
b531e31f-9660-4bdf-9119-99b9942e32b6	t	Kamaranzara	06977671-3a1b-43f5-ad33-237a532e3a88
d4c82c1a-ae90-456e-bc89-6ba4a3878d78	t	Karengera	06977671-3a1b-43f5-ad33-237a532e3a88
90effa25-d192-49cd-80f0-504e72b5119d	t	Mugara	06977671-3a1b-43f5-ad33-237a532e3a88
f9d09ea2-713c-42ac-8022-6c58d434883a	t	Rurimba	06977671-3a1b-43f5-ad33-237a532e3a88
7e007184-6e5f-4e50-b1d6-f0c125752bb1	t	Mubuga	0b9f8223-789c-48db-9e07-a5cba7ad23b7
0a136dec-f2ee-438e-83ee-6241f5ac7607	t	Rugerero	0b9f8223-789c-48db-9e07-a5cba7ad23b7
b845026a-7804-4681-855d-3e964231d647	t	Ryarwasa	0b9f8223-789c-48db-9e07-a5cba7ad23b7
3d7cc630-bc4f-4f22-b383-90a19363cd37	t	Gasave	19386f5c-e1a0-4393-9839-53c18c75d817
9a20de33-b51d-476d-a867-8b902997f98d	t	Kakibaba	19386f5c-e1a0-4393-9839-53c18c75d817
cd492ea5-4b3f-4fe8-851f-7a39cb5c81c2	t	Kariba	19386f5c-e1a0-4393-9839-53c18c75d817
6b9a7e79-8be7-4486-8cd4-eaef8715306e	t	Nkomero	19386f5c-e1a0-4393-9839-53c18c75d817
9086e66f-7a3e-4b45-aeca-d7f99f606a90	t	Ruyogoro	19386f5c-e1a0-4393-9839-53c18c75d817
cc6efc92-fb4f-4181-93e0-ab6ec6b2fc29	t	Gasoro	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
6970f0c4-9861-4c8b-be70-406e070b2c19	t	Kaboneye	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
507669a1-3af2-4d2e-8622-9e78e87e8364	t	Kagano	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
25ff9740-dba9-4e3e-b442-5d4323d8977f	t	Kashishi	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
10fda975-b104-4483-a5a8-ce62d22b07d9	t	Mukati	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
24f40d8f-294e-42f8-9d75-b2ef4ecdc882	t	Ngunguru	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
bc21c55a-2065-4b51-97b4-3057028ca413	t	Rugaragara	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
8a73f87a-679b-4bec-ae21-b5625af95123	t	Ruhengeri	57ba4bb0-1f94-40c7-82d5-237ae14efcbf
c39b8c5d-ecad-421c-8a81-6003a02cb4a7	t	Bisyo	da3f0a47-18ba-437b-8fac-fa0453d732f9
c034548b-3818-419f-aab4-de311f502d80	t	Kabiraho	da3f0a47-18ba-437b-8fac-fa0453d732f9
64b7c551-4bab-455e-b3b2-d6563e708223	t	Kamushozi	da3f0a47-18ba-437b-8fac-fa0453d732f9
bc0ff7b9-dac5-4c82-8b0b-3fcae14ec33f	t	Karambi	da3f0a47-18ba-437b-8fac-fa0453d732f9
9c7d5853-d738-4218-b208-e5f180f98a84	t	Mataba	da3f0a47-18ba-437b-8fac-fa0453d732f9
2535b8cb-3410-488c-b35b-b3c37a6dc1aa	t	Ruhinga	da3f0a47-18ba-437b-8fac-fa0453d732f9
af91a12f-61c7-43db-95c6-832e3822a7d9	t	Kunini	5fd82fb3-7469-444c-b012-277680893810
ad207f14-9cad-4da0-987d-2494064c2307	t	Gakoma	33ffe9eb-c671-4454-9284-e8cac32fb26e
228fabd8-23bd-4db0-be91-b7aefdf7e95e	t	Karambira	33ffe9eb-c671-4454-9284-e8cac32fb26e
03aa1155-04ff-42ee-a57b-f7d8ef114e0c	t	Mugote	33ffe9eb-c671-4454-9284-e8cac32fb26e
3b2541f9-7008-4082-91d0-76488e50c833	t	Rububa	33ffe9eb-c671-4454-9284-e8cac32fb26e
f7fefe23-9901-42d8-9d6a-f1e3fc726f4b	t	Ruhinga	33ffe9eb-c671-4454-9284-e8cac32fb26e
06217698-0406-4d84-85d3-8489f706c512	t	Rwintore	33ffe9eb-c671-4454-9284-e8cac32fb26e
5dc4cbbb-a684-4bfd-85d0-f4e8ca5e2d95	t	Gitega	739cfcc5-40cf-49d7-9514-64028478fa67
25063b3d-12e0-47a9-b818-7f91bff24c08	t	Murambi	739cfcc5-40cf-49d7-9514-64028478fa67
d2c260d2-a79d-4e6b-80df-62cb9872b9f8	t	Nyarusange	739cfcc5-40cf-49d7-9514-64028478fa67
4aabda5a-5497-47e9-931a-e81d7e2bf573	t	Rushikiri	739cfcc5-40cf-49d7-9514-64028478fa67
fe5b44f3-7bde-4500-b095-54c339164d90	t	Kabuga	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
6c981598-282f-40f9-9ffd-90f568efbb69	t	Kaduha	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
9d827be3-896e-416e-9971-5a965371c674	t	Kagugu	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
23c788cd-4cfa-4a57-b6ae-0f4ace5f01b3	t	Kanyinya	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
ee70b3e2-39d5-46b3-bbe3-bfa6cc563ca1	t	Kivumu	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
2405abe4-3234-4a88-81ea-48f7de1a0a91	t	Nyagahinga	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
a8a55f3a-5c1b-4ae7-b85c-2dbc4ecb0dd2	t	Nyamahuru	d3fa2e1c-58ef-4420-80b7-4c4f98c2c669
094a7f19-5ae0-48a0-b467-e6e20be221e6	t	Busuku	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
80da55bf-4d93-4e39-a4c6-e796ea502c7f	t	Busuti	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
cde6fd8a-63fb-4e3e-91c9-0c8bd8abd9dc	t	Bwiza	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
ecd51fc5-c216-4e45-ab8b-18b2396e2042	t	Ngugo	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
6ad8e093-b387-4dc7-94c3-b4e0c8ae14d1	t	Nyakibande	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
cfd30b87-162a-4b0a-b0ca-fc1c3803a6bf	t	Rwamigega	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
0a948b27-d269-4d8a-ba10-ad442a737fcb	t	Torwe	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
c54a7286-2258-44b7-8dd4-35af2cb6cc62	t	Tsindiro	33e3b8c9-794f-4301-b72a-34ec6f21dcd0
cd93580c-e5fc-4240-9cf2-45215c919c4c	t	Gakumba	ec91dd3a-63a1-4194-b2be-19e1925df97a
78970cef-cefd-458e-85e6-870aabbb79fe	t	Kamananga	ec91dd3a-63a1-4194-b2be-19e1925df97a
ff5741d7-14d8-4475-ad61-5c889d756ce2	t	Nyabishongo	ec91dd3a-63a1-4194-b2be-19e1925df97a
14ca0975-fc09-466d-a65e-f1c4b21141e3	t	Rukomero	ec91dd3a-63a1-4194-b2be-19e1925df97a
00f759f8-fbd3-4afa-8cb4-f7e470a57a85	t	Gashihe	ada6c10a-e290-4dc6-9403-f066e4a5c2b4
d1cfb132-e980-4602-a469-4e46b59641dc	t	Kaje	ada6c10a-e290-4dc6-9403-f066e4a5c2b4
8ec1a3c1-7482-448e-8735-cbf3148849c2	t	Kazo	ada6c10a-e290-4dc6-9403-f066e4a5c2b4
a0371c85-7f67-4616-a617-e1ee739a7961	t	Mpati	ada6c10a-e290-4dc6-9403-f066e4a5c2b4
e2730ff2-ea9f-43bf-94e8-b19a59b731a3	t	Nkuna	ada6c10a-e290-4dc6-9403-f066e4a5c2b4
d9a30fac-ade2-494f-ab03-76886eb35a52	t	Gihinga	f08b038e-44fe-4127-a157-3f43bbf12dc4
7cfa198d-37fb-400f-b545-c50e0d0e2b88	t	Kanombe	f08b038e-44fe-4127-a157-3f43bbf12dc4
1210729b-48ab-453b-88e7-716aacd0df72	t	Kasonga	f08b038e-44fe-4127-a157-3f43bbf12dc4
da1af8d5-0d3a-4c1f-ac01-21d67b0388a0	t	Kinyamavuta	f08b038e-44fe-4127-a157-3f43bbf12dc4
5f3cd398-e3c4-47c9-84f4-073cfdcd4e03	t	Negenero	f08b038e-44fe-4127-a157-3f43bbf12dc4
4ac2ec63-f048-4228-8c5c-4e95ee35f02b	t	Nyampengeri	f08b038e-44fe-4127-a157-3f43bbf12dc4
f05d94d3-3deb-4c40-9f80-caaec509aa1a	t	Ruraji	f08b038e-44fe-4127-a157-3f43bbf12dc4
c26d1cf6-2f38-4d8e-b7ee-7468a55fc7c1	t	Rwangambuto	f08b038e-44fe-4127-a157-3f43bbf12dc4
40966378-d2db-4b5b-bb4a-f38cab2770ba	t	Ryanyiramuno	f08b038e-44fe-4127-a157-3f43bbf12dc4
21c78928-fd7a-4aa3-a68b-6a940a3373dc	t	Gasovu	5cff4722-b450-4d30-8d23-840aff303658
e153db1d-788c-4735-ad41-4a266eaf0add	t	Kamuramira	5cff4722-b450-4d30-8d23-840aff303658
a3235465-6aa2-4a62-9d95-d764eef646ba	t	Mwurire	5cff4722-b450-4d30-8d23-840aff303658
bd470908-3324-4c3e-9fef-ea215cd9cb39	t	Ruhimbi	5cff4722-b450-4d30-8d23-840aff303658
68db6357-4170-47ac-895e-06fd38007d17	t	Rukenesha	5cff4722-b450-4d30-8d23-840aff303658
e7e392c5-ba80-471f-a47c-8155e3861eb6	t	Bitenga	959811be-11bd-4b71-ba30-1c648323fe77
93aff44a-de79-44cb-a853-a172c0cc413e	t	Busenda	959811be-11bd-4b71-ba30-1c648323fe77
1d0ec513-7559-450f-a4a2-04a835e7a545	t	Murambi	959811be-11bd-4b71-ba30-1c648323fe77
80f9c05b-99ab-4673-baca-e9d755ade093	t	Tara	959811be-11bd-4b71-ba30-1c648323fe77
2c56f1ae-4960-4756-b050-fdf1a32753ff	t	Gakeri	640b50bd-6b2e-4b30-90f0-3dc0b2078c75
924d0ad4-4990-4027-8774-f89ce3365c28	t	Gasasa	640b50bd-6b2e-4b30-90f0-3dc0b2078c75
aef4d5c6-9059-48a3-b6ff-f923e460c199	t	Gasunzu	640b50bd-6b2e-4b30-90f0-3dc0b2078c75
b4ad75ec-75c8-48ac-8cd3-6b0ec76aee15	t	Mubirizi	640b50bd-6b2e-4b30-90f0-3dc0b2078c75
580aaa6d-1722-4bc1-9dc5-4bb79bcf0ab6	t	Muhingo	640b50bd-6b2e-4b30-90f0-3dc0b2078c75
23aff1e4-506c-472c-ab8b-4f0f8182d74f	t	Nyundo	640b50bd-6b2e-4b30-90f0-3dc0b2078c75
0889cdff-1d0b-475a-bf91-91378597e683	t	Buzeyi	15a7b2bc-f17a-4f4a-bcf1-a9f660edb41f
447b3c51-4a5a-487a-91a5-65d4649f28fb	t	Kabeza	15a7b2bc-f17a-4f4a-bcf1-a9f660edb41f
d00b60c7-c8bf-4e6b-ad7a-4d0a1f295801	t	Kayove	15a7b2bc-f17a-4f4a-bcf1-a9f660edb41f
f7b8586a-f6b2-4bc5-86dd-7ca0540c9704	t	Mugali	15a7b2bc-f17a-4f4a-bcf1-a9f660edb41f
22b8ead8-40c0-4370-9176-50fbe6a55a55	t	Kabitovu	a768d311-23fd-4557-af1f-7c29ddff629d
d809ecf2-25eb-4567-8149-6e08efa8b985	t	Kaziga	044ef1cc-5fe9-4ef1-945c-52971f1e5c81
b2fe658b-963c-4f52-ba76-b156a1d1a8a5	t	Matyazo	044ef1cc-5fe9-4ef1-945c-52971f1e5c81
cdc3513f-b793-4188-9937-ebfcb8f54a07	t	Byiniro	bbc2bbeb-f8ab-4c3b-8695-6ad87c823757
4bdbaa84-0fd7-44c9-a021-800372575c8b	t	Nyagasambu	bbc2bbeb-f8ab-4c3b-8695-6ad87c823757
8c7b021c-9ad5-4d6b-b558-f7531e585561	t	Rwamvura	bbc2bbeb-f8ab-4c3b-8695-6ad87c823757
ab150009-3e2a-400b-ab59-d5f840f7d476	t	Gakeri	11ea68b8-f9c2-438c-9dd0-d7f89cd15f23
753f030b-fab0-420e-b2ba-288b0bb63f2c	t	Gatenga	11ea68b8-f9c2-438c-9dd0-d7f89cd15f23
3fdcb498-3541-455a-a195-8a8a04ea9587	t	Kacyiru	11ea68b8-f9c2-438c-9dd0-d7f89cd15f23
9f3af2cc-104b-493e-a690-b9adc18b3609	t	Marimba	11ea68b8-f9c2-438c-9dd0-d7f89cd15f23
d8cf5245-6cb2-484d-bc96-0ccc0b1ba819	t	Ruganda	11ea68b8-f9c2-438c-9dd0-d7f89cd15f23
1c341a3a-ee72-4d37-846a-f5de5bd6fc0a	t	Rurambo	b29e2118-9ba5-4f16-84e6-a1b2c648737d
80ec7325-7f01-4c62-9225-3940ccae1ebb	t	Shyembe	b29e2118-9ba5-4f16-84e6-a1b2c648737d
6a8c94a2-6c5d-43f1-a94a-61d45b4df7e4	t	Nyamibombwe	99872f52-9abb-4311-9ac3-d91e033d6440
83a5657d-0dc5-4953-bedf-d8afd48833da	t	Bungwe	a1f06cda-0585-4939-8280-11bb5072e9ce
41474676-93e1-47ea-9677-43779f9c8e89	t	Gakeri	a1f06cda-0585-4939-8280-11bb5072e9ce
27ac3adf-a571-4941-a69d-0b48a98df8ba	t	Gatenga	a1f06cda-0585-4939-8280-11bb5072e9ce
5fc77939-c45a-40dd-9b02-3ff42aa821f3	t	Nyabyondo	a1f06cda-0585-4939-8280-11bb5072e9ce
2c8c13a1-dff7-4ec2-ae99-1caa22a3b69e	t	Gifumba	cf186aca-f6f2-4579-a7a9-ae5e6fbb2dd9
53084c2b-866a-4e26-b552-04e31922eaa0	t	Ryamayaya	cf186aca-f6f2-4579-a7a9-ae5e6fbb2dd9
479a514d-5638-4b89-abc6-9e3ca269b010	t	Mubuga	5f656404-07a4-413c-b687-350d5824b9b3
e9e932e7-2122-4cd1-9b00-fd6d0df8ec39	t	Karwema	0df66bc4-33f8-455b-bcdf-dd9a64443df2
b8ada013-7aea-4442-97e5-2c9b838c8159	t	Mubuga	0df66bc4-33f8-455b-bcdf-dd9a64443df2
82d20fd1-39bd-4a3c-b528-67d25ecb3076	t	Murambo	0df66bc4-33f8-455b-bcdf-dd9a64443df2
bb9af4fc-9a4e-4cba-a4c1-ed7ec8bf5cd3	t	Mutungo	0df66bc4-33f8-455b-bcdf-dd9a64443df2
96c89420-fdfc-482a-8fee-917a0850f944	t	Nama	0df66bc4-33f8-455b-bcdf-dd9a64443df2
0d272e54-35ff-4685-903b-e060f983092d	t	Gafumba	5209b401-8438-43d4-b10e-3f612ece32f2
8cde2ae2-533c-46ee-949f-d3c64f11fe17	t	Gahuye	5209b401-8438-43d4-b10e-3f612ece32f2
285866f9-e9a4-4f53-9b16-5d2e41ed6bbd	t	Gasebeya	5209b401-8438-43d4-b10e-3f612ece32f2
d2d91f34-8583-48b5-80a5-7e6ae500f0dd	t	Kadehero	5209b401-8438-43d4-b10e-3f612ece32f2
6e8006af-838a-4488-93ce-65962d3630d5	t	Kagano	5209b401-8438-43d4-b10e-3f612ece32f2
12c560ad-f1e5-4327-993f-d241fb53ff32	t	Kanyoni	5209b401-8438-43d4-b10e-3f612ece32f2
b75aa430-aa10-4a2b-8d5c-e3b3c9359093	t	Kindoyi	5209b401-8438-43d4-b10e-3f612ece32f2
3e88dc17-9125-4e71-b03f-57da3ee6615c	t	Rubonobono	5209b401-8438-43d4-b10e-3f612ece32f2
729b334c-3a01-4f25-a7a8-b8135402510f	t	Biyove	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
02b6558f-c991-4a7c-8bcc-f185ad7d5485	t	Bugeme	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
8714040b-8ba6-422f-b76f-626f04421158	t	Kirwa	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
9b57fc8b-c8b0-43ef-a689-5ab98ca7f804	t	Mulindi	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
90260c54-8095-45a8-8e45-019a8f5dc5b0	t	Murambi	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
57e55f79-6d98-46b2-b9ca-058e93948eab	t	Musenyi	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
294f10b8-c3c9-435c-8e9e-7532ddf5a8ba	t	Nyanamo	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
832a6c0e-3abc-44c0-8bb2-93cc126c56b9	t	Rupangu	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
537d6b7c-18af-4e68-aa7b-9e4d62d8cae5	t	Ryakagundu	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
ecb22d96-1efe-4ab7-acd5-57bcd24f14e1	t	Ryanturege	7a0f31aa-385e-4def-ba55-b51de9c9eb6b
c2164d5d-8d6c-42f6-8d13-a56eafd593bc	t	Bukaragata	4f03d411-3ae1-4b79-972c-6b6df587a36e
c048c046-b892-4005-8b83-849c56abdc00	t	Cyahera	4f03d411-3ae1-4b79-972c-6b6df587a36e
3faa9fac-ea5c-4271-8d00-e9d3618f49eb	t	Karambi	4f03d411-3ae1-4b79-972c-6b6df587a36e
44a62d43-eab5-4041-9715-72df9196719c	t	Kibande	4f03d411-3ae1-4b79-972c-6b6df587a36e
392a1cb2-0f7c-4c09-8374-91cec4a6ecaa	t	Kindege	4f03d411-3ae1-4b79-972c-6b6df587a36e
f84f1a92-8f47-4f25-93de-446db9d87a09	t	Murambo	4f03d411-3ae1-4b79-972c-6b6df587a36e
5c1f92f1-5160-424b-8f17-76f537630ac8	t	Murwa	4f03d411-3ae1-4b79-972c-6b6df587a36e
a08020d3-f1fb-40c6-9721-65fd77bbb036	t	Rugandu	4f03d411-3ae1-4b79-972c-6b6df587a36e
faa2374d-3461-44a2-a961-7a1287c2a211	t	Taba	4f03d411-3ae1-4b79-972c-6b6df587a36e
965661c8-1dca-4de7-aa81-3b5304b458e5	t	Burambira	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
d41192b6-1877-415a-844c-29cc6343a5a1	t	Gari	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
c89ade8a-f458-4b00-b57d-53dc6c3cb7c7	t	Gasiza	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
67c7df59-e4ad-4140-aa5b-4f003e0c7d26	t	Gitovu	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
cc81d8eb-7047-46f1-849b-d1abbb184431	t	Kiringa	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
e5914de5-d8a1-4688-a471-a82f694712ff	t	Murwa	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
f4fcecda-de4d-46a0-8552-1516dbe77015	t	Musama	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
e6092e64-39a7-48e9-8f58-f134757858f7	t	Nkururo	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
641d3a03-7880-4e07-b979-90175d469378	t	Nyamiyaga	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
601aace7-7a9e-46eb-aff7-b562f4f66279	t	Rubaya	1dccc1f6-6c9f-4cff-823a-a261cd5b9713
734ca6ec-92a8-4479-a0e5-f899be7cee22	t	Butaro	b2853706-7cc7-4645-959d-0de6bdf17b05
a8acf1e3-15f6-4f12-84fc-363242ca6a72	t	Buyanga	b2853706-7cc7-4645-959d-0de6bdf17b05
dfb7131e-34ed-4c28-98e2-6994be3e728a	t	Gitanda	b2853706-7cc7-4645-959d-0de6bdf17b05
24cc85d5-1ec0-4ea5-aa9e-10b32bc14666	t	Kabahura	b2853706-7cc7-4645-959d-0de6bdf17b05
a5c85155-306e-4d9d-83f1-a9b475f8f6d3	t	Kanyesogo	b2853706-7cc7-4645-959d-0de6bdf17b05
0e0c89c5-1751-4c70-a568-5f2d9fbcc3e0	t	Mugari	b2853706-7cc7-4645-959d-0de6bdf17b05
45c6465c-a29d-4347-bef7-209fe928f018	t	Mugera	b2853706-7cc7-4645-959d-0de6bdf17b05
e311d634-9fa9-406d-af3a-5bd303f538b9	t	Mukeri	b2853706-7cc7-4645-959d-0de6bdf17b05
37d295b4-d1c0-402f-b302-9d6c3fddc3bb	t	Gahirikiro	c920eb70-f819-450b-9c9c-3effad18fb55
0b83ff75-29cc-4e9b-a040-e20f3edd5bb1	t	Kabona	c920eb70-f819-450b-9c9c-3effad18fb55
44983065-6558-46b6-8306-efdb11b6534a	t	Nyamiyaga	c920eb70-f819-450b-9c9c-3effad18fb55
2fd03aae-0e41-499d-a956-0bd5b9cd2b4b	t	Rwankongi	c920eb70-f819-450b-9c9c-3effad18fb55
2ece22d2-0eaa-49b9-b5ff-98c6da147f25	t	Gisovu	c426c826-de66-4ed4-915e-c21d2f5ae300
d4d5adf7-504a-4181-827b-12ce8dfdba43	t	Hanika	c426c826-de66-4ed4-915e-c21d2f5ae300
dccf420d-8fff-4782-a450-89d94cbf6ffb	t	Ruhimbi	c426c826-de66-4ed4-915e-c21d2f5ae300
8423f0b4-5ac0-4490-b019-1e6c8cffe5ee	t	Samiro	c426c826-de66-4ed4-915e-c21d2f5ae300
2bdcf262-fe75-443a-b843-6c9f53f7c462	t	Kabadari	d7a20e37-4def-4f23-8867-53f6f444a311
1f20af57-4b6e-4a2c-8ff2-5985d2656cde	t	Mbonabose	d7a20e37-4def-4f23-8867-53f6f444a311
7b455475-c690-421c-b312-8df1a0090cd2	t	Mugarama	d7a20e37-4def-4f23-8867-53f6f444a311
29d54957-895a-4eff-91c9-be2d051cfa89	t	Mugeshi	d7a20e37-4def-4f23-8867-53f6f444a311
217d393a-f7e8-4c9d-8ce6-aebe74547718	t	Nkiriza	d7a20e37-4def-4f23-8867-53f6f444a311
95ce35cf-97a5-40e0-9516-3c627feb4cdd	t	Nyagisenyi	d7a20e37-4def-4f23-8867-53f6f444a311
e781e340-f504-497e-9e17-68b7ba8b6100	t	Zindiro	d7a20e37-4def-4f23-8867-53f6f444a311
1de5cd63-aacb-411a-86b6-a42b7b5d2b00	t	Gasebeya	09d5cd65-6f85-4b29-8818-541f04dda392
0141d0dc-065c-41ee-be42-1d61182b71db	t	Kabaya	09d5cd65-6f85-4b29-8818-541f04dda392
1313123c-03dc-426d-8270-c25e79411d96	t	Kagerero	09d5cd65-6f85-4b29-8818-541f04dda392
8620a430-cadd-41b0-825a-1b70b7a1a08b	t	Karambo	09d5cd65-6f85-4b29-8818-541f04dda392
18e6b6b9-bf74-4608-866a-c15708b9970e	t	Kidaho	09d5cd65-6f85-4b29-8818-541f04dda392
52070d3a-1631-45e2-b8f3-b48d0404622f	t	Munini	09d5cd65-6f85-4b29-8818-541f04dda392
621d59ef-7222-443a-a405-146532caa88b	t	Ntarama	09d5cd65-6f85-4b29-8818-541f04dda392
d1c87f7e-1a90-4bd7-b4a1-f5abae04cde7	t	Sirwa	09d5cd65-6f85-4b29-8818-541f04dda392
c616c340-03e8-4359-86fc-6f134f996811	t	Gasiza	569aec92-34b8-4316-821f-d81932b6dffa
9a9bd07f-1db7-4c4b-8cf3-f4f6e04b6a0d	t	Gasovu	569aec92-34b8-4316-821f-d81932b6dffa
5dd3f159-203a-4b42-8cff-f0606a9635c6	t	Kabira	569aec92-34b8-4316-821f-d81932b6dffa
07747dcd-84b7-4a07-8e7c-ecf4f65bb7a3	t	Kavunda	569aec92-34b8-4316-821f-d81932b6dffa
4ca44d8d-65ad-40f4-ad18-40954b41edc0	t	Kibaya	569aec92-34b8-4316-821f-d81932b6dffa
05776071-7605-4a70-a261-17b2df4bef84	t	Majyambere	569aec92-34b8-4316-821f-d81932b6dffa
b29da19d-55c1-4b3b-b656-452063b03dc4	t	Nyarutosho	569aec92-34b8-4316-821f-d81932b6dffa
6a87b17c-6fad-4798-a54d-8ee1ff24dd32	t	Runyenkanda	569aec92-34b8-4316-821f-d81932b6dffa
834d9683-b8f6-497e-a84e-61ff63d38c84	t	Ryabiteyi	569aec92-34b8-4316-821f-d81932b6dffa
36b4b4d9-d7cb-4838-8f69-f63abadf2da5	t	Bisura	5adaf426-e09d-483e-b542-4dfce392742d
41699551-160c-4bad-8e80-185e67b8508c	t	Gahama	5adaf426-e09d-483e-b542-4dfce392742d
44a0aa14-c562-4ce2-9844-f69dfe2799a7	t	Gahonga	5adaf426-e09d-483e-b542-4dfce392742d
c9279d62-e66c-4af0-ac5a-ca9d4ceb8999	t	Gakenke	5adaf426-e09d-483e-b542-4dfce392742d
e9918cd3-4979-435c-b5f8-5c64369840c2	t	Kabande	5adaf426-e09d-483e-b542-4dfce392742d
df66353b-8f7c-4b13-8497-25383c9f038c	t	Kabyimana	5adaf426-e09d-483e-b542-4dfce392742d
ddf01b42-0e74-423b-ac71-4cbbcf4d2869	t	Kanyabaranzi	5adaf426-e09d-483e-b542-4dfce392742d
df85fd6b-1ec9-4cc8-bc4f-c61227eb43a0	t	Kebero	5adaf426-e09d-483e-b542-4dfce392742d
24d4dc56-f345-4e98-9968-96435b031688	t	Mashango	5adaf426-e09d-483e-b542-4dfce392742d
f7bf28d3-aa82-44d0-bd79-cbcf326409a2	t	Musave	5adaf426-e09d-483e-b542-4dfce392742d
7a2fdb4c-7701-4176-9acf-4ac564a4c802	t	Ruko	5adaf426-e09d-483e-b542-4dfce392742d
d7760100-ae4a-4de9-bdbb-0bdfe3d3171e	t	Kamata	51f9bde1-08ba-47ea-aacf-769253ecbb9a
49caa1ff-ffd7-4de3-b742-4d21e3061780	t	Kabagenza	ec2d49ca-80e8-4f5e-aa68-c9fcd65064c6
b6c97bad-ce60-402f-96c3-00b06abf6b72	t	Ntazi	ec2d49ca-80e8-4f5e-aa68-c9fcd65064c6
2b3c425c-221e-4a9b-9029-660dae99c2a4	t	Nyagisozi	ec2d49ca-80e8-4f5e-aa68-c9fcd65064c6
2294cba8-29a8-4f0a-b54f-2dd0de232d89	t	Rujanja	ec2d49ca-80e8-4f5e-aa68-c9fcd65064c6
10cfc8ab-3281-4c7c-9aba-784ee1b287b5	t	Ryaruhirima	ec2d49ca-80e8-4f5e-aa68-c9fcd65064c6
2b1835bb-8741-43b0-850f-4dd112aaaf39	t	Burabwa	84302164-ed39-48ef-b81b-bb01d8de75ea
d0b5af56-914d-4f93-93f6-47974c95cbdf	t	Kabaya	84302164-ed39-48ef-b81b-bb01d8de75ea
5f113192-e8a2-48fb-83f0-ff4c676d3a6a	t	Gafatangwe	8a61b980-2b06-4b7d-a35a-9e9358f1dca3
b6d26251-ad8d-4a3f-9455-bc48bef90352	t	Gasenyi	8a61b980-2b06-4b7d-a35a-9e9358f1dca3
325f6564-0d68-4494-8cb2-aee6c7538eb6	t	Kagoma	8a61b980-2b06-4b7d-a35a-9e9358f1dca3
45db52ac-0efb-49c8-b80c-baef7008a2f6	t	Karuheshyi	8a61b980-2b06-4b7d-a35a-9e9358f1dca3
4014bc29-79e1-484c-95ee-64ebd162861b	t	Murambi	8a61b980-2b06-4b7d-a35a-9e9358f1dca3
eb7d1fcb-89ba-49d6-846b-8066a323c3cd	t	Musanzu	8a61b980-2b06-4b7d-a35a-9e9358f1dca3
e08d2b56-c173-4d85-b710-929585073e65	t	Gisizi	a318b157-f03b-48a1-aff5-e877904c23d5
50655b44-910b-4053-9c91-f0d7c5d161de	t	Kabagabo	a318b157-f03b-48a1-aff5-e877904c23d5
e3c15693-b507-4b0a-967d-1f25d2059272	t	Kanaba	a318b157-f03b-48a1-aff5-e877904c23d5
ae5c5171-0cc6-4eb1-9515-f7adba603e98	t	Kigote	a318b157-f03b-48a1-aff5-e877904c23d5
8f20bc37-5ccc-4a75-9ca1-d6aeb6d939e2	t	Nyagasozi	a318b157-f03b-48a1-aff5-e877904c23d5
568880f9-94aa-4658-905e-1f55755d1da6	t	Ruri	a318b157-f03b-48a1-aff5-e877904c23d5
76869171-b8d3-42f8-a6a3-c65c5b348e83	t	Bahenga	992b4139-6477-4f15-9ff6-9a7713740987
ef64972d-b012-45cb-b02d-32cf0b7bb1c8	t	Kabarima	992b4139-6477-4f15-9ff6-9a7713740987
dc993611-b53a-401a-b3d5-b7e269e814bb	t	Kabindi	992b4139-6477-4f15-9ff6-9a7713740987
e61042e4-f921-42d0-877b-afd6ed3f6392	t	Kajevuba	992b4139-6477-4f15-9ff6-9a7713740987
ac4cf901-2317-427a-a2f0-87e11bdbddf5	t	Kangoma	992b4139-6477-4f15-9ff6-9a7713740987
fd1d01e7-3546-4c65-984b-158b7a257955	t	Kanyendara	992b4139-6477-4f15-9ff6-9a7713740987
9fd49ffa-57b7-4a81-bb3f-351cf6bee689	t	Kidakama	992b4139-6477-4f15-9ff6-9a7713740987
5c26e11b-3290-4868-b74c-0ab3a7c48f3a	t	Mubuga	992b4139-6477-4f15-9ff6-9a7713740987
e48082aa-9c82-4dd2-af10-fab10fc28884	t	Nangimbibi	992b4139-6477-4f15-9ff6-9a7713740987
ed39391d-267a-4e3c-8eae-280f930b5001	t	Rusenyi	992b4139-6477-4f15-9ff6-9a7713740987
020cc397-5449-424b-bae6-5417ebe8ff62	t	Songa	992b4139-6477-4f15-9ff6-9a7713740987
f1cb33f2-3cdc-4a8d-aeb8-40f159a5f47b	t	Bihanga	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
b481deb4-1719-48cb-b386-148edc893a9f	t	Gasagara	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
c8ab7bfb-613b-4f56-8f1c-704bc41e7b34	t	Gikoro	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
b25a3c32-2dd0-46c5-987d-c914debc9f05	t	Kamatanda	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
8c916704-f590-43fe-a4bf-de1c09fc5fd5	t	Mubibi	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
b3c03829-b90c-47f4-af74-69b22628c0d5	t	Ntenyo	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
28f30be8-f1e3-479f-a2c6-38848e95bbf0	t	Nyangwe	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
5adaa543-65d3-44bd-a492-85ba23d04cfc	t	Remera	f5d8ccd4-5652-4b96-a28d-5cdde5eece32
5823da53-6fa6-473b-9ed6-b4032d63a533	t	Kabanga	a70060e4-ac19-4179-aa29-0e3eeafc7f25
9619a83d-bf87-48d0-8685-b9e993945941	t	Kangoboka	a70060e4-ac19-4179-aa29-0e3eeafc7f25
95e40794-77eb-4812-9ed3-6f9fde5de2ae	t	Kanyiramusen	a70060e4-ac19-4179-aa29-0e3eeafc7f25
445bee47-578e-4ec3-af18-c0d1fbd0f967	t	Nyangezi	a70060e4-ac19-4179-aa29-0e3eeafc7f25
86ee00b8-3a1d-46d0-b15b-20b747ee7c4d	t	Nyakabungo	a8230f35-9468-4fce-995b-263c370c6323
80c851fe-e517-4479-94be-441e7e040250	t	Ryaruyumbu	a8230f35-9468-4fce-995b-263c370c6323
8c47d8be-6b54-4011-bc5e-988ebafe0633	t	Kabuga	50324292-8790-43be-ad26-12373aaeedb3
779b8ef7-dafc-4e21-9ef2-03e799012692	t	Mubuga	1ebef1d6-2dd4-4069-af9e-fee80a9efbfa
ad030cd1-ecdd-4f1a-99b7-cde93b8168d7	t	Taba	1ebef1d6-2dd4-4069-af9e-fee80a9efbfa
09401a04-09b7-441a-b302-ec8562c72278	t	Karambi	fd96ec85-8dd5-4149-b963-858fd404ff84
2d951686-0ab8-4c09-be7f-e81c12aa5f3d	t	Nganzo	fd96ec85-8dd5-4149-b963-858fd404ff84
f01f4a78-6802-42db-bfff-c811905f0e73	t	Rutovu	fd96ec85-8dd5-4149-b963-858fd404ff84
8f398519-b587-4aa7-81e3-0c6d7eef8098	t	Kiboga	88013572-4e77-4103-aeb8-75e19881607c
b0ccfa25-17b8-4c8e-8eba-f99b3a2b2334	t	Kibumbiro	b8754181-a1ba-43f3-b4f8-62f742dcdcf3
ff6e4c81-3411-40ea-bb20-9d2ecd0f6710	t	Murore	b8754181-a1ba-43f3-b4f8-62f742dcdcf3
84e9bc35-942c-44b2-9f4e-adffa7eaaf56	t	Sina	b8754181-a1ba-43f3-b4f8-62f742dcdcf3
2d6de0fc-0ba1-46a7-9738-75ec77bed7fa	t	Gitwe	7bc6dfd1-8a9b-4912-994f-42605b4e85fb
d069e4f3-0ad8-4425-bf5b-369423c3f966	t	Mubuga	7bc6dfd1-8a9b-4912-994f-42605b4e85fb
960573dc-e551-47c8-b9c5-fce1aaae5c92	t	Butare	25370b0f-d529-4689-b35b-9a8eb7e6d62b
c474f7da-2ee2-4777-b0bc-677ae5cfe7ae	t	Kanaba	25370b0f-d529-4689-b35b-9a8eb7e6d62b
5d73db28-293d-4f6b-b17d-1206c9b3fbe8	t	Rukenke	25370b0f-d529-4689-b35b-9a8eb7e6d62b
22647a60-8270-4ec2-b2c2-6126a14801d5	t	Kaguriro	cefc7d9a-7b25-4e38-b269-f3b0f43178ed
7349fd13-70ab-4c37-b0f2-1e57ab394a03	t	Kiyira	cefc7d9a-7b25-4e38-b269-f3b0f43178ed
78b89d98-abb3-49ea-92f7-45e2a63d3f17	t	Rwitongo	cefc7d9a-7b25-4e38-b269-f3b0f43178ed
2f25555f-fa02-48b7-b66c-cd55e8caa8a6	t	Gisanze	5ecc1e13-8921-41e0-b903-b1dd522eda92
bd89a0cd-fb0f-484f-b6c6-9d430415bd66	t	Karambi	5ecc1e13-8921-41e0-b903-b1dd522eda92
4a236557-6c41-4128-9f0e-0d3e5a7f910d	t	Kariba	5ecc1e13-8921-41e0-b903-b1dd522eda92
f095d626-0a3b-4379-a5cd-460a6685a908	t	Karombero	5ecc1e13-8921-41e0-b903-b1dd522eda92
1fa492b2-95ba-4a37-91df-38ada7f0db75	t	Kigote	5ecc1e13-8921-41e0-b903-b1dd522eda92
d2122481-b95b-4385-a7df-6267ad678ff6	t	Musangabo	5ecc1e13-8921-41e0-b903-b1dd522eda92
0b5920aa-999a-4631-a720-19edff0661cb	t	Nyamuha	5ecc1e13-8921-41e0-b903-b1dd522eda92
f2df5c17-1d66-43a9-9fe0-9ad4ed00255f	t	Rusenyi	5ecc1e13-8921-41e0-b903-b1dd522eda92
73224f58-9342-4464-9ba1-15ac9847def4	t	Rwabageni	5ecc1e13-8921-41e0-b903-b1dd522eda92
13b42dfb-316b-49e2-992e-607d400b1149	t	Ryangarama	5ecc1e13-8921-41e0-b903-b1dd522eda92
c37cc646-18cc-490e-bf16-abb3c72d8991	t	Gitare	e9a149b9-821a-4117-9a26-918333d96d44
2ed3566d-b9fb-4686-b2b4-d8de448e329a	t	Kabana	e9a149b9-821a-4117-9a26-918333d96d44
a3a054d9-0820-4bc1-8ca7-761fd8254ef3	t	Kikubo	e9a149b9-821a-4117-9a26-918333d96d44
4b6420f9-821f-4b00-b82c-961a259b3dc3	t	Mfashe	e9a149b9-821a-4117-9a26-918333d96d44
f21fae5e-939a-4747-b8ba-fa8142ddb56c	t	Musarara	e9a149b9-821a-4117-9a26-918333d96d44
16815029-e52f-47d3-9b2a-d8ecde2cf752	t	Nyamabuye	e9a149b9-821a-4117-9a26-918333d96d44
da6678ca-d9bf-41ae-b4fc-f2bad181ccb2	t	Nyarubuye	e9a149b9-821a-4117-9a26-918333d96d44
eee7bf4f-503c-400c-94fa-ff3b79a8c7e9	t	Nyarugina	e9a149b9-821a-4117-9a26-918333d96d44
0c0f55cb-9577-4e88-8164-641c7a3d7278	t	Bugeyo	aeb348f7-e094-4e93-af6b-483e31808ff0
21b1d53a-ebc3-4596-9c38-fa2d0fe86446	t	Kigugu	be198dc0-0cf4-406c-8378-071af746d8d4
e631b66a-b647-4200-b6d5-c93ac3639354	t	Cyivugiza	6ab97eab-69db-4d8a-9423-cff359d1754c
3a56fc27-50e7-4a61-bdab-69655ff59bba	t	Karambo	6ab97eab-69db-4d8a-9423-cff359d1754c
4d08d6a4-2549-4270-9bfe-68e635d3cadd	t	Mbaya	6ab97eab-69db-4d8a-9423-cff359d1754c
96d940bd-c99f-4797-a4c3-4b1a3aa19c41	t	Mubuga	6ab97eab-69db-4d8a-9423-cff359d1754c
c6a6a4ed-fd5b-496c-aefd-7df337cf9e43	t	Mutabo	6ab97eab-69db-4d8a-9423-cff359d1754c
072eeae2-0613-4be9-a0b8-d00fa2bf7cc3	t	Cyamabuye	4cd34419-aecc-473f-a732-806b418b0298
10fbb791-eb01-4d7b-b297-70f69256d4de	t	Gikoro	4cd34419-aecc-473f-a732-806b418b0298
e71bc495-ba53-4fee-8361-01ee33275257	t	Karuganda	4cd34419-aecc-473f-a732-806b418b0298
0b1f7b4a-0f40-449e-9bbc-2e0e02167925	t	Nyabagenzi	4cd34419-aecc-473f-a732-806b418b0298
cc0caebb-0e49-4f66-a8aa-3852c5033007	t	Cyogo	410b05ab-4200-4657-99c7-0457ad7fc8c4
f33278ef-e694-42da-a834-eb1e35e92df8	t	Kabingo	410b05ab-4200-4657-99c7-0457ad7fc8c4
3dd03415-c63d-4403-9d5b-9a64cec86a12	t	Kirwa	410b05ab-4200-4657-99c7-0457ad7fc8c4
378c0f09-55aa-41fd-a353-d2359772fbe2	t	Matyazo	410b05ab-4200-4657-99c7-0457ad7fc8c4
30b15b3f-ecc2-4234-a1ec-514a22c6c33e	t	Ndabizi	410b05ab-4200-4657-99c7-0457ad7fc8c4
9e000016-f8cf-4cf3-8832-3bc7cc28c087	t	Gisirwe	c64ec44a-3380-47de-a9d6-1ca2d8cbc9c2
fdfd8846-86b1-4987-ac24-cdb7312329f9	t	Kiraro	c64ec44a-3380-47de-a9d6-1ca2d8cbc9c2
797a9905-7ae1-49d7-a713-990c70191ab6	t	Ruhinga	c64ec44a-3380-47de-a9d6-1ca2d8cbc9c2
de225eca-0f1b-4946-b6ba-12d07f42aa6f	t	Rusebeya	c64ec44a-3380-47de-a9d6-1ca2d8cbc9c2
14bf4960-8ac3-4278-b398-e3e946b310c8	t	Gitoma	845c6ed4-a93b-41a6-9ffa-b146aad5bb1e
4ddce27f-65d2-4983-99dd-cf87a996a8f1	t	Kanyaminyiny	845c6ed4-a93b-41a6-9ffa-b146aad5bb1e
ac9ba773-a557-495f-9426-d4e6c4de74d1	t	Murambo	845c6ed4-a93b-41a6-9ffa-b146aad5bb1e
ef4703b6-e962-4f4d-b66e-183bbea75e5d	t	Rukaya	845c6ed4-a93b-41a6-9ffa-b146aad5bb1e
915fa870-3ebd-47a4-91e9-70cd9b6b97a3	t	Gisiriri	7d397302-4f5e-4108-97c4-896ee788628d
3b59d16d-ce09-4c31-bb79-45f0202cc517	t	Kavumu	7d397302-4f5e-4108-97c4-896ee788628d
f0eeee62-6f05-42e1-8943-0382f8316f03	t	Musaga	7d397302-4f5e-4108-97c4-896ee788628d
78f6576e-6bea-4998-bf54-2ad766373f7e	t	Nyabizi Ii	7d397302-4f5e-4108-97c4-896ee788628d
bd60c0aa-5000-4cb6-bd9d-6e584aa6a5a5	t	Nyabizi Iii	7d397302-4f5e-4108-97c4-896ee788628d
e119a5a5-66bf-4ba0-bde6-300d533740fb	t	Rubayu	7d397302-4f5e-4108-97c4-896ee788628d
fc890ff3-12fe-4cd2-895a-7659f1633356	t	Buhita	28fdb6df-c824-4c96-9045-3c9bedba102a
3cac676b-2381-4837-a8d1-ecc21c12f077	t	Gitovu	28fdb6df-c824-4c96-9045-3c9bedba102a
6bd66b47-aeb1-4ec2-9b89-c2cdb11b52e2	t	Murambo	28fdb6df-c824-4c96-9045-3c9bedba102a
a2155831-fcac-4dd4-9c00-b1c8a8762cfe	t	Nyakira	28fdb6df-c824-4c96-9045-3c9bedba102a
fb6e9d66-3cde-4ddb-a22a-d8ba10ba95dc	t	Nyarutovu	28fdb6df-c824-4c96-9045-3c9bedba102a
53a75dda-8674-433b-8b73-61ad44f27504	t	Bitukura	84f6d064-e727-4a9b-a324-5c2d29e76be8
457b9069-9d56-487d-b7a4-768ee66c5579	t	Burango	84f6d064-e727-4a9b-a324-5c2d29e76be8
d7e67278-f6e1-4288-96cf-2230422f5697	t	Gafumba	84f6d064-e727-4a9b-a324-5c2d29e76be8
a99365a6-b5f5-4e04-a95d-6a30429d5ed6	t	Gashiru	84f6d064-e727-4a9b-a324-5c2d29e76be8
83cfa0c9-81d1-468a-aa45-2413224839ab	t	Karambo	84f6d064-e727-4a9b-a324-5c2d29e76be8
33bf0bb5-f139-48e1-b74d-cd59f0996657	t	Nyakabungo	84f6d064-e727-4a9b-a324-5c2d29e76be8
80338604-9933-49eb-a17c-64aed40d0c09	t	Rugarambiro	84f6d064-e727-4a9b-a324-5c2d29e76be8
7dd130ab-c484-4f8e-b175-f42e09f8a840	t	Gasiza	475844f1-9032-48c3-99ce-a71655588698
cae553b7-a585-42f9-931d-21b59c8b07de	t	Kabaya	475844f1-9032-48c3-99ce-a71655588698
b5f54a14-fd85-4d24-9ba8-90a62f639a99	t	Rucyamo	475844f1-9032-48c3-99ce-a71655588698
de804e24-39f5-4caf-8a02-308e1dbf622d	t	Rusasa	475844f1-9032-48c3-99ce-a71655588698
6c82d6f5-6c59-44cb-a1c3-73c1664800ae	t	Vumage	475844f1-9032-48c3-99ce-a71655588698
f95425c3-a9f6-4f52-85c9-36a39479a0c3	t	Buganza	4011e87e-53e2-45c4-b378-9f09d816369c
8584a672-80f4-456c-8f26-5890bc665dfb	t	Bukumbi	4011e87e-53e2-45c4-b378-9f09d816369c
dde5a423-e584-4215-9e92-3f57eff15d92	t	Kanyenzugi	4011e87e-53e2-45c4-b378-9f09d816369c
4fde3b5b-0223-4c9b-9fb8-8fcd516e12e6	t	Mushunga	4011e87e-53e2-45c4-b378-9f09d816369c
891d0c8a-1cd5-4e4b-879e-33ce141ef872	t	Gashushura	1d5706a1-195b-4130-8dd0-62d79e1ceb40
121d8cb9-1e1e-4ea6-b1d0-91723519ebf4	t	Mugano	1d5706a1-195b-4130-8dd0-62d79e1ceb40
a77a255d-af47-4fea-ab62-11622c0382eb	t	Nyamusanze	1d5706a1-195b-4130-8dd0-62d79e1ceb40
44bca810-2e81-4133-9339-64941157ca6e	t	Cyabami	95140f17-516b-449c-880a-6c39295598b0
39ffa8fc-5e86-41e9-9c83-45e5d7680a3a	t	Karyango	95140f17-516b-449c-880a-6c39295598b0
cd084fe5-d38b-4c0e-96c6-0349e8d6c705	t	Nyagahondo	95140f17-516b-449c-880a-6c39295598b0
023365aa-0436-4bc4-9595-6ad7dabccf66	t	Nyiraruhuha	95140f17-516b-449c-880a-6c39295598b0
e03a1a86-c3d3-46ee-8c71-afa61fecf98e	t	Ryaruhirima	95140f17-516b-449c-880a-6c39295598b0
72ef0fe7-3672-46ee-b2c2-25cca303d570	t	Bugarigari	df76d71f-4fbf-4405-9b5c-b60f902d3061
5ca0e78a-4487-4908-b545-9ae169f25a5b	t	Bukenyeye	df76d71f-4fbf-4405-9b5c-b60f902d3061
3771ec50-239b-4a06-9b82-25251fb5cd1a	t	Cyabarenge	df76d71f-4fbf-4405-9b5c-b60f902d3061
3a615835-ead5-4087-b0eb-efe82a20e990	t	Murandamo	df76d71f-4fbf-4405-9b5c-b60f902d3061
2a33a9b3-3b45-4894-b889-1ee0210bb6d4	t	Ngongwe	df76d71f-4fbf-4405-9b5c-b60f902d3061
77cf7120-327a-43da-8a08-ef627c913fc4	t	Rebero	df76d71f-4fbf-4405-9b5c-b60f902d3061
6f946618-a30c-418d-842b-62fb6669d5a9	t	Bishingwe	68a9bfd8-1bee-402a-9029-6c767f257920
fab55a7c-428e-4f5c-89b9-673ad5b42b8d	t	Cyave	68a9bfd8-1bee-402a-9029-6c767f257920
fb428e2e-5a12-401d-9c75-94bf2295cda5	t	Kagesera	68a9bfd8-1bee-402a-9029-6c767f257920
dbd24fc4-8904-4dfc-bec3-9c0030911167	t	Mugomero	68a9bfd8-1bee-402a-9029-6c767f257920
096a2a01-3f99-4e03-8887-79a601f6bd1f	t	Nyabitare	68a9bfd8-1bee-402a-9029-6c767f257920
d694de78-fb34-4589-b3e2-340113c23464	t	Hanika	990aa416-cee8-45d3-b7e1-3b256824cd02
d5ccf42c-93a2-4dfb-8387-67ef011e039a	t	Nguri	990aa416-cee8-45d3-b7e1-3b256824cd02
ce6411db-b8f6-48d4-9c55-4272a68f3d7d	t	Nyabiho	990aa416-cee8-45d3-b7e1-3b256824cd02
b91ae213-646f-4d0c-a8f6-23dfea953bf9	t	Rubeja	990aa416-cee8-45d3-b7e1-3b256824cd02
3f23ad4c-ce74-46b9-a926-d0df8c4e4c26	t	Bambiro	3e70440a-ac93-4ef4-8bcb-945c42fd9e7c
85b664bf-71f7-47ed-99a1-13958fc8ef8a	t	Gacyogo	3e70440a-ac93-4ef4-8bcb-945c42fd9e7c
75273aca-f74e-4d2c-87ac-0cb9fdc18392	t	Gahunga	3e70440a-ac93-4ef4-8bcb-945c42fd9e7c
5d835189-b5bf-44e8-8d35-7e22af113cd7	t	Kabaya	3e70440a-ac93-4ef4-8bcb-945c42fd9e7c
9447a590-6951-48ef-a923-0ab988f695a2	t	Rugarama	3e70440a-ac93-4ef4-8bcb-945c42fd9e7c
62cb324f-b888-406b-abf4-d31f3f625501	t	Rutamba	3e70440a-ac93-4ef4-8bcb-945c42fd9e7c
364b0dd1-65e1-4dfa-a2ec-8a1a7c849578	t	Gahama	163d9923-02b5-4b9f-bd50-ba0d25ae9964
080451f3-7ae7-4ec6-b4a6-2af99cebc459	t	Gasiza	163d9923-02b5-4b9f-bd50-ba0d25ae9964
188b1f1d-01c1-442d-b13c-fdf8b82d8080	t	Kabaya	163d9923-02b5-4b9f-bd50-ba0d25ae9964
a7d9a13b-f512-46bd-963c-dd901c3f8f06	t	Maya	163d9923-02b5-4b9f-bd50-ba0d25ae9964
5d6b26e7-6202-462b-9a0f-fde3a7f96519	t	Muhabura	163d9923-02b5-4b9f-bd50-ba0d25ae9964
9cb0c561-c28e-472e-b9f4-8dc868eae2d8	t	Mpinga	6f190d99-5801-49dc-9745-24f076f5feec
9dc93497-662d-4eaa-8845-fad4e328b41f	t	Nyakiriba	6f190d99-5801-49dc-9745-24f076f5feec
1fd6d43a-5a17-4008-a52d-e7eb476c9969	t	Rwambeho	6f190d99-5801-49dc-9745-24f076f5feec
d42644e6-988a-434d-8524-8d2d7b37748d	t	Rwinkuba	6f190d99-5801-49dc-9745-24f076f5feec
8858e4cf-7f87-411c-8f27-e836f05d2241	t	Bushima	ce714aef-c976-48a0-ab40-18af24c4fcce
e2c3ead3-5d1e-455a-849d-16b756f7802e	t	Cyogo	ce714aef-c976-48a0-ab40-18af24c4fcce
feb50eb0-b201-48b3-88be-02d25a6e4726	t	Murungu	ce714aef-c976-48a0-ab40-18af24c4fcce
40cd5e4d-728c-4ecd-b4d2-4d77fd2d1ca2	t	Musheke	ce714aef-c976-48a0-ab40-18af24c4fcce
f7d2a70e-be82-427f-93e8-7618ea40a522	t	Taba	ce714aef-c976-48a0-ab40-18af24c4fcce
25012f5b-9eaf-4c76-8508-57a3d9678b70	t	Burago	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
53ba66e0-cb02-45a7-9391-9ce0d2c117f4	t	Burande	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
67d9b8e0-e38c-4de5-8ab0-883f81775998	t	Gahinga	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
0dbb13b7-fb4e-41b2-b07b-edc6d0ff3c42	t	Kamonyi	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
30ace8c7-2e19-4a91-b004-1120897beb5c	t	Karubamba	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
57612b42-7409-4f2b-9086-263812a8f49d	t	Mugina	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
3e2d5a8b-0b05-4129-9d40-021426bcd2da	t	Nkoto	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
775d51bf-8168-4ce1-9d6b-0171cade7ca3	t	Nyabikungu	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
d88ae9bf-e0ed-4f1f-947a-e2d3d84db200	t	Rihiro	eb4b8623-fe5e-455b-82d8-1ac541cdf9c4
65359243-5827-4374-a9e1-f305220d4177	t	Bwenjeli	d40c2384-59e3-4567-90ed-c06a7f613ab3
02b3598c-83db-4579-930c-49fc89cad723	t	Kabira	d40c2384-59e3-4567-90ed-c06a7f613ab3
6d42f464-58d4-46e8-bf5b-3b9ffdaadd8c	t	Kabukoko	d40c2384-59e3-4567-90ed-c06a7f613ab3
b237138a-8965-461c-a3ba-128b86c143b7	t	Kabuyenge	d40c2384-59e3-4567-90ed-c06a7f613ab3
d559f774-593b-445a-b079-c39765b60e73	t	Kamonyi	d40c2384-59e3-4567-90ed-c06a7f613ab3
b72807db-e77f-43ba-b2cb-e57cfcf29862	t	Murambo	d40c2384-59e3-4567-90ed-c06a7f613ab3
b106697f-74f4-4be0-b70a-41aa057b3d65	t	Taba	d40c2384-59e3-4567-90ed-c06a7f613ab3
95d625b1-32b4-4c31-99ad-ad6d46eb5604	t	Gatenga	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
f0d6ede1-a544-472d-971c-96ba3b0bdb79	t	Kinyefurwe	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
22947f52-98b9-49ee-8ae8-2a4bac50bba2	t	Mubuga	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
715755f7-becd-40e2-b1ce-6cbb1237c792	t	Ngoma	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
7a8c38c5-41a5-4f98-ad1a-50dbec5be305	t	Remya	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
ed92435b-e284-46b9-8f68-26de03e7c3c6	t	Rugandu	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
7d1a0562-9eef-4322-9202-29c780cff873	t	Seta	7ed2fd7e-9cab-4577-834a-53bf0064a4b3
ba6dc577-c2ca-4d6c-8329-077473a83b1e	t	Gahe	8e0d6395-51e7-47ad-9886-61a3a88f749a
7a1f6d4b-d4cf-4f24-99b5-8c8cf2b9c802	t	Kanyoni	8e0d6395-51e7-47ad-9886-61a3a88f749a
5db2cb52-037b-4e0b-af32-b44cd1aa80e6	t	Kintobo	8e0d6395-51e7-47ad-9886-61a3a88f749a
35e010a8-aae1-4d06-bbfb-ac360e3d728e	t	Murambo	8e0d6395-51e7-47ad-9886-61a3a88f749a
889d02c1-5d88-46ee-8b8e-f6ca816d3ebc	t	Rukiniro	8e0d6395-51e7-47ad-9886-61a3a88f749a
eed154d9-81c2-4201-85e1-da29106c4b54	t	Rukwavu	8e0d6395-51e7-47ad-9886-61a3a88f749a
cc62a2d2-b411-4f50-bad5-457f6b929fc7	t	Gashinge	540187f4-dfd8-4147-8cc2-77392be54174
b01de170-2021-4ebc-89d4-359aafc81f4b	t	Gashishori	540187f4-dfd8-4147-8cc2-77392be54174
2a62526b-784c-4aa5-ab77-d700b835276b	t	Gatete	540187f4-dfd8-4147-8cc2-77392be54174
f0b5762c-b0aa-4a8d-8d30-a40175e37a5a	t	Gitwe	540187f4-dfd8-4147-8cc2-77392be54174
97adf9fa-4066-4cc9-85ff-b976816f4771	t	Nganzo	540187f4-dfd8-4147-8cc2-77392be54174
79e7b270-d878-486d-8c0b-4175f2a61542	t	Ruganda	540187f4-dfd8-4147-8cc2-77392be54174
e9b81a32-ee05-4ef8-9b4b-48f412cbf4f2	t	Rukingu	540187f4-dfd8-4147-8cc2-77392be54174
857a8864-6bee-4ed9-9949-fc50085f4e58	t	Terimbere	540187f4-dfd8-4147-8cc2-77392be54174
8d01281b-8043-4d3e-9c68-2fb93edf391a	t	Genda	1241649c-1a07-4466-8f1f-690e21edb687
b6bf0763-479a-41be-a148-9c1343fb8055	t	Muremure	1241649c-1a07-4466-8f1f-690e21edb687
203f0792-0daa-472b-97f8-bb989c59d7bc	t	Mweru	1241649c-1a07-4466-8f1f-690e21edb687
5b62bb92-baa2-4fc8-9c9a-e9abbae3f8aa	t	Ngoma	1241649c-1a07-4466-8f1f-690e21edb687
a32fa4c8-67b1-4f24-a276-66d9ada91548	t	Tetero	1241649c-1a07-4466-8f1f-690e21edb687
c1dd20a4-5b1e-4b1e-a5a1-17c7c9c302a9	t	Bugambanyon	0aba3c09-1b3c-4cc0-aff2-48466049572b
7079dc7d-f7b1-40d3-beb9-5fb16e7c5b3c	t	Gasura	0aba3c09-1b3c-4cc0-aff2-48466049572b
f9c1bad0-81c0-4dc3-b773-12d28da3c09b	t	Gatokezo	0aba3c09-1b3c-4cc0-aff2-48466049572b
e1cbfd89-42a2-47aa-9127-d73c489ec6f8	t	Matyazo	0aba3c09-1b3c-4cc0-aff2-48466049572b
ef8849eb-55b9-4bfc-ba28-36e958fe66f4	t	Rubyiniro	0aba3c09-1b3c-4cc0-aff2-48466049572b
a58c25da-1c2e-4b7c-b485-865dc5177cfb	t	Rusenge	0aba3c09-1b3c-4cc0-aff2-48466049572b
aa6e4b5c-9282-4e3d-9f78-a05acded554c	t	Tarasi	0aba3c09-1b3c-4cc0-aff2-48466049572b
965494cb-dad0-4a4f-af16-a1467d140210	t	Bucyaba	f0307efd-3f61-4852-a483-4bf1d6da7e57
ffcd6b57-3b89-4543-a599-7ac440a44304	t	Buzamuye	f0307efd-3f61-4852-a483-4bf1d6da7e57
be53549a-7f8c-4f5e-afd7-9c86ceb525d3	t	Gikore	f0307efd-3f61-4852-a483-4bf1d6da7e57
114bb9be-b939-4afd-a631-cf770d23c9cb	t	Ntagara	f0307efd-3f61-4852-a483-4bf1d6da7e57
38e7d954-5e04-419e-8df9-3536c5894efe	t	Burehe	3e285148-759b-40d2-a5cf-654475604299
a97c4c34-b3a4-4934-be10-1a312ccb53a4	t	Gitovu	3e285148-759b-40d2-a5cf-654475604299
54b84e20-5c15-4b64-afb6-d3a3a98fa22a	t	Kajerijeri	3e285148-759b-40d2-a5cf-654475604299
880f8853-fdd3-4a9a-a4b0-1c63cfb49d0d	t	Karorero	3e285148-759b-40d2-a5cf-654475604299
80cf3018-53d5-4da2-b6a3-6bba6e98d549	t	Kirambo	3e285148-759b-40d2-a5cf-654475604299
f14bcc23-5d7c-4562-af97-44615c623845	t	Ndago	3e285148-759b-40d2-a5cf-654475604299
9338a3b9-c8da-441b-9f26-ea9523191765	t	Nyarungu	3e285148-759b-40d2-a5cf-654475604299
b218719b-dc77-4eec-8404-fc989b972e65	t	Bumba	719a2290-4006-497c-aca3-fdfeb31b27e6
9b01c78c-34d8-4ce2-9bf5-759c578b65e9	t	Karuhanga	719a2290-4006-497c-aca3-fdfeb31b27e6
872de285-e2c2-4819-9bbd-799c6380b118	t	Ruhurura Ii	719a2290-4006-497c-aca3-fdfeb31b27e6
e2208c4a-9a0f-420a-b896-b44b9c22b30a	t	Rutoro	719a2290-4006-497c-aca3-fdfeb31b27e6
36bd7dda-d669-4c87-9822-074987758138	t	Burindwa	5a4bfc01-abb7-4788-9652-b992ee7a8a56
fcdf235f-7342-4050-8a25-b4fc92900f8a	t	Bisaga	80e8a61b-6c96-4e81-bca3-f631ed29e8ba
db04ff11-d170-47c1-85ea-77e82e631587	t	Gashoro	80e8a61b-6c96-4e81-bca3-f631ed29e8ba
0d3c7d9c-48fa-40a0-9855-4173fa669481	t	Kibuye	80e8a61b-6c96-4e81-bca3-f631ed29e8ba
8a41dfd9-5a63-4781-9a2c-c60b7c93db16	t	Ngonya	80e8a61b-6c96-4e81-bca3-f631ed29e8ba
72ede338-4a5f-41af-8b36-3e536cd3a391	t	Rugezi	80e8a61b-6c96-4e81-bca3-f631ed29e8ba
ad96e91c-b725-4343-ac99-fb2928790bd8	t	Rwerere	80e8a61b-6c96-4e81-bca3-f631ed29e8ba
df1f6fc0-4d85-4fcf-8593-892877588fce	t	Buhore	6c6667a6-d35d-4bf6-8336-2ea391a91c76
efdea4c6-0ba2-409e-8213-20a6006ef193	t	Gakenke	6c6667a6-d35d-4bf6-8336-2ea391a91c76
39abbb14-f5d6-4bee-b521-2b9210730f96	t	Kamatengu	6c6667a6-d35d-4bf6-8336-2ea391a91c76
b498f2ab-899e-4048-9e2d-4eae434f4303	t	Kinkware	6c6667a6-d35d-4bf6-8336-2ea391a91c76
eaa88f4e-722f-4e6a-90f0-4eb9e06be1db	t	Mugera	6c6667a6-d35d-4bf6-8336-2ea391a91c76
f156ac13-3aae-4e9e-abb4-c21a0073eee8	t	Ngoma	6c6667a6-d35d-4bf6-8336-2ea391a91c76
4b9539b3-1c3f-4574-a0fd-a32807f7d612	t	Ruconsho	6c6667a6-d35d-4bf6-8336-2ea391a91c76
c02fef7d-fb83-4331-876a-31eb04cebcb3	t	Gatovu	dfb5a19f-6ab2-4bb7-a3fb-c39daa05ebf9
88cc74ae-37cf-4a7e-b5e4-1b6262060b42	t	Mucaca	dfb5a19f-6ab2-4bb7-a3fb-c39daa05ebf9
bc641560-34b2-443e-8910-9e25395173b3	t	Murambo	dfb5a19f-6ab2-4bb7-a3fb-c39daa05ebf9
8e1f6af7-28e8-48a4-ba62-07eac1a7d0db	t	Mushubi	dfb5a19f-6ab2-4bb7-a3fb-c39daa05ebf9
68cebb74-bf85-4bdf-81f6-1000cde3c555	t	Tangata	dfb5a19f-6ab2-4bb7-a3fb-c39daa05ebf9
0faa44db-bf7a-428c-bbe4-0d3aef240a02	t	Birambo	b89bcb5c-0e73-4bb8-99ec-af3db37b4235
fcdc2e96-3ae0-46a3-a5fd-0c8a4c8538b3	t	Kirwa	b89bcb5c-0e73-4bb8-99ec-af3db37b4235
2f6b0de6-a718-4db5-bdde-c993e450da64	t	Nyarubande	b89bcb5c-0e73-4bb8-99ec-af3db37b4235
3362a3c8-3b05-44c7-bc52-46045e3477a5	t	Butereri	9a08b56e-0114-4c04-84bb-f81bf9e29401
8c768278-676f-49a9-be28-c354eadd8889	t	Rubaga	9a08b56e-0114-4c04-84bb-f81bf9e29401
06d6b153-1f1b-42e6-8707-20708576c5e1	t	Rwinkuba	9a08b56e-0114-4c04-84bb-f81bf9e29401
fba2a3a1-a01c-483f-84cf-390700116b84	t	Kajereri	097b8ab4-a213-4364-b459-a9110fde262e
18cfbc2d-ccce-4d14-a3d0-6f7f50b04be8	t	Kamina	097b8ab4-a213-4364-b459-a9110fde262e
ac6c3f4b-e527-4991-b6f6-d481887a22f9	t	Mwendo	097b8ab4-a213-4364-b459-a9110fde262e
064c6ae4-2f3b-443c-b065-452e9b2e81dd	t	Rusebeya	46da926a-b15b-400d-bdd0-bfcca1cca033
66b6e62c-10ce-4283-b54a-32362ac1bc70	t	Mugunga	2d8822a3-f5a2-4d07-bc95-72574e7f5e45
480651d8-6044-4ce1-a490-82d479e58bfc	t	Rutenga	2d8822a3-f5a2-4d07-bc95-72574e7f5e45
cac1931e-3a65-4a80-a994-8b30f1c899f5	t	Gashirwe	ef6f9807-ccd7-448b-ac9a-cb2b714a8864
f530e990-8205-4125-b06c-837d196e80bd	t	Bukamba	d4b9b904-33fd-43e7-979d-f09b90ca111b
e03b6a4d-853d-4bd7-b2cb-fdcf55018d3b	t	Ntarabana	d4b9b904-33fd-43e7-979d-f09b90ca111b
8d852d25-5cfd-416a-81b1-4c5cf9ea2b4c	t	Burengo	c364ec9b-c954-4803-8694-53de7a549fb5
4dc919ce-92d7-4dca-a2b4-9ba1c7bd265e	t	Bushyama	c364ec9b-c954-4803-8694-53de7a549fb5
97ac9989-7ab1-4321-93f7-a6ee7f00314d	t	Matovu	c364ec9b-c954-4803-8694-53de7a549fb5
f94bebbe-abbe-4233-8c39-81b5e0f8e5ab	t	Rwahi	c364ec9b-c954-4803-8694-53de7a549fb5
41b13980-60e3-4cf7-8f4c-0181293e8afe	t	Gaseke	4adca6f5-8096-4949-92c8-6e1df88e103c
fcb2bff3-622e-49a0-adcb-8ced08bbf5e9	t	Karambo	4adca6f5-8096-4949-92c8-6e1df88e103c
6a1524b2-168d-4a78-b893-17d7e1f27e51	t	Musasa	4adca6f5-8096-4949-92c8-6e1df88e103c
c07e0b3f-659a-4da1-bbef-3cc625d01e78	t	Gikamba	cbb39f33-9812-453b-9256-aaa6e89482c5
37c13e38-2b4a-4979-a26e-d3c3185d926e	t	Gitaba	cbb39f33-9812-453b-9256-aaa6e89482c5
b783a31b-5aae-4cba-bcf8-19d47feeabff	t	Busoga	2a6b86bc-1f69-4edd-82c3-caf98a2d453a
593f263d-9a00-47f2-af6f-9569931e4c57	t	Karombero	2a6b86bc-1f69-4edd-82c3-caf98a2d453a
ef8f249b-6c51-4ebc-8a10-7eac450b764c	t	Muhaza	2a6b86bc-1f69-4edd-82c3-caf98a2d453a
d3eb3e08-a781-48b9-89ca-15a01cdcca68	t	Mushirarungu	2a6b86bc-1f69-4edd-82c3-caf98a2d453a
828e3313-670c-4e55-95df-b586a685e22d	t	Ntaraga	2a6b86bc-1f69-4edd-82c3-caf98a2d453a
9d682c4c-3201-4744-aed8-c1f5b6196a23	t	Rutaramiro	2a6b86bc-1f69-4edd-82c3-caf98a2d453a
4c5e4494-9e55-4b3d-bb99-97342a25433d	t	Gatoki	e3b9352b-780e-4e8d-9aab-43673d2d0bf7
46cc1167-a9bb-4b16-a697-e68a63355438	t	Gatorero	e3b9352b-780e-4e8d-9aab-43673d2d0bf7
7c59618e-dc9b-4df3-985f-53cd294c5d91	t	Karenge	e3b9352b-780e-4e8d-9aab-43673d2d0bf7
d4057b9c-a78d-48bb-a36f-eed11f6a81d4	t	Muhororo	e3b9352b-780e-4e8d-9aab-43673d2d0bf7
ea14babe-331c-4079-bbe5-452972a6d3fc	t	Musebeya	e3b9352b-780e-4e8d-9aab-43673d2d0bf7
3feeb866-b459-4aa4-9ad8-f90954d379a3	t	Tongoburo	e3b9352b-780e-4e8d-9aab-43673d2d0bf7
03d8ab8f-1330-44ee-8e41-d4e573403378	t	Gahama	221f1541-aa6b-4137-a0b0-7ec2f0098ed9
9ab6e621-7719-40ed-993c-871b7d410486	t	Musebeya	221f1541-aa6b-4137-a0b0-7ec2f0098ed9
c01b5510-80ee-4903-8db4-11a4fdc39880	t	Rugaragara	221f1541-aa6b-4137-a0b0-7ec2f0098ed9
3e587ea4-5059-48ad-a562-553f6752c839	t	Rwobe	221f1541-aa6b-4137-a0b0-7ec2f0098ed9
e51df24f-76cc-4e08-a530-13f2bd70e238	t	Kambare	dc9d8d46-7669-419b-98cf-50b8a978ff41
07e3bbda-c7a8-4687-be85-e552a35ee6df	t	Kanyamukenk	dc9d8d46-7669-419b-98cf-50b8a978ff41
dc42d1d2-4f8f-4a5d-94b6-b64fcd4bfebf	t	Mutanda	dc9d8d46-7669-419b-98cf-50b8a978ff41
725eea57-7f8c-404b-98ea-fc7bbda85e98	t	Nyabisika	0ec58387-7f40-4bbe-8a52-523cf46572ae
763c0c3f-5bd3-4aa5-ac89-8f9e06a2ce3c	t	Rukore	0ec58387-7f40-4bbe-8a52-523cf46572ae
00b20cf1-2a01-430f-ad8e-8a0ad657701c	t	Karorero	d34abc36-33b0-4500-b5f9-e18c8c66dcfd
2ec1aacf-014b-4400-b522-229b059ced64	t	Kamatare	2980c451-6872-4b49-848f-83c1cb9b8994
7884d07f-4d86-4d4f-87bd-d65cc9434d23	t	Musave	2980c451-6872-4b49-848f-83c1cb9b8994
4a8d5aa0-384d-4e8b-93c6-c22cf16c2470	t	Gishyinguro	8d207ecc-c6c2-4bae-8da4-0e02838b208a
f80032f0-3613-4d60-97a5-afd98e837848	t	Karuganda	8d207ecc-c6c2-4bae-8da4-0e02838b208a
48232781-6bce-4fcb-b2ba-25f8aa157307	t	Kabaya	c9c732c3-c2f1-488e-936a-aa24836cab80
ec22167d-d877-4e98-a6d5-f9b3e73123a1	t	Sitwe	c9c732c3-c2f1-488e-936a-aa24836cab80
4480f982-4dc5-41f7-a7fc-96e66681e48b	t	Umujyi Wa G	c9c732c3-c2f1-488e-936a-aa24836cab80
0b210b36-4956-40f2-9ec2-c0e8ae7b2def	t	Mukira	12cfc3eb-1906-4be0-9bb5-a7e7923e2b11
28571c88-5ac4-4bc6-9a23-59382170fb22	t	Nyamure	12cfc3eb-1906-4be0-9bb5-a7e7923e2b11
e271d113-2c8d-4a5e-8176-b996979745ae	t	Ruhore	12cfc3eb-1906-4be0-9bb5-a7e7923e2b11
e59a71f9-5320-4042-816e-cd2d179c571d	t	Kirambo	5636e5bf-4bdb-4526-87fb-c0679951a873
55d7d7a9-ad29-40fe-8e1b-ad0940fd6893	t	Nyamataha	5636e5bf-4bdb-4526-87fb-c0679951a873
36006a9c-220c-4190-94ec-6d13d8e538fc	t	Kabugomba	2e4e028e-c395-4cd3-ba91-ffebad5c6a40
22751f26-ef20-4f73-8874-2356f574c758	t	Murambo	2e4e028e-c395-4cd3-ba91-ffebad5c6a40
86605d8e-60d1-4673-bb6c-ed4582005e74	t	Busaro	2aaa460d-cb96-4385-8ea2-739a5ccb9fea
3ae60227-c0f0-47aa-a1a2-f0d69d508f13	t	Bushita	2aaa460d-cb96-4385-8ea2-739a5ccb9fea
a6bcfd11-719b-459e-8213-62b920665c3d	t	Gihanga	2aaa460d-cb96-4385-8ea2-739a5ccb9fea
7a7f3666-376b-43dc-94a3-d00b5a19280a	t	Kanteko	2aaa460d-cb96-4385-8ea2-739a5ccb9fea
4c410a67-638f-48ea-bab0-6c43b6e7130f	t	Bukerera	2be9d570-5bec-4a91-b535-62ea1bbecd28
b32e2982-021b-46cf-91ec-3f38877c7a2c	t	Kibonwa	2be9d570-5bec-4a91-b535-62ea1bbecd28
18767ca1-0027-432f-bcce-775e033e7bca	t	Gitega	ce29377a-d623-41ca-a1f9-76d5e2f73eef
19592050-ab0f-454f-a752-2b5057a97467	t	Kinoko	ce29377a-d623-41ca-a1f9-76d5e2f73eef
ee0e1cb8-d47d-4c89-baad-07cb62ad282c	t	Rusasa	97f1fc3d-1bb9-42df-bf33-633ee7201b5e
fff813a6-ee4f-45bf-8194-d9ade488eef7	t	Rutake	97f1fc3d-1bb9-42df-bf33-633ee7201b5e
f2175aa3-0ac3-4661-80b4-9662471c53ad	t	Gitwe	ca7a8b94-d858-44d7-8444-1f75790ed989
60bcbaf7-c5a5-429f-b920-eb33915766ed	t	Kabuye	ca7a8b94-d858-44d7-8444-1f75790ed989
3c559b91-49e7-4690-bd33-62f04f88a992	t	Rugari	ca7a8b94-d858-44d7-8444-1f75790ed989
8d2375b8-51fd-4a9a-ad01-c3edc0b0a45a	t	Bucyaba	bd3b98ca-0dd7-408c-85ba-4e9fa398b1f9
88350a14-b5b8-4384-b3a0-519492a7beb7	t	Bugogo	bd3b98ca-0dd7-408c-85ba-4e9fa398b1f9
e48af062-d829-4861-8ecd-93bfd8b43a88	t	Rutagara	bd3b98ca-0dd7-408c-85ba-4e9fa398b1f9
29d1ab1b-9b0b-454f-99d6-606042748a3f	t	Mbatabata	f9428e31-112e-4c50-b7b7-2d515d53e360
55675395-1122-42b2-bc41-4b480bc57f6c	t	Kabutwa	961ecfd3-6dbd-4c7b-b7ab-5ca7209cabdc
8a015e25-4afb-4d3d-9fe7-839b20e32da6	t	Kabutare	e0ffe874-2cff-4611-913f-b5d0a07378ae
28db1905-70b0-483e-a08d-349c98994271	t	Cyumba	c8d86e0b-c96d-4588-9b2a-e29be2921583
5e505927-f1a8-4a7a-9ff9-0facb4b886db	t	Bukondo	3bb76088-c54c-4ac6-a82e-cf8e6e387239
a181e0b2-14c6-4f87-9add-4688f38aae75	t	Bukunga	3bb76088-c54c-4ac6-a82e-cf8e6e387239
18a58bed-d9e4-4b8b-934e-747f35884a6a	t	Bigogwe	b1cd17a0-efdf-423a-99d7-cf4059ce5042
918d0eeb-3ef0-4ca0-8911-1c49a8d42855	t	Nturo	6f1edabf-337d-4f28-9d32-c67c642fa367
f6826071-c5ab-4848-8ec2-9d4744cecde3	t	Mugali	a4f5bdcf-cf83-46ca-844a-1e17576605e7
23effd77-a382-4615-9470-a2c92dd700d4	t	Rurambo	a4f5bdcf-cf83-46ca-844a-1e17576605e7
b320d19e-9eea-44ac-a0c5-17d3d2314c51	t	Rutamba	a4f5bdcf-cf83-46ca-844a-1e17576605e7
3687c94e-4c37-4b20-aae6-e5496b8552fc	t	Rwamabare	a4f5bdcf-cf83-46ca-844a-1e17576605e7
a7372fd0-d4bf-4092-a596-fd5326bd550d	t	Kivuruga	a90b8e78-44c7-44a0-8953-4871c1ee715e
de931b26-0bf2-4a8c-a8e6-53083a4be8c7	t	Nyamiyaga	9dc24897-812b-45b5-a111-42618f90de35
931a6b79-f047-4c9e-9eea-11b6482d8bd1	t	Muhororo	4773f22b-b82b-4737-8228-04cf2915a3f5
036ac31e-c6f2-45f7-95ad-fbf7bc581b79	t	Munini	4773f22b-b82b-4737-8228-04cf2915a3f5
a3766bb7-5be0-44c6-8c9d-265ef22e5350	t	Ruhanga	4773f22b-b82b-4737-8228-04cf2915a3f5
5ea6133d-4462-46b2-a31e-8cccd8cb1c1f	t	Gihita	faac8fd6-8f62-4db1-bab1-e3a402eefacd
ee825def-a17b-46fa-8d38-10faac266f7c	t	Karambi	faac8fd6-8f62-4db1-bab1-e3a402eefacd
96312474-bd4e-4ade-9907-5964e8c9617d	t	Mwanza	faac8fd6-8f62-4db1-bab1-e3a402eefacd
d24a60a8-2b1c-4007-a71c-29725111013a	t	Kigeyo	7abd9055-d973-436b-8530-08184d5f9c2c
427a9c5c-fb54-4be9-9948-146efec9549a	t	Kivuba	36946fd6-67c5-4738-b1d6-3883bb64b20e
bf9ec0a5-6633-4f42-ba45-7aec3835fc5d	t	Gisovu	08e01c7d-8397-4fcd-aee7-14b9fae6dd0f
3e521bbe-f756-47d0-a6a8-3b7a291c2408	t	Kabuga	08e01c7d-8397-4fcd-aee7-14b9fae6dd0f
ef72a292-32d3-45de-af5a-64058d4a8d74	t	Nyanza	08e01c7d-8397-4fcd-aee7-14b9fae6dd0f
d3b2bb4f-1085-4015-b054-cdb90d8c0fda	t	Gitaragwe	10b4d674-f888-4b6c-8eae-ec066283b675
de2218f9-0888-488f-a9c2-17ac6b8bbcda	t	Sarabuye	10b4d674-f888-4b6c-8eae-ec066283b675
d7d3b027-274b-48d9-850e-907eeff8e9cc	t	Cyinama	825aa441-6a81-4198-973b-a087fc7fb8af
19315c6b-7dcf-4ebe-a759-275df52944ba	t	Giheta	825aa441-6a81-4198-973b-a087fc7fb8af
304ce8db-5c06-4138-bb7c-7869983437d4	t	Nyagahondo	825aa441-6a81-4198-973b-a087fc7fb8af
87df6dce-abb9-4682-afeb-f72f130bd986	t	Nyakagezi	825aa441-6a81-4198-973b-a087fc7fb8af
3e55fcd9-e2a6-4328-96d0-3c33385aaf18	t	Rwimpiri	825aa441-6a81-4198-973b-a087fc7fb8af
1b1c2922-8cd9-4286-b7ab-6970b6ec79f9	t	Cyarubayi	b4d1c5f1-99be-4d99-b9e5-69132871b4fa
90ea01c8-2d9a-45c1-a1c8-ef021d2dfda8	t	Karambi	b4d1c5f1-99be-4d99-b9e5-69132871b4fa
e302d757-381d-42ca-ac70-a68ec3184d6f	t	Muhororo	b4d1c5f1-99be-4d99-b9e5-69132871b4fa
aa4dcc88-df25-40e0-8950-8dd04308a1a6	t	Nturo	b4d1c5f1-99be-4d99-b9e5-69132871b4fa
e31972af-9434-4d7a-9f27-cf60d5278ed4	t	Rwezamenyo	b4d1c5f1-99be-4d99-b9e5-69132871b4fa
65d398c6-4623-4228-9685-181c759bb90f	t	Kabuga	e0d89c23-9fd0-4ba0-aa3c-b780bd20494f
3325e969-970f-449f-bee2-09749d3069c3	t	Kanaba	e0d89c23-9fd0-4ba0-aa3c-b780bd20494f
83c646b0-39aa-4625-ade1-8c14f76094cc	t	Rusebeya	e0d89c23-9fd0-4ba0-aa3c-b780bd20494f
2071bbaa-bc2a-480b-ae4a-70a3c3ebcdd6	t	Gacemeri	9d553484-a930-44d8-9bca-e9dfc648822c
a305cae9-8f43-4292-8e7b-fc19ee9082d9	t	Gatonde	9d553484-a930-44d8-9bca-e9dfc648822c
ee3a8029-bed7-4698-856d-6357f0035657	t	Muhororo	9d553484-a930-44d8-9bca-e9dfc648822c
9673475e-c52f-4f3a-9009-07866cdd2835	t	Biraro	9d803d09-d559-4f53-9161-5434fca40bb4
8be18663-a34f-4c44-825c-5dead03c2b56	t	Bushoka	9d803d09-d559-4f53-9161-5434fca40bb4
9713b30d-b17c-42d2-b508-df5ca2ae8b3f	t	Gashubi	9d803d09-d559-4f53-9161-5434fca40bb4
ec92a0b1-2130-4636-8c7d-e1f3672b238e	t	Kanyinya	9d803d09-d559-4f53-9161-5434fca40bb4
edb9ff73-19c0-4423-999d-5747a3b0e809	t	Busake	4a34f41a-b304-4c1c-a95a-5cad7a825511
a5ab5efd-3909-434d-8aa0-f5dec249dc81	t	Gatare	273aa86c-f556-42fc-827e-c8dc1cb0dcaa
17d8e988-0510-44f9-aa97-8221bf0d117f	t	Gahinga	00b1fd1d-f870-4531-a453-b3bb3ed93c28
e38ff69b-36b0-48b1-9b4b-40fe7d925193	t	Taba	09ee9e14-4bf9-4438-84b0-5140125494e5
85789238-ae6d-4170-ad24-e4e7c3cfad76	t	Huro	314a88b3-bf50-42ce-8672-a53addf58a8a
2e998658-5e3f-4c16-977b-e23728302139	t	Cyenda	62d10e68-30f9-4cee-af7f-a271a100743f
3415485d-3c56-43b3-8c8c-c6b3cae2a7a4	t	Buhinya	4bfc41d9-4166-42d3-86df-17e60f620102
5d3cf675-3592-4dff-b229-f2a4a13e34a3	t	Mubuga	8501e8ef-8902-49b0-8a8e-ca4459956fe0
93e112b6-895e-493d-b561-1a3a59f5b573	t	Bumba	0f329f83-a34d-4d08-914d-f3523e727568
a9b1649e-4346-4381-9115-3ccf6dbc9f6d	t	Kabingo	fbdedc8a-04b8-45db-b8c1-ff92dfae1d19
9f86a4ce-2c22-4672-8a44-c44d99117ffb	t	Sanzare	fbdedc8a-04b8-45db-b8c1-ff92dfae1d19
1954b882-abfb-4730-80d1-db6fd81812a3	t	Muhororo	2055b102-528a-45e5-8c01-80b725255465
a8e6cd83-afdf-4c22-acb3-a8b5ba0b6364	t	Nganzo	2055b102-528a-45e5-8c01-80b725255465
b21bd91a-11fa-49d9-bb91-6f75df473379	t	Gitabi	b566dfc4-1e06-4e0f-8f73-f3cb42e73caf
633ceac1-c47a-4abf-bde6-ebc5199e76d0	t	Kasheshe	b566dfc4-1e06-4e0f-8f73-f3cb42e73caf
f61df7dd-44d4-4d24-9a6a-83bbf1d276ab	t	Mwirika	395bceab-8387-4605-9fca-07b770028cc4
cf40b61d-bc7a-4605-9efb-385ffa9aa5bb	t	Cyinturo	494efbd5-7fc0-4068-bab0-c6ed176a5e2b
03a5ee9a-877c-4390-9d63-a59fd0bf5efd	t	Buranga	492034a9-1fb8-4ad8-9513-4ad94a66776a
0bb95bd4-6a48-410b-ae4a-d7357e8aff9f	t	Bukurura	554b6e1c-2d97-43c7-a02a-2da02462575b
1e4310b9-5fe4-400e-9e24-4a2ec91febf6	t	Gisagara	5ce9df04-bb7a-4c75-a28a-5fc2123c00bb
65f9a5db-a4c4-4cb5-a2fa-a5fb447a015e	t	Kabushara	5ce9df04-bb7a-4c75-a28a-5fc2123c00bb
b813b088-3bb6-409b-ad57-4e7e6f48ee1c	t	Kanama	5ce9df04-bb7a-4c75-a28a-5fc2123c00bb
47ee77a8-33bd-48b4-9c75-2828205f3bbc	t	Kanunga	5ce9df04-bb7a-4c75-a28a-5fc2123c00bb
f3280729-f28c-4f06-955b-6f6c6423adea	t	Kirehe	5ce9df04-bb7a-4c75-a28a-5fc2123c00bb
b1c68cd9-99cd-41f7-b4a9-ef408ab1361b	t	Mushubi	5ce9df04-bb7a-4c75-a28a-5fc2123c00bb
bfcdb348-4e0e-4b16-9921-7519670f87fe	t	Cyahafi	aaa24563-208d-48d0-ac37-7ef85e39c52d
3b82623a-ff4e-4337-9d26-1d17ca502af3	t	Gatare	aaa24563-208d-48d0-ac37-7ef85e39c52d
7134b390-95d5-4674-bca6-20f0d53d70a1	t	Kiruhura	aaa24563-208d-48d0-ac37-7ef85e39c52d
1299485e-9bbd-4344-a719-cb2da276b048	t	Cyoganyoni	a1719c8d-cc46-4169-9da4-e0b33532fef8
401d3b5e-cc8d-4800-9150-ec417385bb03	t	Kabare	a1719c8d-cc46-4169-9da4-e0b33532fef8
c8a4a225-9a2e-4376-bca0-be29c344f896	t	Rugaragara	a1719c8d-cc46-4169-9da4-e0b33532fef8
08c9d3b5-8f20-4ebe-b3ce-496258829bd4	t	Bushoka	202f66a3-e3e5-46cd-8094-77c58d5c1696
bd6bdb45-65a2-4e37-9163-1a57530c0523	t	Karango	202f66a3-e3e5-46cd-8094-77c58d5c1696
eab0bde2-28fd-4de1-ab53-0e463bd27748	t	Rumasa	202f66a3-e3e5-46cd-8094-77c58d5c1696
e6f5574e-c60e-4823-b783-12c206b4411b	t	Gatagara	45a0ee3d-66e4-4cfc-9721-3d97381e239e
893cf9c8-e70a-4209-af70-6beafbf28487	t	Gihura	45a0ee3d-66e4-4cfc-9721-3d97381e239e
e44b3cc5-4f11-4c56-b623-bb52feacd361	t	Gitonde	45a0ee3d-66e4-4cfc-9721-3d97381e239e
87d7603e-dce0-4f8b-98f6-8628ddd217e3	t	Kinyonzo	45a0ee3d-66e4-4cfc-9721-3d97381e239e
43e1cacb-0e7f-4399-bf2b-61bfad768373	t	Mubuga	45a0ee3d-66e4-4cfc-9721-3d97381e239e
b4b2202a-1731-4e26-8502-6cbf2d301d39	t	Murehe	45a0ee3d-66e4-4cfc-9721-3d97381e239e
ef783da9-0b24-4413-a01c-4a2f6aa9ab17	t	Bariza	9cc56841-c3b8-4d01-b1c0-b1075e617b52
b6049b97-fca2-4ad3-b444-7ebcc5d67443	t	Gataba	9cc56841-c3b8-4d01-b1c0-b1075e617b52
df761bb9-3ac0-4030-a05b-b0c2408f7594	t	Gatare	788f8673-4743-4778-9173-f2f48ace6c96
b20c41a8-51c7-40a8-8011-5c3d79abf121	t	Mugwato	788f8673-4743-4778-9173-f2f48ace6c96
d4396993-1c00-48e4-be69-4d12f4b4bdaf	t	Gahama	5e994475-0f06-45c8-a31c-c526690c23f7
fa5ce780-fa93-4d0a-aec4-d62635129b09	t	Gataba	5e994475-0f06-45c8-a31c-c526690c23f7
9217b95a-5bdb-407b-b0fb-cd8460bc9f73	t	Kebero	5e994475-0f06-45c8-a31c-c526690c23f7
999269f6-e50b-4714-8e11-cfce9716d8b0	t	Burinda	0fff02c5-f370-4a88-9218-980b2142ba97
bd5cd069-ff53-4cf6-83c8-4248804bd6b0	t	Gakindo	0fff02c5-f370-4a88-9218-980b2142ba97
7b4191c1-345a-4b12-b9b5-38c50d035423	t	Gapfura	0fff02c5-f370-4a88-9218-980b2142ba97
9fbf5e6a-278c-4e60-88a3-c596f1ae0c56	t	Gitwe	0fff02c5-f370-4a88-9218-980b2142ba97
93ee1376-72cb-4e6e-8092-82f1f28c917c	t	Kidomo	0fff02c5-f370-4a88-9218-980b2142ba97
fc6b36f2-becb-4933-81bc-03c892d69754	t	Nyagahama	0fff02c5-f370-4a88-9218-980b2142ba97
498e8977-d3eb-4477-8038-6d129de8dfa9	t	Rurambi	0fff02c5-f370-4a88-9218-980b2142ba97
04cec8b4-3da4-41bc-87fb-27684314513f	t	Buharabuye	b603cf02-1de2-4794-81c8-3d2dd4dec149
ac66a38f-5186-4f73-b5a8-f75afcfc1ee2	t	Karuhunge	b603cf02-1de2-4794-81c8-3d2dd4dec149
f419fd9b-91e4-476c-affc-860ee133bc9d	t	Kirehe	b603cf02-1de2-4794-81c8-3d2dd4dec149
f5f851dd-ae49-4de7-9b2c-148c567b2e97	t	Nyange	b603cf02-1de2-4794-81c8-3d2dd4dec149
891634c4-fc0b-48ec-bea5-96917a16d8fc	t	Gisovu	7b600b9a-ec98-403a-9e72-dffdfb705f13
9048370d-9946-4ce8-9749-110f6a45c507	t	Bukiza	71e1629a-3e37-49de-a782-4eca95e50878
3bbf3920-fbe6-4a92-8774-633905a62a5c	t	Buyora	71e1629a-3e37-49de-a782-4eca95e50878
7928e8ee-e180-47a9-9f59-421ff7873cbc	t	Bwanamo	71e1629a-3e37-49de-a782-4eca95e50878
32eb63b0-3cec-4e50-a00f-5dbc951f06fb	t	Ninda	71e1629a-3e37-49de-a782-4eca95e50878
8c4b3316-5757-49fc-a969-c9351c04edf2	t	Kabuye	b8ef97cf-feb6-4985-a79e-dbdc35837ade
5316fffd-a3ae-4eab-857d-942516372a50	t	Gisiza	b7bbd187-7985-4cd9-a132-041d6f50a6e4
1fbadb82-15fc-4d01-842a-1c31cae016fc	t	Nyagasozi	42d0b8a1-9353-4a23-b26c-850810bb5489
14ccda04-3bab-4dda-ba44-64ea53e47eca	t	Rugarama	42d0b8a1-9353-4a23-b26c-850810bb5489
82f8efcb-795d-4790-9604-32c26eca1ad8	t	Kabeza	02323fdc-0e8e-451e-bfcd-8315f854b168
21099dbb-3c2d-4b06-8b1c-ff88e7d129dd	t	Nganzo	02323fdc-0e8e-451e-bfcd-8315f854b168
5b025f86-24af-428c-81e3-2ec8a8050b2d	t	Gisanze	ba2c651c-6505-4654-ade7-582f4aead3cb
a1317afc-7d12-426b-afeb-d762c4937886	t	Gikongoro	799597ad-9dd1-49b2-8d4b-fd8504416ecc
8e2a77dc-eced-4ae0-889f-fb8093c13e38	t	Giheta	6573fd73-8475-4b92-9d16-49cd5961cc49
c447654b-701a-4f00-969d-622696e284a0	t	Karushashi	6573fd73-8475-4b92-9d16-49cd5961cc49
9e95fc3c-6296-4e46-83e1-e02da3ca0042	t	Gihororo	a91dda7f-fc3a-45d7-974a-0b6f4c4ec117
3d27e8a7-6132-482c-9e32-4fde0bf7bef0	t	Murara	a91dda7f-fc3a-45d7-974a-0b6f4c4ec117
ad59e3b3-8b39-4774-bac7-a150a3459345	t	Nyarutovu	e5d19481-dd2b-4c24-905e-b5059848dd91
5aa27b92-eca6-4a7b-b44b-6724f422947b	t	Rebero	e5d19481-dd2b-4c24-905e-b5059848dd91
c91ef474-3e06-4986-aa4c-4dc89f206fe3	t	Kanyogote	17c2762b-e439-43aa-8c48-25982a078d9e
e234fa4c-d11d-41e2-9994-66cea01b2a16	t	Rugogwe	17c2762b-e439-43aa-8c48-25982a078d9e
bcee753a-35e2-48b7-9d60-d863803ef476	t	Rwarenga	17c2762b-e439-43aa-8c48-25982a078d9e
f72e5af6-c431-45ab-aabe-be308bbc89b9	t	Butare	d82e4b72-7d05-4a27-bbb6-0e6cfa2d04b9
ddb00dde-6d0a-4ff5-b200-76673fc32851	t	Karambo	d82e4b72-7d05-4a27-bbb6-0e6cfa2d04b9
fd5018f5-2629-4efa-baa9-23c82d4768a6	t	Gicaca	f9fcaef7-44ce-41ad-9b81-81b7b3206fca
b7da8f8e-ca43-4132-b123-79911f298fb0	t	Mugorore	f9fcaef7-44ce-41ad-9b81-81b7b3206fca
7dc0383f-8ab0-4ab4-a0b3-a91cbfadbe55	t	Ntarama	f9fcaef7-44ce-41ad-9b81-81b7b3206fca
35c4e7b5-6491-4853-aa7a-ae4dea2bc070	t	Kabuye	1c97f9b0-6faf-4d81-ba5e-75c07c4eb9c5
d893a5ea-8381-41e3-805e-565e5ead9e60	t	Kidandali	1c97f9b0-6faf-4d81-ba5e-75c07c4eb9c5
fe87d7d8-452f-4a0a-8c7d-c70c5c21773f	t	Nyarubuye	1c97f9b0-6faf-4d81-ba5e-75c07c4eb9c5
ec3ff14e-f642-449c-997d-fb93b7b2444d	t	Rutoma	1c97f9b0-6faf-4d81-ba5e-75c07c4eb9c5
f5f60c87-f4d5-4b71-9142-4dfdb1cc3edc	t	Kumana	16892d16-2771-40df-a5d8-afcc5e9e6628
cd8ef269-ec88-49c4-ad9c-5bf0fee20913	t	Kumunini	16892d16-2771-40df-a5d8-afcc5e9e6628
dcd0b7ac-fa9e-404f-b846-e566fb7a1260	t	Nyakagera	16892d16-2771-40df-a5d8-afcc5e9e6628
96f594bc-b5a4-4022-86d5-be3b831674c0	t	Ndayabana	e6c57623-b25c-48fb-b5a0-5393e2e0bf37
567c970a-ac32-4792-8651-1624135666b5	t	Gacurabwenge	e4b710f5-06e6-406b-92aa-3ea6f414a499
b1d558c0-a3c5-4a29-a7e4-12e6f52031ec	t	Gisuna	c3e3192b-a996-43ab-aebe-83dfa38b8329
dd209fcc-f1f7-496e-9991-6e0cd3ed2860	t	Rugarama	561fa7e9-e0ad-4961-9a67-d60122772eab
8e7f9164-ffd8-41d8-bc25-e074d75f7208	t	Kivugiza	58d91c77-d925-4fbd-b327-f0929ee44ff5
69c3e9e8-c324-4a0e-8165-43f3992fe2cd	t	Taba	be04b579-b380-4338-b06d-fd9d481a5d59
dde0eb62-0e0a-44e7-a813-0bc240d1dcd0	t	Kimirimo	b4016398-408b-4c29-a3ae-09634cdc28a9
b4a3a2b5-a726-49fd-b2ac-6530c0f86a88	t	Mugomero	67fb8aa6-0d2f-4fd1-a5a6-03ec84a7384c
8826f180-4fa3-4b3f-8478-61b957d26002	t	Nyiragasuruba	67fb8aa6-0d2f-4fd1-a5a6-03ec84a7384c
7ce5f850-a365-43ad-a1b2-78138945e1dd	t	Mukeri	b9302f89-eef5-4987-8d28-5f6e396c75f2
b8f7777d-6984-42d1-9426-364e43736875	t	Nyamiyaga	b9302f89-eef5-4987-8d28-5f6e396c75f2
b07d20f3-331a-4639-8010-cda47bf14ef5	t	Nyarubande	b9302f89-eef5-4987-8d28-5f6e396c75f2
6816a3f0-711c-4298-9e9c-568735c835c0	t	Rugarama	b9302f89-eef5-4987-8d28-5f6e396c75f2
1ac0a48b-6d1d-4f3c-92cd-93fc05c6fd82	t	Mubuga	761e32ac-d818-4185-91b8-c5459ba4506e
771ef378-127f-4d38-87ce-83cb8d69df91	t	Nyamabare	401f3f7c-c520-40e3-9ec2-e75a74e7b38d
1a31a94d-5793-4590-96d2-9035c761486d	t	Rugerero	401f3f7c-c520-40e3-9ec2-e75a74e7b38d
1ed5b875-7cff-4fc0-8e94-fb9836cafc46	t	Gashija	4af06e2a-96bf-466e-a261-41e830eeb74f
93e4b072-ca1d-4b07-9bc8-983348a6ac8b	t	Kabare	4af06e2a-96bf-466e-a261-41e830eeb74f
13e10cab-d071-4f5b-8049-94a3c2e9c992	t	Remera	4af06e2a-96bf-466e-a261-41e830eeb74f
290d4f5e-63fc-40d5-a09c-71496615098d	t	Ryaruhumba	4af06e2a-96bf-466e-a261-41e830eeb74f
6de403a7-9522-4128-8c4e-93f240afedbe	t	Burambira	f617471b-c2a0-4fba-afd6-d0d8f41abe00
1f1bb67f-6a44-4015-85e9-bb1cc637f698	t	Gipandi	f617471b-c2a0-4fba-afd6-d0d8f41abe00
4e6976d4-22b5-4f28-bdf8-8089a8003da3	t	Maya	71b598e9-1fb4-48d4-867f-729b3b971a3c
6c67e3bf-96c5-4c93-b169-aaac99dfda31	t	Murore	71b598e9-1fb4-48d4-867f-729b3b971a3c
42eab2e2-aaa5-458f-a441-5d1c0f8ab407	t	Rusambya	71b598e9-1fb4-48d4-867f-729b3b971a3c
3bddd3a9-c2ac-47dd-88d6-0feb30bb1d15	t	Gatuna	3b73ed9e-560c-416a-9abb-d14950076d53
5e87c35c-ef34-4f3e-8380-a9895ffe9ec3	t	Kagera	3b73ed9e-560c-416a-9abb-d14950076d53
ca232d8a-241e-4b0c-8a43-a04e3cae4e9d	t	Rukizi	3b73ed9e-560c-416a-9abb-d14950076d53
0fb9f1e5-3a16-49d7-b63b-186c43044bdb	t	Kababito	f9e7c625-95c5-42c9-a447-fb489e2567f4
19deedd7-e6de-427b-8def-1a2b12b49379	t	Kabacuzi	f9e7c625-95c5-42c9-a447-fb489e2567f4
c29021c5-67c0-4109-9e9e-92b1506d9c40	t	Bisika	50ac0f9d-e9bc-4fb5-a1a5-5394a8e4a6d0
fa3f2f26-7aa2-4565-b2fe-6300b96bdc00	t	Butare	50ac0f9d-e9bc-4fb5-a1a5-5394a8e4a6d0
e61e349c-42ff-44fd-9c64-8efb2796f442	t	Cyamabano	50ac0f9d-e9bc-4fb5-a1a5-5394a8e4a6d0
b2a5b2b6-5579-404c-8f0b-359001d5800b	t	Gatare	50ac0f9d-e9bc-4fb5-a1a5-5394a8e4a6d0
f8cb4f12-2ad7-43b5-b484-579f5c5a0e73	t	Nyakabungo	603b1626-65de-407c-a015-ecea1c417ea9
8f3d5366-305f-44f5-8474-3c09e02da9e2	t	Ruzizi	603b1626-65de-407c-a015-ecea1c417ea9
3cdf3cfd-daab-4f61-82a7-463bd326f0fc	t	Tanda	603b1626-65de-407c-a015-ecea1c417ea9
47454c57-6015-4da2-91ad-1118526ebf9a	t	Gitaba	ac8f542b-9067-43a0-8261-6bdbf026e828
c82e114b-5d32-40b0-9ef2-4cc1fbe2fe3f	t	Muyange	ac8f542b-9067-43a0-8261-6bdbf026e828
13e0c42b-f0e9-4dbb-afaf-30a70f0a4d11	t	Kigoma	a1d89943-41e5-45fd-bbd2-4d796f319670
4882c6e9-7422-448b-9938-0a4ee3ae4743	t	Musetsa	a1d89943-41e5-45fd-bbd2-4d796f319670
9f54286a-534b-46b7-8d16-c7ec586b6527	t	Nyirangoga	a1d89943-41e5-45fd-bbd2-4d796f319670
f16ad09d-e7c7-4573-8f37-68044b7eff7c	t	Gicumbi	fbbbe843-fcc8-4e9e-828f-59285936d01a
bd37b6e8-7766-4745-a63d-6576d59a99a5	t	Maya	fbbbe843-fcc8-4e9e-828f-59285936d01a
e0abca65-3dd4-40c4-91c5-6bf396702022	t	Mwange	c50771c7-ed04-465e-82e9-a79aaf86b5c5
f1af839f-5d94-4e51-b11c-60617ec2e1b7	t	Kabungo	a04c41dc-338e-4068-a5ec-b079a11dfa40
8f8ea68d-f3b5-4681-b77b-07b9689ffd7e	t	Nyaruhanga	a04c41dc-338e-4068-a5ec-b079a11dfa40
a305b6cd-6941-49d6-a8bc-48686e1bbad6	t	Rugarama	a04c41dc-338e-4068-a5ec-b079a11dfa40
b5c5d941-03c8-48e2-90a9-a5e0f3bdb360	t	Ryakabanda	a04c41dc-338e-4068-a5ec-b079a11dfa40
ae9e1157-ec64-466b-bfa9-af176127a719	t	Gashiru	1ef60a03-d0d1-44a3-ad57-d401fb679bd7
d267d10f-253f-47ab-a560-b2b1fb512602	t	Kamabare	1ef60a03-d0d1-44a3-ad57-d401fb679bd7
7c854bf4-de5f-4531-a8f0-c04632c44141	t	Nyakara	1ef60a03-d0d1-44a3-ad57-d401fb679bd7
20adcc80-7d13-4d52-99ac-da3e65de97f1	t	Centre Mulind	d60292ef-c6af-4085-abe3-bdf89afc0604
255278e7-bea7-47ea-98b4-9305e4c90428	t	Nyakabungo	d60292ef-c6af-4085-abe3-bdf89afc0604
a364e173-c354-4b56-9953-22e6898227da	t	Rugenda	d60292ef-c6af-4085-abe3-bdf89afc0604
1e7d355e-a4b5-4be4-8228-2f6c4043957f	t	Ruhita	d60292ef-c6af-4085-abe3-bdf89afc0604
7f1ceeb0-f2f7-4d80-a7f3-5305d788fbec	t	Rukizi	d60292ef-c6af-4085-abe3-bdf89afc0604
6d5cb94e-1bc3-4a76-8bca-2fee7f82779c	t	Runyinya	d60292ef-c6af-4085-abe3-bdf89afc0604
02e0b594-2c5c-406b-84c1-6e06db10d121	t	Taba	d60292ef-c6af-4085-abe3-bdf89afc0604
8df1ecc0-5a3e-462d-b454-00317b06b5a9	t	Cyasaku	42a86b33-6e3b-41fd-9dbb-33aef9ef50be
77c48085-ceb6-410d-a507-f8b706050f92	t	Kabeza	42a86b33-6e3b-41fd-9dbb-33aef9ef50be
f3bbd56d-8273-4c26-a1cd-e033467959d3	t	Kinnyogo	42a86b33-6e3b-41fd-9dbb-33aef9ef50be
5598e430-671c-43d0-83fc-1847df02c826	t	Mushunga	42a86b33-6e3b-41fd-9dbb-33aef9ef50be
fd6b7c22-1d85-4bd0-ae2e-e2702b159377	t	Kamushure	4896aea9-8c44-43d0-bc0c-cd7fed5ec8ab
03f55486-9a68-4f9f-a57d-687e2fb14523	t	Karambo	4896aea9-8c44-43d0-bc0c-cd7fed5ec8ab
bd451e9d-4bad-455f-8ef4-2e193c451da2	t	Ngabira	4896aea9-8c44-43d0-bc0c-cd7fed5ec8ab
03ceb1e5-9a9c-4ae4-8b36-17b7bb6a859b	t	Nyagatare	4896aea9-8c44-43d0-bc0c-cd7fed5ec8ab
d2667dcf-eb76-4fc2-951d-694ab6ce78d1	t	Gabiro	ec558a31-e46d-43d9-9335-2bb13772e8eb
20589090-f595-4e5b-b34b-cb07b3029de3	t	Mugera	ec558a31-e46d-43d9-9335-2bb13772e8eb
8148cabb-486b-4d1e-99a1-7b6700f63272	t	Mutara	ec558a31-e46d-43d9-9335-2bb13772e8eb
846c3305-3ae7-4222-bcfb-8d748b271297	t	Gacyamo	640c1aee-477d-4931-91ba-8fd5e8da9751
f9b73a8a-3063-49d2-9387-3f37e9ddf44b	t	Kiyovu	640c1aee-477d-4931-91ba-8fd5e8da9751
175e3731-2b55-45c3-828a-98c175a9ec4c	t	Murambo	640c1aee-477d-4931-91ba-8fd5e8da9751
2bf533b6-bd4a-424c-a4e5-46ad6e541c6f	t	Rurambi	640c1aee-477d-4931-91ba-8fd5e8da9751
0ac2d6f4-fda9-4489-af59-e368164fbaf6	t	Bugibwa	9b06da6b-c281-40a6-a9ba-d93ca1b4af80
bab3855d-a8db-47ed-841a-280f1aa3b1cc	t	Kajevuba	9b06da6b-c281-40a6-a9ba-d93ca1b4af80
50519422-4200-4e99-bc08-8082670bc998	t	Rurembo	9b06da6b-c281-40a6-a9ba-d93ca1b4af80
b5135be7-bd4f-4540-8e43-6a6bd06e83ed	t	Sangano	a2cce29f-ffeb-48eb-b79d-5dc3249fc221
61766cfe-45f0-4855-8dbc-9869d856b160	t	Kiyovu	799ad225-0139-464f-8064-289438b15453
b1a42b55-d103-4d56-9aac-8d0e70495eaa	t	Rebero	799ad225-0139-464f-8064-289438b15453
d28dc6a6-5721-4253-8d2a-64dd4fd8316b	t	Gatsyata	d7f47722-bccd-4e4f-87e8-68803d8121be
61ffb056-18cf-44cf-91f3-b2fedcaf9b6b	t	Muturirwa	d7f47722-bccd-4e4f-87e8-68803d8121be
a440c2cb-fdca-41d0-9aef-326252913c77	t	Rugasa	d7f47722-bccd-4e4f-87e8-68803d8121be
b6e11d44-f141-4eaf-a902-ce341c78e6a7	t	Karwanira	0addbe12-e1cd-478f-8470-e83260f8d951
fef33b91-08ae-4018-811b-c07eb05dbd5a	t	Nyarurambi	0addbe12-e1cd-478f-8470-e83260f8d951
e087794a-bfc4-464c-bf82-24373596f143	t	Murehe	f300840e-2a5a-45e1-9694-8c483fc434e2
03fbca16-910b-4c6d-813a-24cc6c41938e	t	Kagote	530c99b4-c3d3-4857-b48c-3d0a61fa6b03
6bafe5aa-8db1-42e6-b51b-e4a4a0df6215	t	Kivumu	530c99b4-c3d3-4857-b48c-3d0a61fa6b03
542c698e-f37e-40d7-907a-b91c50d98435	t	Ndarama	f898d6e3-e4b1-4899-830f-410e7bc03a96
ab8fb705-101c-44ef-b5d2-f2f9e8b16735	t	Nyakabungo	f898d6e3-e4b1-4899-830f-410e7bc03a96
77730c1c-742f-40cd-93e8-0204aaf9d608	t	Rugarama	f898d6e3-e4b1-4899-830f-410e7bc03a96
17845fa4-5bfa-409b-a38d-3d4cef22a2cd	t	Mugina	5248f885-fb8e-4116-9749-4995437e8c42
fb665762-24a1-4a9f-972f-e27e97593c97	t	Nyange	5248f885-fb8e-4116-9749-4995437e8c42
ba2ae3f3-452b-4269-8b66-f8e7e4cf3424	t	Gacwamba	f6bcc53b-8284-42fc-aca1-a542badfb6d5
608524d9-96f3-477a-92b6-7c02833d0faa	t	Kariba	f6bcc53b-8284-42fc-aca1-a542badfb6d5
73bd0590-6c53-4a60-b9f3-da0812c25ce8	t	Kaziba	4ad626e2-fb88-41ac-adbe-94e40a9ddc19
60854baa-9f21-4b28-bde4-d0f65328fa30	t	Mafumirwa	4ad626e2-fb88-41ac-adbe-94e40a9ddc19
761fb7cd-78d6-4062-bd9d-319ea735f4dc	t	Murara	4ad626e2-fb88-41ac-adbe-94e40a9ddc19
05f2ced2-9857-4dd2-b0d6-b939a259cd12	t	Rugeshi	4ad626e2-fb88-41ac-adbe-94e40a9ddc19
ee4388d9-abdc-4f3f-a084-c65c8ee3cad0	t	Gakizi	c5cd0711-2771-4606-8cd1-23f180a8a5b4
0fe14b71-ded7-4ad3-99f0-af0febb7c0ca	t	Kagarama	c5cd0711-2771-4606-8cd1-23f180a8a5b4
666b4dde-691f-4817-b53c-d19bfdfd25b7	t	Rurembo	c5cd0711-2771-4606-8cd1-23f180a8a5b4
9684533c-1976-42a9-a640-73dc142d7368	t	Ruziku	c5cd0711-2771-4606-8cd1-23f180a8a5b4
29b3ba41-bebc-41dc-a100-9fb08bc4768b	t	Rusambya	7fb30fa4-ceaf-41e5-8b91-ba73868f0efa
424c089d-b5fb-48dc-bbb5-d1de1fc84c6d	t	Ntonyanga	0cc0ddef-11c9-4f96-b2f1-b56133c8235c
b701fa39-3bdf-4c77-960d-62578d47f16d	t	Rukazire	0cc0ddef-11c9-4f96-b2f1-b56133c8235c
147c474d-1700-46fa-afba-c9b5c348f38e	t	Rwamitembe	0cc0ddef-11c9-4f96-b2f1-b56133c8235c
e9fd72f4-df1a-4054-9004-efd67cf3ca42	t	Gatobotobo	da71f93f-17d7-41fe-82ff-a953ca8d8986
84df1308-588a-4eed-8771-9b55a89cc7e9	t	Karumuli	da71f93f-17d7-41fe-82ff-a953ca8d8986
6bd09c00-69ae-412c-86ea-e9163a55844b	t	Ryarwoga	da71f93f-17d7-41fe-82ff-a953ca8d8986
45726ab4-d3b1-4a11-901d-ef1acb8430a2	t	Gikumba	73ddbdaf-e74b-4639-8644-432839adc5f4
efc23ee1-6942-495e-82b4-82fd2b0a19fc	t	Kirengo	73ddbdaf-e74b-4639-8644-432839adc5f4
cce2d670-c0e0-44a0-ae93-01cd0d3b0658	t	Kabare	9d15d833-412b-4462-8e48-6321cad348f0
0362e05a-fb55-4924-8018-7c6d47bd2121	t	Karundi	a86db648-5bcb-4b3f-868e-2d7a77287f98
31327e95-c279-44a1-a799-66367e23d47a	t	Kirara	a86db648-5bcb-4b3f-868e-2d7a77287f98
277f9574-46ec-4006-b9f6-a5ce64c54af4	t	Gasharu	9a01f5e1-e2e4-46e3-9ce8-116a0fae98f0
7593df76-6f08-4ba1-94ef-3e0c58cfb8ff	t	Irasaniro	9a01f5e1-e2e4-46e3-9ce8-116a0fae98f0
e4ac76c6-c615-451a-b2cb-cb5652bf6dcd	t	Ngando	9a01f5e1-e2e4-46e3-9ce8-116a0fae98f0
3e2d8422-20d8-4022-83d3-b2534b249300	t	Nyamiryango	9a01f5e1-e2e4-46e3-9ce8-116a0fae98f0
146b094b-019a-4da7-8c29-391dd8f2f122	t	Nyagasozi	78bf479d-0e53-42a6-ae3b-9c27366dee92
776812ab-3693-4ddd-b51b-d1edcd1a4cec	t	Karambi	ef4f72c0-1a6d-4077-b9d1-68f5d9e87462
1a3d9662-1ddd-460a-86de-edb01095c991	t	Kimisugi	ef4f72c0-1a6d-4077-b9d1-68f5d9e87462
6f39b51e-dd15-4053-8cbc-07270b1dc8c6	t	Muhororo	ef4f72c0-1a6d-4077-b9d1-68f5d9e87462
274d230b-144f-4494-8505-ed9434103619	t	Rukondo	ef4f72c0-1a6d-4077-b9d1-68f5d9e87462
81ed9443-0064-4472-960c-1c4f43cd420b	t	Rurama	ef4f72c0-1a6d-4077-b9d1-68f5d9e87462
407fe9a7-7100-42ad-b728-d57f2a5587a5	t	Gihangara	2b7f7d01-eaee-42cf-9c85-6451f520d50a
e2b06f23-3b62-4f09-b0a0-4e9e314660de	t	Karambi	2b7f7d01-eaee-42cf-9c85-6451f520d50a
d8436c7a-96ec-4225-af98-72fb0bad4463	t	Nyarubande	2b7f7d01-eaee-42cf-9c85-6451f520d50a
067cba75-5d85-4a61-adc5-3a49ddb4a447	t	Kavumu	971a1cf0-f6b5-4a4b-a964-7467ceffeb93
17fe93a5-7b72-40f4-bb65-efe161597361	t	Ruhondo	971a1cf0-f6b5-4a4b-a964-7467ceffeb93
c1e6d069-7178-4c8d-b442-8f2ca88d4d76	t	Rusumo	971a1cf0-f6b5-4a4b-a964-7467ceffeb93
d9a8bde1-ba61-41fc-ac9c-459920ac6e51	t	Majyambere	f380acf5-182b-44fe-bd85-1f59d5f1dd50
11328a71-5203-4dcf-8d55-5204c5c00ab5	t	Rugarama	b3aa1cd4-5a0c-4f2a-9d5d-ce9edb4c5696
49885fed-d921-4d65-b7d0-90085f962d99	t	Karambo	15051842-5371-4bf8-8cb8-0cf03b7cc7e5
9e2babc8-8f00-456e-9799-d2f2fec9b11b	t	Mugorore	15051842-5371-4bf8-8cb8-0cf03b7cc7e5
1c1c2446-d86e-4ebb-a1c0-abdc26ef94ac	t	Nyarubuye	9b2c3e1e-7d2b-4d52-81a1-c9525b1844bb
d3c0c5a0-1571-448b-be44-8d71342d9ca4	t	Gasave	70e3df8e-ac32-42e8-870b-4694541ce184
c805b35d-6e87-4e33-8a83-db129bc18e5a	t	Karambi	70e3df8e-ac32-42e8-870b-4694541ce184
e01afd1f-8f11-4eae-96d1-833d26b947e5	t	Nyirakagamba	70e3df8e-ac32-42e8-870b-4694541ce184
1f0dd9ca-b7de-42e2-828b-b0f16370c3d8	t	Rugarama	da8d9c86-a89a-4502-bb9b-182a4be9f203
e0db8b89-daba-47d3-b397-035bd6519a3b	t	Kabere	4326ee9d-67b6-4d50-8938-26c9adea57a6
1689c656-f389-4d26-9407-d7188a0d1a8d	t	Ruhoho	de28f7a3-50ba-4164-95d2-153890e4c0a0
0018c611-664d-4169-b970-81389b9efdab	t	Kabahura	25a26511-7d22-4b23-a564-70b6e5b166d3
e3d0b128-9ef6-4766-9bec-83e64f632627	t	Nturo	afe9aca9-f509-47b9-8346-8a539c1ba17d
d2722643-9cea-4aa2-91a4-5f831f1ff1fc	t	Gomba	f0bd283b-1257-4e2c-8384-a0c866750655
c5ef742c-5cbb-46a0-a957-913b3efa66a6	t	Kagugo	ada26712-c97f-4e5b-a621-02c3c9bbae96
c2e1041e-b64a-44d0-bdcf-33db99de02d4	t	Mugote	ada26712-c97f-4e5b-a621-02c3c9bbae96
b3cc12e2-c651-4e93-a5ba-88ca2a48102e	t	Nyakesha	ada26712-c97f-4e5b-a621-02c3c9bbae96
445dbdb1-5588-436f-812f-8e41d0de6eaf	t	Centre Rubay	42f312e4-7fd9-4ad8-b57b-e9fd9e779dd2
cfe432a7-ae61-4c93-b155-291f3e7f6d05	t	Ngange	42f312e4-7fd9-4ad8-b57b-e9fd9e779dd2
092be46b-f5fb-45ae-9e55-576124cf8d8a	t	Kabuga	82dd9a42-4957-406f-bb42-7839538a4a15
c125e01e-3dc0-411a-9ae1-ed2228594741	t	Kimiko	82dd9a42-4957-406f-bb42-7839538a4a15
2c59f100-a489-41b2-bcd0-717cdfff858d	t	Muhama	82dd9a42-4957-406f-bb42-7839538a4a15
a12f68c5-facf-4856-8413-70c9f55a40c0	t	Nyamutezi	82dd9a42-4957-406f-bb42-7839538a4a15
847c5607-b902-45bf-ab43-c2b1e3371db6	t	Sabiro	82dd9a42-4957-406f-bb42-7839538a4a15
679476ac-9f98-42c5-bdc0-133368973af0	t	Gatare	895528b9-797b-4aea-85f4-816722b855a4
db539085-946f-4e60-8c67-29caa0c8f5ff	t	Gitaba	895528b9-797b-4aea-85f4-816722b855a4
7384a016-2fec-4d30-9021-bedd6aa61263	t	Nyarubuye	895528b9-797b-4aea-85f4-816722b855a4
873e32dc-990e-4918-90e2-3ea84d3535f8	t	Rusumo	895528b9-797b-4aea-85f4-816722b855a4
867ae4c0-5f22-4038-85c1-d72318d0b896	t	Gahondo	7634bbb5-df63-417b-83d5-a9c08da8fc89
1eabe9da-f5f0-431d-8853-cfb8978f42b9	t	Kivugiza	7634bbb5-df63-417b-83d5-a9c08da8fc89
35868df4-0afa-4d99-8881-058407b8b3f1	t	Mburamazi	4f3d287b-71eb-44b8-ad5a-802deff7fc61
ff4d1728-54ce-4d1f-be13-6d9d7e6fa806	t	Kabuga	4c839030-80c9-459c-9e66-48e99d4739cf
900f6c17-8c3f-4e77-941a-941a375033b8	t	Mataba	4c839030-80c9-459c-9e66-48e99d4739cf
fe3745e0-227d-4f49-ba5f-fb3cde949d56	t	Rwamushumb	4c839030-80c9-459c-9e66-48e99d4739cf
03c9fa08-38b7-48a2-84d1-0cca11cd5a7d	t	Gitega	59c72877-d5cd-4d33-b347-aff8bf5864a9
3a5c9f25-3232-4fde-a0b4-799b8ffb03b5	t	Kabo	59c72877-d5cd-4d33-b347-aff8bf5864a9
8bcf90e0-f5ac-4ace-8073-ef501dd47d09	t	Karambo	59c72877-d5cd-4d33-b347-aff8bf5864a9
8279dd50-6dbc-4196-b1e4-2177e7988ae1	t	Kabuga	f2b84600-c8ee-4eda-aa1b-f886efdb083b
c3ec484a-aa83-4524-bf0d-516161602b3d	t	Kamutora	f2b84600-c8ee-4eda-aa1b-f886efdb083b
63ad8ae6-0d6a-49ed-b511-78978b0c34a7	t	Mabare	f2b84600-c8ee-4eda-aa1b-f886efdb083b
0cefce3a-8ad2-4245-9239-aa05195aa225	t	Nkamba	f2b84600-c8ee-4eda-aa1b-f886efdb083b
e222ca3d-1505-4374-8742-3160152b3002	t	Remera	f2b84600-c8ee-4eda-aa1b-f886efdb083b
d77d9530-a770-4604-a512-75a84285a641	t	C. Rushaki	04cd94c4-45c2-4292-bddd-7158e7ad09ec
a18ac025-0f54-4981-9ea9-58576f41fa76	t	Gatonde	04cd94c4-45c2-4292-bddd-7158e7ad09ec
95b66291-2603-44db-96e1-a30437c8fa34	t	Izinga	04cd94c4-45c2-4292-bddd-7158e7ad09ec
8000323f-6f65-48c1-a9e5-3f1053740aaa	t	Mbuga	04cd94c4-45c2-4292-bddd-7158e7ad09ec
0efbb7a2-cbd7-41f1-aaf2-d9a0e1d85e0a	t	Nyaruhanga	04cd94c4-45c2-4292-bddd-7158e7ad09ec
e8198cd5-14bb-4075-ad98-ed6eaed947d0	t	Kintaganirwa	2d94f8db-cb65-49a5-87dc-95346e049350
f745a768-6449-4db5-8066-749b11d9371b	t	Marembo	2d94f8db-cb65-49a5-87dc-95346e049350
7291a7c8-531f-4d2a-b5ef-148af06cdd6d	t	Matyazo	2d94f8db-cb65-49a5-87dc-95346e049350
4970edf0-795e-4888-a787-00ed62e11b95	t	Buyegero	e6464479-fcb5-4c0e-9324-71ee2324004c
3951f51c-4208-4172-bba9-cf6c3e519e6c	t	Bureranyana	d59fb805-0456-4a72-9ba0-70dd60ab025a
024152e0-c01c-4417-a984-a02f2d8c6dba	t	Gashinya	d59fb805-0456-4a72-9ba0-70dd60ab025a
fff4e9bb-8779-4303-bf5f-742a94f904a3	t	Kabira	d59fb805-0456-4a72-9ba0-70dd60ab025a
7370ae65-1e53-4ce2-8890-cc11bdef7873	t	Kanaba	d59fb805-0456-4a72-9ba0-70dd60ab025a
74e84e5c-d8f2-4e8c-bb40-bb297616b6e2	t	Rugarama	4bfbede0-c43c-4f2d-b64c-a87de053792f
407384e7-06ff-459f-8724-b62f8f549e1b	t	Gasharu	a3c05a4b-6368-44ae-b1cc-7076aea7ac95
8cf7c6a7-accc-48ed-80cc-649b2f3fec22	t	Kirwa	a3c05a4b-6368-44ae-b1cc-7076aea7ac95
9deff27a-b59a-42c6-82a0-a9c5bd021276	t	Nyagatoma	851a8079-dabe-4273-b994-78c49d2d0310
75bee042-804f-48db-bb4a-6a3919f1ba9c	t	Nyansenge	851a8079-dabe-4273-b994-78c49d2d0310
a2c863c4-464b-4a3c-9413-f57693c0da34	t	Karambo	cd742878-7261-40bd-ba6e-45f268c78ece
2dffe91f-c864-448d-8685-3f732dd1105a	t	Rugarama	cd742878-7261-40bd-ba6e-45f268c78ece
c400115f-d123-4cbd-a493-c23ee4292c89	t	Mataba	4dc67c56-f50c-47e4-8bc7-4ad3957eec4e
7a1fa65f-68fb-493e-8c97-1c77a351ba8b	t	Nyamirama	4dc67c56-f50c-47e4-8bc7-4ad3957eec4e
6eba66ee-0d66-470c-adfc-ef5b87c82166	t	Nyarubuye	298fb136-527d-493a-9cc2-3290bd15ce5c
8464c792-c0af-40e8-aef9-96f8e25820f3	t	Remera	298fb136-527d-493a-9cc2-3290bd15ce5c
e03f8b5f-eaac-40b2-8180-78fc2e5f52e1	t	Rugerero	298fb136-527d-493a-9cc2-3290bd15ce5c
213e83fa-8d77-4dbd-9d1d-42c947a410c1	t	Murehe	40075e19-2cf8-42ea-b64b-fee806a6e38f
57d9c2cc-2e93-42d8-9dd5-9587080cd899	t	Nyarusange	40075e19-2cf8-42ea-b64b-fee806a6e38f
aa34e9fd-bd06-4702-9479-de660b90bb22	t	Taba	40075e19-2cf8-42ea-b64b-fee806a6e38f
5b7f1c11-d1ec-428c-bf71-d40320e393c1	t	Rwamiko	cee59cce-2f99-4a5b-a924-5091497ecd93
0dd0ae7a-6a27-47d3-94e6-33988878ff2f	t	Gatoki	cccaa251-c61f-40af-8ad4-4cdfddbb484c
722869ab-d631-4799-86eb-3a9bbc189be0	t	Mugorore	cccaa251-c61f-40af-8ad4-4cdfddbb484c
67766fc0-d38f-4bda-9bd8-5bf3f692e3af	t	Nyakaju	cccaa251-c61f-40af-8ad4-4cdfddbb484c
e6213fe5-826e-4a37-8f7f-5b893137ed69	t	Kamurenzi	a672a9cb-9221-4ef3-94ab-5134382b13f2
b9b2bb62-8356-476b-bae7-4ed7322b8055	t	Kabira	9068b732-2e13-4494-883c-c99c44f066c2
136da60c-8906-4127-92f5-e88d8cb5688f	t	Karangara	9068b732-2e13-4494-883c-c99c44f066c2
10544aac-81a5-4213-bf47-ffdb3812a580	t	Mutambiko	9068b732-2e13-4494-883c-c99c44f066c2
f7c1bfd6-a093-4fdf-971e-de46f04f6695	t	Kabusunzu	4a6fe973-3246-4f06-83cb-f35f1f60f4d2
65e152bc-4de7-47f5-a61f-9f5893de57e1	t	Kigaga	4a6fe973-3246-4f06-83cb-f35f1f60f4d2
606ee9b4-0008-4364-b267-154d0174968c	t	Ntaremba	4a6fe973-3246-4f06-83cb-f35f1f60f4d2
6142b3a9-cc26-416a-a5cf-00cb923912fc	t	Bushara	fc0d1954-f9e3-4bcc-a493-a6e0476200ae
9a89355b-57df-4ad7-a83a-66617f83bf56	t	Gasura	fc0d1954-f9e3-4bcc-a493-a6e0476200ae
865a80f6-0b07-4520-98c1-800fefb21506	t	Ituze	66c7cc13-27ae-45c5-a5ff-919d7e6aff0c
315f1f7c-b1a9-4f30-8465-7e9c2a74d86f	t	Gahanga	3fc878d6-bd8d-4c61-ba69-e7e35336afb5
4a0db1f7-3397-4912-8be9-f36d3d23ccd0	t	Jabiro	3fc878d6-bd8d-4c61-ba69-e7e35336afb5
7da1a8df-380a-4455-9cc0-eeb2cf41869f	t	Kabaya	3fc878d6-bd8d-4c61-ba69-e7e35336afb5
0de34697-1b0f-4677-bcf8-797aab7df22a	t	Nengo	3fc878d6-bd8d-4c61-ba69-e7e35336afb5
a896aa3c-39bd-492d-b3b6-5653a4432eea	t	Nyarubuye	9d456ac8-aea9-4df1-8bbb-9f2cc761e7e9
df08c2ac-59a7-4472-a6c2-29075cae4dce	t	Nyiragaju	9d456ac8-aea9-4df1-8bbb-9f2cc761e7e9
76270bc6-44dd-4aeb-b00f-8323b5860805	t	Rubaya	9d456ac8-aea9-4df1-8bbb-9f2cc761e7e9
f0717c0c-bd4c-4c14-8e02-c64caad17a49	t	Ryamukutsi	9d456ac8-aea9-4df1-8bbb-9f2cc761e7e9
1908748c-5db9-4fac-afff-b02041e42819	t	Bubandu	b4b07d6f-f00a-4bd3-90c5-bafd240b4e64
28448cfc-ac92-434a-b206-9692f6a38200	t	Murambi	b4b07d6f-f00a-4bd3-90c5-bafd240b4e64
f8e9380f-0001-49d9-9cd9-54904f6aa927	t	Mwidagaduro	b4b07d6f-f00a-4bd3-90c5-bafd240b4e64
aa29d657-3980-4494-9c5b-aaae2e6ab02c	t	Mwirongi	b4b07d6f-f00a-4bd3-90c5-bafd240b4e64
b29c61b9-8233-4b4b-8107-b59e8a3f7478	t	Rugeshi	b4b07d6f-f00a-4bd3-90c5-bafd240b4e64
6478585d-b8d8-4ba2-828a-237929999066	t	Bazizana	951c57b1-57fa-47e2-9537-02a9b5ed823c
48c61d92-190a-4815-ad24-44c650438d0e	t	Kabahama	951c57b1-57fa-47e2-9537-02a9b5ed823c
69271109-68f3-4287-9a6d-8c88cf09a30c	t	Kamenantare	951c57b1-57fa-47e2-9537-02a9b5ed823c
6a0540d0-1bae-477b-8ea5-dba993261b7c	t	Ruhindinka	951c57b1-57fa-47e2-9537-02a9b5ed823c
8b3793f0-c8aa-4549-9bf9-837c0306cc14	t	Rutemba	951c57b1-57fa-47e2-9537-02a9b5ed823c
688a8816-1b06-44d5-915d-44eae22cc985	t	Ruvumu	951c57b1-57fa-47e2-9537-02a9b5ed823c
a0f3c40b-db2d-4899-892d-f5b9cf8d91d7	t	Kabaya	e31218b9-1976-44af-bc02-030ad4a4db66
52916337-4b61-420e-bd76-402befee0305	t	Karugabanya	e31218b9-1976-44af-bc02-030ad4a4db66
845e436b-04a4-44b3-8fbb-f82247f97b6c	t	Kayange	e31218b9-1976-44af-bc02-030ad4a4db66
5f6fbd9b-4b4f-4f15-824c-daca86538c2e	t	Kibande	e31218b9-1976-44af-bc02-030ad4a4db66
8c520177-a983-4f48-8756-12a5befec79d	t	Mubari	e31218b9-1976-44af-bc02-030ad4a4db66
9194865a-fd9b-4601-b522-83aba5b2bdec	t	Mubuga	e31218b9-1976-44af-bc02-030ad4a4db66
f0e96c9d-59f1-45e5-b39b-17539e5a3b45	t	Mugarama	e31218b9-1976-44af-bc02-030ad4a4db66
584d7d74-243d-4964-84c6-c0423f11c129	t	Rebero	e31218b9-1976-44af-bc02-030ad4a4db66
6dc735ac-a0be-4578-9ef2-d963df6ebb8e	t	Ruhehe	e31218b9-1976-44af-bc02-030ad4a4db66
31185b4f-08d6-40fc-b0ad-0863dc2a810a	t	Bucuzi	0acad510-8983-4a50-b99e-54b6f0131187
6f40cdcb-63e6-4c80-92f8-14a7af8a04cc	t	Gashangiro	0acad510-8983-4a50-b99e-54b6f0131187
af2b8a9d-1a52-4abc-99c4-f4230b2655c8	t	Karinzi	0acad510-8983-4a50-b99e-54b6f0131187
75c49335-5ef2-4044-b5a2-b04a563499e5	t	Karunyura	0acad510-8983-4a50-b99e-54b6f0131187
8fac3946-ee26-4d7b-ae6a-86f552de4327	t	Kungo	0acad510-8983-4a50-b99e-54b6f0131187
854a2e32-347e-42bc-bb35-43951846d663	t	Buremu	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
91f5bba2-f234-4fcb-a9c7-7e4b834e4747	t	Gakenke	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
7a5d70aa-d2b2-4b91-82cb-485f8e53f842	t	Kabaya	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
918fe11b-ed70-48f6-91f4-8e09bcb697ff	t	Kamanga	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
e264fc1f-fc79-427d-a7e7-4a8246f5b89a	t	Kiviriza	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
44f59803-3771-4bb5-8454-582dee2d96ed	t	Mugari	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
51a04248-271e-4de3-ab54-55b0f085fde6	t	Nyaruyaga	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
4acd7289-cd18-4c6d-9b56-c6188bb39c03	t	Rabika	574b29f6-ae5e-40c4-b925-d35c6c2b0ff9
b35856b1-5d3c-4ff1-bf59-a106555ff98f	t	Marantima	66dc38c8-01e1-4063-a26d-8fb43707df27
1602c2be-1372-4e4f-a8d9-793715e5606b	t	Nganzo	66dc38c8-01e1-4063-a26d-8fb43707df27
e69fe7fb-4e93-4f8f-b17e-e56bc6a5b03e	t	Nyarubande	66dc38c8-01e1-4063-a26d-8fb43707df27
a325c124-103c-4c56-bace-417dfe51c211	t	Nyiraruhenge	66dc38c8-01e1-4063-a26d-8fb43707df27
2531fc05-0a63-4c6e-b31f-bdf2c5f3ad5a	t	Butunda	74f4cf3b-58ab-46cd-a94b-98b972cf8610
96dce1f2-ab7b-49a3-80e4-3d038cc1a359	t	Cyiri	74f4cf3b-58ab-46cd-a94b-98b972cf8610
a65f2128-aa86-45f7-8c76-d867ebfabb82	t	Gahama	74f4cf3b-58ab-46cd-a94b-98b972cf8610
119bac80-7118-4907-8719-281854ff1bdf	t	Murora	74f4cf3b-58ab-46cd-a94b-98b972cf8610
36800353-79c0-4d7f-968c-b0da34a80bb0	t	Murundo	74f4cf3b-58ab-46cd-a94b-98b972cf8610
cbbb0861-e6cb-48ee-a637-7b76bbd301c3	t	Nkomero	74f4cf3b-58ab-46cd-a94b-98b972cf8610
9fcaad28-cd28-407f-84c4-6b4e3890d756	t	Gasenyi	9c70327f-7d2e-4945-afaf-ee962846eb69
a46326e9-d9a9-46c2-81dc-54c8f7a019dd	t	Nyamugari	9c70327f-7d2e-4945-afaf-ee962846eb69
9da28d06-b8ee-45b6-9bfa-06cfa9283290	t	Ruhasa	9c70327f-7d2e-4945-afaf-ee962846eb69
e42fb784-95d0-42e5-a7b0-f93ac1e6630a	t	Rurambo	9c70327f-7d2e-4945-afaf-ee962846eb69
5cac50e6-faf7-44e7-bc7b-7e90a7312fd1	t	Gitovu	8328c107-2047-4c6e-8420-a24fda1d2306
7417c464-d51e-4844-abc2-78cd947f82ad	t	Kabushanda	8328c107-2047-4c6e-8420-a24fda1d2306
6dee743a-cebd-49d3-9faa-607a99518e9c	t	Kanama	8328c107-2047-4c6e-8420-a24fda1d2306
1d91883d-29c9-4538-b806-c441e40ac5d6	t	Karama	8328c107-2047-4c6e-8420-a24fda1d2306
509df49c-73a2-42b8-bd1c-5eaf529e8421	t	Mata	8328c107-2047-4c6e-8420-a24fda1d2306
6c786e15-06e2-4233-876a-b98b57e9a998	t	Mukungwa	8328c107-2047-4c6e-8420-a24fda1d2306
8760e399-2869-4ac3-8407-bd00f7460036	t	Rungu	8328c107-2047-4c6e-8420-a24fda1d2306
b242346c-86db-453a-8614-2a3ecb557b66	t	Burengo	82958763-daa4-40d1-8ccf-ce048013e0bc
c774e2c4-cca6-4e72-8c35-e591233281f5	t	Kabukende	82958763-daa4-40d1-8ccf-ce048013e0bc
81a9ee81-be4e-4c4e-bc92-bbeb1afeaa7e	t	Karambi	82958763-daa4-40d1-8ccf-ce048013e0bc
dd368c3f-ca95-4fde-a42e-5bd4ed1ad401	t	Kavumu	82958763-daa4-40d1-8ccf-ce048013e0bc
a58267da-931a-476c-ace2-340318e252c2	t	Sarazi	82958763-daa4-40d1-8ccf-ce048013e0bc
1e611781-3ebd-4fa6-9f78-3ffa1e654525	t	Kavumu	cca09444-52f9-4e7d-a4e3-7444b401a091
c1eca46d-4578-4121-a414-dffd9da2546b	t	Musekera	cca09444-52f9-4e7d-a4e3-7444b401a091
890ec24d-7a8a-4aa8-a56a-43f2a5ec7d83	t	Makara	ec04cd26-5ee8-473a-91f6-1acacc065f48
bc0253c1-fb56-4e51-97f0-5a518b456b5e	t	Budiho	2a74def3-6551-41e7-a0de-7e2505a7b291
d449b96b-18de-4717-bf16-813ced95d4ef	t	Gatete	2a74def3-6551-41e7-a0de-7e2505a7b291
84ab96a1-6ca8-4716-bee8-804f95ee40c4	t	Kamato	2a74def3-6551-41e7-a0de-7e2505a7b291
137eae30-3e28-47eb-8f27-c71cac798b14	t	Kanzo	2a74def3-6551-41e7-a0de-7e2505a7b291
302a3fcf-f9c4-445d-ae04-bdd4b0de3d36	t	Ngambi	2a74def3-6551-41e7-a0de-7e2505a7b291
9ddf08e4-57cc-432f-bfd5-3d75f5c357ba	t	Raro	2a74def3-6551-41e7-a0de-7e2505a7b291
51c2f14e-feb9-48dc-8010-43619fa6e5f4	t	Kibinyogote	f61ac71e-4b14-4607-a0c4-cd2df306d724
c5a70563-68e9-472f-bdaa-5b895a081782	t	Mucaca	f61ac71e-4b14-4607-a0c4-cd2df306d724
a1786038-4145-4f95-8a52-0b9fbd487673	t	Murandi	f61ac71e-4b14-4607-a0c4-cd2df306d724
3b433338-25c6-4578-8110-d9e5301e2ebd	t	Kagongo	1e59846c-80f6-4889-8bb9-149889752d8c
a38bb407-5c2c-4f71-be90-106b067f4dbe	t	Rubaka	1e59846c-80f6-4889-8bb9-149889752d8c
15e05447-a9e5-444d-aff0-b46dceb8cd3c	t	Karurambi	bf3c8cb3-f9aa-4f41-9cc4-15de06222d70
2c40424c-00b3-423c-ac34-5521d25b46d3	t	Manjari	bf3c8cb3-f9aa-4f41-9cc4-15de06222d70
c2eab86c-398c-47e4-9503-04a46496bd31	t	Rukingo	bf3c8cb3-f9aa-4f41-9cc4-15de06222d70
0e84c812-78ef-474e-b406-d511d80bc08c	t	Rusambu	bf3c8cb3-f9aa-4f41-9cc4-15de06222d70
5313217e-8b8a-486f-8e24-89fd97ba43ca	t	Rwinzovu	bf3c8cb3-f9aa-4f41-9cc4-15de06222d70
5bb3e4f7-3dfa-4de3-b93c-4b9b2603da1a	t	Gataraga	0f6b6d1b-0b65-4cf5-9197-ba84d03da59e
3cc438cc-b989-491b-b2bb-9ffe6685d7ee	t	Kabaya	0f6b6d1b-0b65-4cf5-9197-ba84d03da59e
a5ede440-4a98-4798-8bc5-ba6afa45b796	t	Kaberege	0f6b6d1b-0b65-4cf5-9197-ba84d03da59e
e8569a5e-f03a-4c6b-a46d-6f56b1d47f63	t	Gahira	cc7c0804-e05f-4ebf-afdf-f54a1cc16d65
64bf73f9-f5d3-4782-b79a-737da2d394f6	t	Gatondori	cc7c0804-e05f-4ebf-afdf-f54a1cc16d65
5cd0abfe-3957-4192-a5cf-1fae56948647	t	Gatovu	cc7c0804-e05f-4ebf-afdf-f54a1cc16d65
f4fced2b-cb01-4e5b-ba9a-c27379eb22b9	t	Kampande	cc7c0804-e05f-4ebf-afdf-f54a1cc16d65
f9af9a71-0651-4197-a64e-04aea8dd3342	t	Nyarubande	cc7c0804-e05f-4ebf-afdf-f54a1cc16d65
bd2a762d-3a70-4f85-b829-157c59cf0216	t	Kabagoyi	400991a1-86c0-4d8d-8ec0-33c25811e1b7
109a12c7-9121-4444-826f-89d9e3c6cd8e	t	Kamugeni	755eb9bd-3c63-4787-a07f-6764ecf67b61
a16e91d4-a387-4a9a-8a38-941f189456c4	t	Nyiramuyenzi	755eb9bd-3c63-4787-a07f-6764ecf67b61
51bf2674-0b85-4867-be4a-b41b9d11c980	t	Masoro	8177cdbf-bef0-4aee-839e-b2886da508cb
ebcef504-0728-4771-b537-c4a5f364cc1e	t	Muregeya	8177cdbf-bef0-4aee-839e-b2886da508cb
79cd8809-c95c-4a9e-9537-df4394cb4226	t	Ndorahe	8177cdbf-bef0-4aee-839e-b2886da508cb
3e61c4b4-1f56-490f-b15b-2c5d47384a6e	t	Kabeza	2f0a44d6-6ae6-44c3-940f-e2f48e58a561
4490e447-155e-4726-8495-c5d06074c62b	t	Kaniga	2f0a44d6-6ae6-44c3-940f-e2f48e58a561
456f6b1f-60e3-4564-a3cb-d92caccc2422	t	Impano	2f0a44d6-6ae6-44c3-940f-e2f48e58a561
aa81f1e3-e88d-44f1-ae84-0b4a3c057a6e	t	Rugeshi	2f0a44d6-6ae6-44c3-940f-e2f48e58a561
6cafc0e6-c845-4bcf-8a8e-565cedcb72a4	t	Ruginga	2f0a44d6-6ae6-44c3-940f-e2f48e58a561
bbc15ec4-89c4-4fb8-8bd8-02fec548b8f6	t	Rurembo	2f0a44d6-6ae6-44c3-940f-e2f48e58a561
06df230b-ccf2-4a1a-927b-7f46d8a5b07c	t	Kamakara	751e86b5-2982-4564-9385-476522783c5c
f3b09dbf-988c-4d9f-b8a0-0e6440bffe49	t	Muhe	751e86b5-2982-4564-9385-476522783c5c
37e8c56a-6257-4bee-bea6-5bbfa562397f	t	Nyarubande	751e86b5-2982-4564-9385-476522783c5c
8590c1cb-cbe4-4717-b8ed-c6d6879c76ef	t	Nyejoro	751e86b5-2982-4564-9385-476522783c5c
69d6e020-00cd-4665-bb80-76522c33ddf0	t	Rubara	751e86b5-2982-4564-9385-476522783c5c
226b05c6-651e-47f9-b9b2-71975dceb8e0	t	Rugi	751e86b5-2982-4564-9385-476522783c5c
19501a22-308c-4e61-8ca6-2ca42b303a7b	t	Rutindo	751e86b5-2982-4564-9385-476522783c5c
6f6858de-ad13-44a2-af8e-3b2a1267b67e	t	Mitobo	5a34d3eb-2faf-45c1-aa89-f27086230007
a3a74ced-2941-402d-902c-25d4f5ebc211	t	Nyakagezi	5a34d3eb-2faf-45c1-aa89-f27086230007
3a1fafce-0f4e-4190-9235-eb0560527a6e	t	Bazizana	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
8535dd35-6493-4be8-8f35-f1f6544f5006	t	Butorwa I	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
4a224f65-509a-4a00-9600-73bd7f6decf3	t	Butorwa Ii	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
362a8956-7a0f-4915-a69f-b030c4ebfb3c	t	Gahisi	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
608277a1-1e4d-49c1-b36b-bef260c996f6	t	Gasura	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
8db661cf-ce92-43c3-aa0f-94af85c65499	t	Kansoro	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
eb64922c-08b1-4481-a075-6e64ee56c73b	t	Kanyampereri	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
7302d75a-e1d7-4eb7-a4cb-0858575316b8	t	Nyagisenyi	1fc2628a-0dde-41ad-a50c-a5ca10c245e9
7f968e1b-5efd-418a-a745-586bb1182a01	t	Buhuye	e3d4a732-7d16-43f0-a863-cb89c5748dc0
bf651972-150a-45cc-8449-09e8fcf25eea	t	Gasanze	e3d4a732-7d16-43f0-a863-cb89c5748dc0
47f1ee8a-7c99-4e08-acfc-242609450cfd	t	Gatare	e3d4a732-7d16-43f0-a863-cb89c5748dc0
d7983965-e434-47dc-a5ba-6b44686a8e5e	t	Gatorwa	e3d4a732-7d16-43f0-a863-cb89c5748dc0
cc8b9b55-9fa4-4511-bf13-577202ee4fcd	t	Kabogobogo	e3d4a732-7d16-43f0-a863-cb89c5748dc0
9bb541ec-617b-48d7-a2c4-8d2e1a17afde	t	Yorodani	e3d4a732-7d16-43f0-a863-cb89c5748dc0
386307b7-7049-4b18-b276-73838755a371	t	Kavumu	8d3082d9-d89f-4714-a4e7-479da3ac3c9a
d476d076-8446-466c-be2e-36e647d7d35e	t	Kiryi	8d3082d9-d89f-4714-a4e7-479da3ac3c9a
6e41bbd9-617d-48c1-bf0a-aecdd11c644c	t	Nyamagumba	8d3082d9-d89f-4714-a4e7-479da3ac3c9a
b3bb8fd2-1506-4d7a-a547-223968010f4a	t	Nyamuremure	8d3082d9-d89f-4714-a4e7-479da3ac3c9a
edb154e5-73e5-46ce-b528-271266c97b06	t	Rukereza	8d3082d9-d89f-4714-a4e7-479da3ac3c9a
7a444f5e-112e-4232-bb6a-a2d7dd96c2cd	t	Gikwege	caf05d04-fa88-44f0-8a90-4cf4a333d150
a9c906a6-893a-4231-8407-95aab5963941	t	Giramahoro	caf05d04-fa88-44f0-8a90-4cf4a333d150
721e6b90-d981-4533-aded-40d83d30d467	t	Mpenge	caf05d04-fa88-44f0-8a90-4cf4a333d150
9ccf6646-9f91-48b4-9ff1-eafac6ddd720	t	Rukoro	caf05d04-fa88-44f0-8a90-4cf4a333d150
15e17e67-e920-4380-bc5f-da1719cbeac9	t	Rusagara	caf05d04-fa88-44f0-8a90-4cf4a333d150
938d12f3-3c7b-4eb2-9c20-4203de009984	t	Buhoro	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
0f797fcc-d0c2-43c8-a8ba-ffd2edea94e2	t	Burera	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
891d3fad-8542-430f-beb4-148587b85538	t	Bushozi	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
6aaf5bc7-00f2-42e1-a321-f219b6816392	t	Byimana	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
d19c6360-5a2b-49c3-b383-4d6fc5236f2f	t	Kabaya	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
071c9d56-7e11-40ff-b708-160ba7ad3c69	t	Muhe	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
74f7fff3-e8ff-41b6-b3b2-6218a5a3516d	t	Susa	e1b2bcc2-43ae-424d-a69e-b25e2ab7059b
8af3e478-5bce-485c-804a-3327b51151e5	t	Nyiramuko	8f0110b0-451f-444f-a903-eb8961b73b41
ffb1ec7f-2240-4420-85ab-91ae613da4f2	t	Kabere	801b3439-3d60-4ca4-aa0d-b105b5d0230b
81717ada-f333-4e9b-94d8-328c10b4a119	t	Kabindi	5a92fd87-ddf6-4903-9d6a-5d1477e21319
28da7e2f-3626-4cdd-9cf0-8c94e739ded9	t	Musenyi	5a92fd87-ddf6-4903-9d6a-5d1477e21319
b00252b7-8cc8-4899-93a4-8903a8625ac3	t	Mwanganzara	5a92fd87-ddf6-4903-9d6a-5d1477e21319
08a2f7b2-742a-4a48-89a5-c8d5dd3f7259	t	Ngabane	5a92fd87-ddf6-4903-9d6a-5d1477e21319
15004969-41bd-4914-9546-5d06042116d5	t	Ntindo	5a92fd87-ddf6-4903-9d6a-5d1477e21319
bf143bd4-e65c-48f4-ae33-23d97dcf4618	t	Bukane	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
ef97fcf8-5fff-4a7c-9095-a4dd0f67844c	t	Gaturo	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
ba0a805e-5c03-4d5a-a639-4711f075a225	t	Gikeri	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
5dad0108-69b6-4fa4-ba7d-cf2b5fe7820a	t	Kabaya	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
0cdae788-d5f1-4300-905f-098c10425758	t	Kageyo	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
e79d2c93-3da9-4f1a-a6ac-7f9a9cfc0c47	t	Kiroba	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
24096028-7fac-4847-92c6-50eafb75bf93	t	Rugeyo	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
4b9d65ac-38c3-4728-b622-d528503ac71f	t	Ruvumu	fdeb0368-efa7-4d44-9f45-2ba2c43a2fbb
429d929e-9922-443c-b45d-45b83987e799	t	Cyanturo	13580f29-a41b-40b6-b764-4b62db9e6a3f
2a9edef4-2bcc-4bf0-bb23-46750df9d534	t	Gacinyiro	13580f29-a41b-40b6-b764-4b62db9e6a3f
9633b758-aacf-4ac3-821d-46724c4ddfb9	t	Gapfuro	13580f29-a41b-40b6-b764-4b62db9e6a3f
868ebb21-ea4f-4feb-8b7c-5e526c0e5103	t	Kanganwa	13580f29-a41b-40b6-b764-4b62db9e6a3f
f4c10c07-a6aa-43ea-8d5c-5b04cc69b7d2	t	Bihinga	95fba288-0531-4f98-ab8b-ee86c475cb94
23decdfc-36e4-495b-a7b4-0e7abb43857b	t	Kidendezi	95fba288-0531-4f98-ab8b-ee86c475cb94
86c0f209-b8ef-4711-868d-a908e780eae3	t	Mufukuro	95fba288-0531-4f98-ab8b-ee86c475cb94
b6bf759b-f7a8-4987-9248-52963fe886d6	t	Nyabageni	95fba288-0531-4f98-ab8b-ee86c475cb94
10867029-f15e-4693-bd10-27b89e15d1ed	t	Rucumu	95fba288-0531-4f98-ab8b-ee86c475cb94
b3b5b292-25b4-4786-82fe-30b118dc1b00	t	Rwunga	95fba288-0531-4f98-ab8b-ee86c475cb94
57dcd6b7-4c16-42ac-9b41-b22f3828ce73	t	Bannyisuka	cb1ab8ad-a062-45bd-a52e-d2887414cd87
3042bd9d-7f92-478d-90f1-62084ea5d994	t	Kareba	cb1ab8ad-a062-45bd-a52e-d2887414cd87
d56d5be8-2532-4604-b839-91894175f8ae	t	Kavumbu	cb1ab8ad-a062-45bd-a52e-d2887414cd87
d4f3d1d3-1213-4c0a-9be1-e86ab7883a61	t	Murenzi	cb1ab8ad-a062-45bd-a52e-d2887414cd87
ce3a1e9f-7a56-461f-b85a-d6cd9c02ca49	t	Nturo	cb1ab8ad-a062-45bd-a52e-d2887414cd87
28b157a7-35dc-4e58-8bed-315f1ffd493e	t	Tero	cb1ab8ad-a062-45bd-a52e-d2887414cd87
e4774bf2-fd6d-4a3f-b39c-1c1c535ba043	t	Buhunge	b12e0176-b705-462b-aded-5f1186b23e22
3a3da44c-094a-4674-b00e-1e8e16e3d88c	t	Kirerema	b12e0176-b705-462b-aded-5f1186b23e22
f7cd61ae-c15a-412b-bc52-da858d31db01	t	Nyarubande	b12e0176-b705-462b-aded-5f1186b23e22
100dd226-6799-4e35-b985-44fef1460e37	t	Runyangwe	b12e0176-b705-462b-aded-5f1186b23e22
3b0d6f7a-3ea6-403b-a3d0-6f9516b17fe2	t	Rwunga	b12e0176-b705-462b-aded-5f1186b23e22
59f072ce-4c4c-4be1-a40c-5f4474367332	t	Barizo	e376ead6-7811-4b05-a813-664a135e0a0c
e0632238-58a5-4548-a2d0-626de7d5cb45	t	Karambi	e376ead6-7811-4b05-a813-664a135e0a0c
a917e5f0-665b-4ac1-842e-0d2083e8b15a	t	Kinkware	e376ead6-7811-4b05-a813-664a135e0a0c
facea094-7992-4984-b9cf-b6942ee4f7bc	t	Gasoroza	e6f579e8-06cc-4bfc-ade4-757904c71b45
446596b8-2635-4b78-847f-5a6a7e9429c5	t	Kagano	e6f579e8-06cc-4bfc-ade4-757904c71b45
4545416b-eeda-45bf-b90f-51a25d18f58b	t	Muhe	e6f579e8-06cc-4bfc-ade4-757904c71b45
d3186509-4be2-42bf-bc35-054dc88a8c33	t	Rugarama	e6f579e8-06cc-4bfc-ade4-757904c71b45
72457ba3-a254-48ba-83c8-f4e79f89e138	t	Terimbere	e6f579e8-06cc-4bfc-ade4-757904c71b45
8e31a760-4bcd-49b5-b004-7de1437ea0f9	t	Gahama	092769cf-cd85-4776-a4c6-192d4efa2659
7a8e81de-d847-4ef7-9383-cba4f1ad6c14	t	Kansoro	092769cf-cd85-4776-a4c6-192d4efa2659
dc825c1e-f898-443d-af8e-740e33e70d5c	t	Kibingo	092769cf-cd85-4776-a4c6-192d4efa2659
e3cca8ee-ffc2-438f-9f2f-1f195d11ad2f	t	Ntamiziro	092769cf-cd85-4776-a4c6-192d4efa2659
034afcd2-2c68-44e2-84d6-de5bc4c6847c	t	Nyarubuye	092769cf-cd85-4776-a4c6-192d4efa2659
83cbcdf9-95ec-4564-b4c0-51ee283156ff	t	Rwebeya	092769cf-cd85-4776-a4c6-192d4efa2659
96ee52d4-479d-4f18-b8c3-38d4728ad679	t	Kabaya	b5e732e3-0157-46b5-bc05-56e4bed52534
f361e514-f378-4502-a609-bf4611bfbb66	t	Kamajaga	b5e732e3-0157-46b5-bc05-56e4bed52534
8120d93c-72e2-4533-82f9-54389aa3eb3d	t	Kamicaca	b5e732e3-0157-46b5-bc05-56e4bed52534
6b3a0408-c413-4321-8bc2-161d4ded4f61	t	Musenyi	b5e732e3-0157-46b5-bc05-56e4bed52534
671aa5be-5770-44d3-9e75-16827f639ca7	t	Rugari	b5e732e3-0157-46b5-bc05-56e4bed52534
873d0975-142a-448d-8b77-878f7cf5d307	t	Bazizana	1a22ea5b-4467-4c5a-8cef-83504d1582d4
d8cc6539-300b-4969-92c5-b711ca9b32f2	t	Bihinga	1a22ea5b-4467-4c5a-8cef-83504d1582d4
857c1141-1e99-425c-8901-f032f268ae27	t	Bukingo	1a22ea5b-4467-4c5a-8cef-83504d1582d4
f272bdc3-aeb8-4ada-975d-500dbfb9ed43	t	Buramba	1a22ea5b-4467-4c5a-8cef-83504d1582d4
33614263-17d1-460d-9ed9-d1741068e4cd	t	Jite	1a22ea5b-4467-4c5a-8cef-83504d1582d4
e8972799-e34b-42f1-a1dc-7c86b43994e1	t	Micaca	1a22ea5b-4467-4c5a-8cef-83504d1582d4
44cda49c-3cde-4f5b-93dc-b85f76bc221f	t	Nkogote	1a22ea5b-4467-4c5a-8cef-83504d1582d4
ae45794f-2d8c-4c32-9988-0ff3c975e4f1	t	Ntarama	1a22ea5b-4467-4c5a-8cef-83504d1582d4
0e0b5c39-6604-4085-979b-f0d0724282a8	t	Ntebe	1a22ea5b-4467-4c5a-8cef-83504d1582d4
db0cef53-7abe-42d0-86c1-c0de3593e2a0	t	Rugwiro	1a22ea5b-4467-4c5a-8cef-83504d1582d4
cf2e1929-8503-4b81-9ad9-b3552fe596d1	t	Garuka	93db33c2-023f-4aa0-bb01-981f24f9f6e4
d19eac4d-b29a-43df-a3ec-3bb4524690b5	t	Gisigwa	93db33c2-023f-4aa0-bb01-981f24f9f6e4
8d74779f-cfdb-40df-aaac-7ef8f72a60f4	t	Kabagorozi	93db33c2-023f-4aa0-bb01-981f24f9f6e4
a99d4322-3219-44e2-877e-3ad53de2d5ec	t	Kareba	93db33c2-023f-4aa0-bb01-981f24f9f6e4
56de0b0d-3305-4469-8670-84154172d459	t	Nkiriza	93db33c2-023f-4aa0-bb01-981f24f9f6e4
c4cbb946-1905-4a71-8a50-7919509b472e	t	Bukara	0506eb21-e775-4f3f-96f8-e7ea8c4a5173
14bbfd17-0387-4552-9612-909b88d87029	t	Gitega	0506eb21-e775-4f3f-96f8-e7ea8c4a5173
fb30463c-820f-40a8-8e2b-902234cc0ee5	t	Nyakibande	0506eb21-e775-4f3f-96f8-e7ea8c4a5173
8b45cd40-5f6b-4200-9d64-796af40a416a	t	Rususa	0506eb21-e775-4f3f-96f8-e7ea8c4a5173
d860a284-3db8-42be-84c2-d0d52063a933	t	Kabara	bca0ca96-fad9-4571-aaae-89694742d01c
e4f5b927-cd15-4c74-9a16-9a70c502a222	t	Mikamo	bca0ca96-fad9-4571-aaae-89694742d01c
9db629ea-d3da-44e5-a6d1-3fc5de02060d	t	Buhogo	6ced6df2-f1aa-4693-9eaa-0d894d308480
1c872279-be5c-4cbd-a854-644f165881e7	t	Kabagora	6ced6df2-f1aa-4693-9eaa-0d894d308480
657645d4-4c0a-455b-9c6a-429794b74da0	t	Karuruma	6ced6df2-f1aa-4693-9eaa-0d894d308480
78087b7b-f202-45c3-8794-30b308d54972	t	Muganda	6ced6df2-f1aa-4693-9eaa-0d894d308480
4557486f-f351-4d22-9bc1-74432aba0509	t	Nyirabisekuro	6ced6df2-f1aa-4693-9eaa-0d894d308480
732cdb4a-a3a9-4fcf-be08-c2e5f74e4aa8	t	Gitwa	b75680ef-d79c-446a-9463-c278117d4214
48996794-92b6-4241-bc7d-43d4e1febdf6	t	Kabashima	b75680ef-d79c-446a-9463-c278117d4214
93863bda-5cac-4790-8429-b0f7edb7d34f	t	Kamanga	b75680ef-d79c-446a-9463-c278117d4214
689d1b34-ad90-4074-927f-6ebf782146c9	t	Mwiyandiro	b75680ef-d79c-446a-9463-c278117d4214
4ea71837-6ebf-4898-bf97-73666008bd98	t	Ngenzi	b75680ef-d79c-446a-9463-c278117d4214
09e6c8aa-c8ef-435c-bfea-222d22fafe6f	t	Bitsibo	bdbd38f4-83cb-4110-8719-ff4be06a533e
d726eb1f-8d63-4efd-9df8-b0edcb4435d9	t	Kabusozo	bdbd38f4-83cb-4110-8719-ff4be06a533e
781b5fa5-4c71-4df5-bbd1-d76e75b709c9	t	Muheta	e45413bc-34bd-4192-ab7b-1cc51ab40a39
e0332522-9f31-466a-9b56-986703b8b95b	t	Busana	682d57cd-d24b-4ad9-8d6f-77f4614e8bbd
1dfbfb6f-5896-4593-87d7-10544c1a2e33	t	Kabuga	682d57cd-d24b-4ad9-8d6f-77f4614e8bbd
61da7ad7-6363-4015-9f86-4f15494cc33d	t	Nyagisozi	682d57cd-d24b-4ad9-8d6f-77f4614e8bbd
69171277-6f03-4769-baa7-5c314dbfc081	t	Nyarugando	682d57cd-d24b-4ad9-8d6f-77f4614e8bbd
3fbc3257-870d-44cb-908c-2494fcd12253	t	Rwamigimbu	682d57cd-d24b-4ad9-8d6f-77f4614e8bbd
5ec306e5-8dfa-4476-89c6-6b0f670aa75c	t	Mutara	7afdd98f-39d7-4e66-a155-531175dcd1b6
d24ab0c0-41c1-4223-85c2-fa9e80826f8e	t	Nyakarambi I	7afdd98f-39d7-4e66-a155-531175dcd1b6
a47936da-6a77-4fe5-a264-78719d216920	t	Gakenke	f43896e1-6f99-487a-889a-5dd80ffb58be
b48dfab3-7124-46ea-b0a7-70f77e64bc89	t	Mugogo	f43896e1-6f99-487a-889a-5dd80ffb58be
84acfe5a-8d22-4ec5-9377-a89d792d2159	t	Rubabi	f43896e1-6f99-487a-889a-5dd80ffb58be
98af2bdf-a308-4071-b079-df69633d73d3	t	Rugari	f43896e1-6f99-487a-889a-5dd80ffb58be
0f6ead20-dfe6-4037-ba6b-96847cd645db	t	Ruvumu	f43896e1-6f99-487a-889a-5dd80ffb58be
30a14632-3904-454b-a8fe-3ff6f99b100e	t	Ngege	b7441b6a-2367-4f5b-8085-4e490c95ebac
d74948ef-b4eb-4d28-ae36-0ce16913bd7c	t	Bwamazi	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
d3714cbe-9365-43b0-9049-c6eeadebbd05	t	Gasura	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
a39e1a64-05a8-49a0-b027-00b9bede7cf7	t	Kabeza	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
d049c1da-06ef-47e1-be7c-ed2591d278e4	t	Kadahenda	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
43af00fb-448e-4c89-be79-48a49c419e07	t	Karwesero	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
85cbc418-7e79-4fd5-8ec5-b88af4678b0a	t	Mutuzo	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
8cd2cefc-bc4c-42bc-8aa0-7306bdfe6c04	t	Ryambungira	dc3b31e6-b0a3-42c7-a4cb-11352d55d912
a6e534ed-6edb-40f2-885b-9e961431402a	t	Byimana	9b4a4c27-0eae-40b2-8a8d-4ba08a6f0d93
b9dc8f30-9ae1-46a0-b1c1-463def063412	t	Cyimbazi	9b4a4c27-0eae-40b2-8a8d-4ba08a6f0d93
4a27df38-244d-4ad9-90d0-5e13ebc3c83e	t	Mutuzo	9b4a4c27-0eae-40b2-8a8d-4ba08a6f0d93
45777580-b02f-4dca-a520-4b3cf062801e	t	Nyundo	9b4a4c27-0eae-40b2-8a8d-4ba08a6f0d93
471e1c8b-b927-4fd3-85d3-7b959033f6ef	t	Rwinuma	9b4a4c27-0eae-40b2-8a8d-4ba08a6f0d93
e60aec68-ff59-4721-9a02-d2545746177e	t	Nyamiyaga	227c848d-2a3f-4a74-b583-3ddde1e62778
d949a991-e5bc-43d7-a709-545b659f9037	t	Gihemba	075c957f-3f2c-4633-a480-eabd2f0d6626
9116f5e6-90bb-4d09-b69e-9366fea3d0dc	t	Kabingo	075c957f-3f2c-4633-a480-eabd2f0d6626
4479cd6a-448e-445c-b681-1b2ee753effe	t	Mushongi	075c957f-3f2c-4633-a480-eabd2f0d6626
8352e829-0b33-4410-9df8-d6d6897f88f4	t	Gatete	0cb3639f-451d-4f71-b992-86b1c33bc1d1
629d6777-582b-4bea-9d5b-86eca147f213	t	Mugenda I	0cb3639f-451d-4f71-b992-86b1c33bc1d1
60032d07-3755-4638-912f-084898890c0d	t	Base	c67fc204-cce9-4d62-b585-30b30de2f3e1
5b725db1-8ebe-4a6f-850f-d5ba55680171	t	Cyondo	c67fc204-cce9-4d62-b585-30b30de2f3e1
7669b1a3-03c5-4018-a842-745bb2795aa3	t	Kiruli	c67fc204-cce9-4d62-b585-30b30de2f3e1
a9c0d5f2-6cd3-49e1-ab6f-6d3bf0edf16a	t	Gacyamo	5e5e1a51-e28d-4edb-8c38-12a44f9d49c7
0d8000f8-a2b5-4d52-ab7d-f7b32f69c367	t	Mataba	f0d808eb-bf24-452d-a9c6-a1808d694ae0
40e054ab-c187-40c5-9735-c0fc5c9e1c63	t	Ryinzovu	ff6b1c8b-2c37-4040-aa5b-31b2a7e59e2f
c8f13b0c-5237-4a7b-9a19-511741736227	t	Remera	bd965e36-8dd1-465b-900d-6b1659cf43e7
b5743ca1-4471-4b9d-8e28-05c2f4afc546	t	Rulindo	bd965e36-8dd1-465b-900d-6b1659cf43e7
d7a91bbf-3358-4933-8392-84339955dc1d	t	Cyiri	78adca9d-41e6-4705-92b6-aa23361f16e6
9b2ebce1-008e-4589-b28d-78cd818c1890	t	Gashiru	78adca9d-41e6-4705-92b6-aa23361f16e6
dd7f860c-eb11-4090-9069-b31be9f236b3	t	Kivomo	78adca9d-41e6-4705-92b6-aa23361f16e6
39936331-e6ef-4947-be5f-ee27b29e7d2e	t	Rebero	c4b913e2-5554-4d7a-905e-42c9993fd136
21ec5a8f-23ab-4012-98b0-705e9038281d	t	Rwanzu	c4b913e2-5554-4d7a-905e-42c9993fd136
bd2202ca-db49-4a1b-8fc2-ce5de12a6576	t	Gatare	666302f9-4390-4270-84b6-2620b7e40161
8ecd0b29-a689-4733-a356-49df2124873b	t	Muko	666302f9-4390-4270-84b6-2620b7e40161
117c85ef-bf01-43f6-b81f-a060ad457d3a	t	Mukoto	666302f9-4390-4270-84b6-2620b7e40161
417a52a1-81ec-4db2-b364-4cbf1f1443a4	t	Bubiro	353f6c52-e1dc-4f26-98c7-411cddf02f75
e5e91159-a043-4d0a-88d4-9379096f0e74	t	Nyirangarama	353f6c52-e1dc-4f26-98c7-411cddf02f75
23a5e718-6fac-484f-81a2-9c79c728a4ea	t	Remera	353f6c52-e1dc-4f26-98c7-411cddf02f75
5aecdae0-db02-4633-bc56-e0959b2946b4	t	Tare	353f6c52-e1dc-4f26-98c7-411cddf02f75
446c7a5f-4ac9-4e11-a458-44eb4d7ab7cf	t	Rugarama	ff854686-79be-4f08-9a83-f4a6c449a3df
096d5f8d-b359-4de7-9684-15af287c2b3d	t	Kankanga	acd618c3-4d0f-4911-8af7-f204108db92b
3f7c7cf0-aa33-4ff4-ba93-ad22e32f0ff6	t	Bunyana	1cb3f1ef-090e-40de-ba50-88b70d1affd3
c90a6444-2613-4731-9a96-7e50ddfa55f7	t	Gipfundo	1cb3f1ef-090e-40de-ba50-88b70d1affd3
5e6e8b36-da8e-4b8a-9d61-f28d64469cfa	t	Munini	0fee8ed7-276a-433d-b4e8-b9bd6ab00f1c
495865c8-14ad-48ba-9a9e-b411e157baee	t	Rutabo	0fee8ed7-276a-433d-b4e8-b9bd6ab00f1c
4f83b6c1-ff01-4189-b4a4-11ed7279e458	t	Cyasenge	bcc4b1c0-43a8-43df-b845-46045e2921aa
8c3f66e5-961c-45f4-83ba-5540165a1f44	t	Karambo	bcc4b1c0-43a8-43df-b845-46045e2921aa
2e68d733-b93b-4cb6-a6b1-8b96d9aed6a2	t	Kigarama	bcc4b1c0-43a8-43df-b845-46045e2921aa
ccae9110-1af4-467c-a4a7-4dd8012c7990	t	Mataba	8798f04c-58fa-47fd-b14a-959c2920e64b
cb7d691a-9c5f-452a-9211-d395dff71324	t	Kamatongo	75a16664-1f6f-4253-b710-0636a9a92235
7d7f08d9-a79c-4dd5-adb7-1c0e5d953251	t	Gitabage	99d53ab2-b4a4-480b-b4a5-2040bfcd93c9
ab09a872-971a-4877-9991-e9b7fc1bd27b	t	Karambo	99d53ab2-b4a4-480b-b4a5-2040bfcd93c9
550bf0a7-1490-4ce0-a53a-24ac61edad29	t	Marembo	99d53ab2-b4a4-480b-b4a5-2040bfcd93c9
eb457f76-7c68-4c44-9828-226ebe00f638	t	Nyamugali	99d53ab2-b4a4-480b-b4a5-2040bfcd93c9
25113586-3602-4934-ac8e-4e5701cbd7ce	t	Remera	99d53ab2-b4a4-480b-b4a5-2040bfcd93c9
c136e9e6-2e90-449f-a234-1fb073c2aa38	t	Gasekabuye	2a07c267-3122-4ce4-bbee-c253b61e32ca
98ac91d6-335b-4938-b5a5-5ab8869ee3dc	t	Kibogora	39fa42fc-383e-482d-bd9e-a76d363db69e
49705f51-649b-46e5-99fe-5e51f6981fca	t	Nyagatovu	39fa42fc-383e-482d-bd9e-a76d363db69e
8af1d611-2d85-46f0-96ac-65f3442dbb33	t	Buyaga	907d4ca5-be56-4e3e-ac4c-e3103ab35ddb
8aa8840e-8061-401a-a4a2-4f60cf7e7ed8	t	Gahinga	907d4ca5-be56-4e3e-ac4c-e3103ab35ddb
f6acc311-c78a-4caa-a4a9-fb6a693242e1	t	Kibuye	907d4ca5-be56-4e3e-ac4c-e3103ab35ddb
17fd673b-9988-45b9-8e82-23eb74ad418c	t	Kidomo	907d4ca5-be56-4e3e-ac4c-e3103ab35ddb
61cef9fb-3251-4f33-ad33-6c7181583b8d	t	Murambo	907d4ca5-be56-4e3e-ac4c-e3103ab35ddb
7eb4ce29-c50d-4bc4-8beb-7bbadaec0a52	t	Rusayu	907d4ca5-be56-4e3e-ac4c-e3103ab35ddb
125661d7-4465-4b06-a535-2cc5860bcd09	t	Karambi	7c7ed2d9-d93a-47b1-9324-4e2674ff5373
6c70155b-24e6-4e90-9c45-8b2bb89a79bb	t	Nturo	7c7ed2d9-d93a-47b1-9324-4e2674ff5373
eac111e7-f8a7-4b5f-9328-8441d17d5153	t	Sakara	7c7ed2d9-d93a-47b1-9324-4e2674ff5373
4d89eda5-8e2b-414a-895a-792dfa6f23ec	t	Akamiyove	13d88bc6-6ac9-4bdd-9b48-29f6f12c250e
6edca17e-9bd2-4ec5-9976-33688dd3ac43	t	Kinihira	13d88bc6-6ac9-4bdd-9b48-29f6f12c250e
929dc6d4-863f-4b15-ab5f-4dfc74f34569	t	Bwishya	92affa87-6a0d-4ee9-a507-c26bdc789f04
7934d721-7b94-44d3-933e-d667de14e37e	t	Gatembe	92affa87-6a0d-4ee9-a507-c26bdc789f04
a140fc10-5504-4d6c-bf2f-021234a64e55	t	Kigali	e357546f-633c-4f56-9707-c54d88621a27
f05954ca-8f1d-4e56-82b4-7857065c8ebf	t	Kabuga	b4b27848-1559-4e27-a1ab-8832c393058c
e09bf59d-e0e3-4228-9213-1da77f20c93f	t	Gakenke	b0b9a06b-72e5-49c0-888c-6acce2f1e796
f9344a8a-d993-4a6a-a5e5-7fc9a41e567d	t	Gasharu	a3804965-a2c9-43f7-975f-d8bcaf09faba
213a9867-6d2c-4f92-9108-c81c5d975092	t	Runyinya	a3804965-a2c9-43f7-975f-d8bcaf09faba
4e13b571-6677-4bb0-a9ae-9431b796eac1	t	Kirenge	7fd08877-efa9-4d6c-9bf4-ab211129640b
f093c1ac-4141-4fde-a3da-e754daa23477	t	Nyakarekare	7fd08877-efa9-4d6c-9bf4-ab211129640b
4a98e748-fe68-4c93-bbd1-25c7e3813943	t	Akamanama	8f296180-394f-4bc4-acdb-13193cc28edf
6e499957-c9b5-4321-bd69-d754ab5cee13	t	Gishinge	8f296180-394f-4bc4-acdb-13193cc28edf
1a1ea689-ded1-4a03-a201-0a90d856cb5e	t	Kibingwe	8f296180-394f-4bc4-acdb-13193cc28edf
5ff7395e-e626-447b-a5e4-f24d03276769	t	Mugomero	8f296180-394f-4bc4-acdb-13193cc28edf
4d11136c-c0b3-445b-aadc-e2bf93ce0a9d	t	Cyasuri	72ff90f2-23b9-4b10-b2c6-c2469f257076
34242d6e-378f-4b4f-b79d-61eee358756e	t	Rusongati	72ff90f2-23b9-4b10-b2c6-c2469f257076
d0942b9f-64cf-4f78-8c75-6650a975bfa7	t	Gisiza	61cb21f5-591b-4543-9597-940a832d41b8
5d4ef8f0-500b-4505-bb9f-b7595b8797a2	t	Kanunga	61cb21f5-591b-4543-9597-940a832d41b8
f8932238-abfd-4c0d-a9dd-b283c1d148d4	t	Kigarama	61cb21f5-591b-4543-9597-940a832d41b8
b8de2dcf-f3c4-482f-bb50-1b5f2890f268	t	Nyakibande	61cb21f5-591b-4543-9597-940a832d41b8
de71e722-c4c7-425e-81c7-3485b9eeae92	t	Nyakizu	61cb21f5-591b-4543-9597-940a832d41b8
d8e97e70-cb11-427f-b727-271bc70683ae	t	Rubaya	61cb21f5-591b-4543-9597-940a832d41b8
a5da8ea9-befb-4209-87b2-0101ecfc0982	t	Gacyamo	bbc1efdf-4b3f-45c9-ac99-184c41e5b4b3
55d8f01f-0aa0-4628-90db-d815fcce8d1a	t	Marenge	bbc1efdf-4b3f-45c9-ac99-184c41e5b4b3
d9e34cc2-6f7d-42c1-b860-a94095ebbec0	t	Nyakabungo	bbc1efdf-4b3f-45c9-ac99-184c41e5b4b3
fdaf9480-75b0-46f3-a7ec-9cba5961ef51	t	Rukurazo	bbc1efdf-4b3f-45c9-ac99-184c41e5b4b3
63fb6269-ed3a-4111-a8b1-3628642e00b1	t	Nyarurembo	53693072-853c-4d11-931c-5da397c6c398
89a8d466-0f3e-47dc-9b65-2642bc793ecd	t	Rebero	53693072-853c-4d11-931c-5da397c6c398
78498621-d7d1-4acf-9f2b-ab640127ff29	t	Kabeza	6e7ec98a-36a0-4060-985b-b2b395e0d6c7
e455a408-e7a4-4afe-b621-9918ae6908ed	t	Kabuga	6e7ec98a-36a0-4060-985b-b2b395e0d6c7
085c2c8b-0c7c-4841-94a2-4be05c75cdb4	t	Kigomwa	6e7ec98a-36a0-4060-985b-b2b395e0d6c7
162da1bb-4d8e-4c61-9189-80a5f7c194aa	t	Marembo	6e7ec98a-36a0-4060-985b-b2b395e0d6c7
bf7738b4-6d36-4c24-adee-103b2a54dd16	t	Amataba	31d7c56e-824e-4239-a234-766d7dc3d7c2
b8511f45-1b80-489a-ad33-685fc0ccc26b	t	Umubuga	31d7c56e-824e-4239-a234-766d7dc3d7c2
8cf4dd2b-d28b-4461-a3b1-b2cd420ce911	t	Buhira	454a8229-f8c9-454a-aaa4-68901313f9ab
6a17d598-62b4-4bf0-bede-6157cadb6ec9	t	Gasama	454a8229-f8c9-454a-aaa4-68901313f9ab
58823f91-8c7b-404f-895c-227e4e36cbb2	t	Kibaya	454a8229-f8c9-454a-aaa4-68901313f9ab
2b29de1b-fe91-4d64-a2ae-fc9f635dc025	t	Bukongi	8300d45a-dc93-4889-92a8-a22fc848a3f3
98ee0c0e-b4a3-4cac-8c95-712e7bd58f32	t	Buraro	8300d45a-dc93-4889-92a8-a22fc848a3f3
7000f49a-cc4b-467b-be37-c1f7adcae6be	t	Gikombe	66a4ba9d-b1a7-4c72-b41f-0a5987b09d17
d1410a0b-3e6a-4075-b855-81728c21eb99	t	Gisha	66a4ba9d-b1a7-4c72-b41f-0a5987b09d17
b80afa65-0328-48fb-b247-981ad0b245ee	t	Muhora	66a4ba9d-b1a7-4c72-b41f-0a5987b09d17
79285a6d-4cc4-490b-ab3e-c7c0878f6ce9	t	Gicumbi	81ea7634-9af0-488c-aea9-bb5f584fcc47
5fe37c63-d5d6-422b-93d2-c278ac82ab83	t	Karambo	c502812e-6ef1-4507-bd97-3edbe6c06e59
02da46f6-de5a-42b3-9e82-649d39da3fff	t	Karwa	c502812e-6ef1-4507-bd97-3edbe6c06e59
e6778be2-d97e-4c90-b201-591ee453dbea	t	Mayange	c502812e-6ef1-4507-bd97-3edbe6c06e59
566b7ed9-6ca2-4f2b-9546-64e75046e927	t	Nyagisozi	c502812e-6ef1-4507-bd97-3edbe6c06e59
7091a946-99c2-47d7-a421-26d7ea2366fa	t	Taba	c502812e-6ef1-4507-bd97-3edbe6c06e59
5054080d-7dac-45b8-a60c-3d437146148a	t	Akarambi	2b20de79-f953-45f0-b57f-5f6a8288cca3
2f0a17ad-db58-4d90-9dfe-2c4092374623	t	Nyarurembo	fba0a7b9-364f-4370-ad83-45a75f145e55
cd2b7e15-e95b-4e03-bae5-0fe5c6372826	t	Ruri	fba0a7b9-364f-4370-ad83-45a75f145e55
ff2307d1-8670-4143-98f9-b1f153e1b278	t	Munyinya	87f7d85c-f717-437c-b830-ed189fb7d34d
c2f4ca04-4aca-4a78-acfa-638c6d4728f4	t	Rurama	87f7d85c-f717-437c-b830-ed189fb7d34d
92d7aaa4-8137-482a-8b00-94948bd43f74	t	Nyabuko	ed18c39d-5c29-49ab-a016-7b2eff6ecb72
8cd74ced-414c-4604-a02b-bba20d2e6681	t	Butare	5c3b7ece-b7cd-4c01-bbde-bef8bb9fdb6b
560359cf-93da-4de5-9116-bd76ea014685	t	Jyambere	5c3b7ece-b7cd-4c01-bbde-bef8bb9fdb6b
0ccd4cf1-16e5-4127-9adf-ec7bb5bdc226	t	Kagwa	5c3b7ece-b7cd-4c01-bbde-bef8bb9fdb6b
2c4ae798-b7ed-4e65-9857-2e35d49fbaa1	t	Karambi	5c3b7ece-b7cd-4c01-bbde-bef8bb9fdb6b
a15ddaf8-4cd0-4923-a46b-925aee6e9d16	t	Mwishya	e3ed9bc6-7116-4914-a9a8-d6a73427b615
3899bd10-5fb5-46f3-85ce-fb505209c8f8	t	Riryi	e3ed9bc6-7116-4914-a9a8-d6a73427b615
82ac59fd-3d14-4d15-9ad5-377ec26fce4b	t	Sakara	e3ed9bc6-7116-4914-a9a8-d6a73427b615
4b96d016-8942-452e-96f9-e0491c2e37b0	t	Kirungu	bef4a4ff-47c0-4b80-b3dd-e0c7fee70eb2
0f5ad42e-c0d9-4984-99fe-14ad0ec5ad9c	t	Nyaruvumu	bef4a4ff-47c0-4b80-b3dd-e0c7fee70eb2
64e1996a-d79c-4049-bc26-c3af707ad3e1	t	Rushayu	bef4a4ff-47c0-4b80-b3dd-e0c7fee70eb2
ded63222-53a2-439e-a757-3e96bd19ffe9	t	Bikamba	f4209573-ec17-45cb-b05a-e1c72d2bc26a
a03a40fb-b0ce-42a8-850b-e4572e5213c1	t	Cyamutara	f4209573-ec17-45cb-b05a-e1c72d2bc26a
6ae1305f-6fa5-4919-864f-0b872b615e6e	t	Gitambi	f4209573-ec17-45cb-b05a-e1c72d2bc26a
97b866b2-5f3e-4cfa-9ddc-952df5dc3cdb	t	Kazi	f4209573-ec17-45cb-b05a-e1c72d2bc26a
e147a0df-c1ac-40e6-87b9-082e75ed1593	t	Nyakambu	f4209573-ec17-45cb-b05a-e1c72d2bc26a
0dccef67-ba84-40e8-bf4d-aada22ed690f	t	Nyarubuye	f4209573-ec17-45cb-b05a-e1c72d2bc26a
8931207c-a616-4f75-8740-62d161e751f0	t	Rukore	f4209573-ec17-45cb-b05a-e1c72d2bc26a
45c84ea9-fd7b-438c-8b2a-e7685ded460d	t	Rusasa	f4209573-ec17-45cb-b05a-e1c72d2bc26a
5cfd468e-4c1d-4ca4-b128-b28ea853451a	t	Kabirizi	ed96d5c3-254a-42bb-bd02-e3cd9381d578
24a89819-5eba-4307-8f22-6b726dcca299	t	Nyagisozi	ed96d5c3-254a-42bb-bd02-e3cd9381d578
5c65a1c1-3cb4-4ba3-a85c-5e0f1a65f9bc	t	Burambi	0e667f40-5e2b-45f1-bd74-9f9523664433
f8c4a42d-aaf0-4d55-be6e-1b2f516f6d39	t	Karera	0e667f40-5e2b-45f1-bd74-9f9523664433
3192cc9e-75f1-4872-91ad-0ea67cb6ed10	t	Rusekabuye	0e667f40-5e2b-45f1-bd74-9f9523664433
2a26903b-1c26-4e63-b9b3-43abeaa4a339	t	Rukingu	0785fd31-685c-458c-a7ff-7d7becd5820f
d779fe7c-2d17-45e4-b867-8190a7282784	t	Shyondwe	0785fd31-685c-458c-a7ff-7d7becd5820f
0557258e-e2e6-4085-8215-258c40e09df8	t	Gatwa	2d252f2f-21b3-49f1-aa11-3f07c88cac8e
61eaa1ad-5d62-40d9-8094-9dd4ed6cadbf	t	Kadendegeri	2d252f2f-21b3-49f1-aa11-3f07c88cac8e
dbe8be91-c99c-4e20-9763-e7ec28dc0564	t	Gahwazi	91198b9e-3449-42b4-a56e-4fc32d1bad09
30ff137d-4b2c-44d3-b153-7a754e91e6e7	t	Gakubo	91198b9e-3449-42b4-a56e-4fc32d1bad09
63decb82-5b93-4d11-a0a3-27b74d88aa7e	t	Mataba	91198b9e-3449-42b4-a56e-4fc32d1bad09
aaf30906-7785-40da-89b4-494ad2d2a139	t	Kibare	36edce68-d553-45e9-a51a-bbe481c3efeb
4cac9b39-7cf1-44ac-a5a7-460291e89377	t	Mujebe	36edce68-d553-45e9-a51a-bbe481c3efeb
b2012c25-283a-409e-8aa0-4c98dfa28be2	t	Kabunigu	89956ede-f8cd-41ac-8d4c-c1494609c92a
c1f6ef02-a18a-4430-a511-56ac329fec3f	t	Nkanga	89956ede-f8cd-41ac-8d4c-c1494609c92a
44b683b0-8a94-48ca-82cd-f5238e5e3d19	t	Rwintare	89956ede-f8cd-41ac-8d4c-c1494609c92a
fb6820fb-c8a4-4a55-925d-88fe0ae45ca7	t	Kigarama	301164a7-c391-4743-af33-c0cb316da2ca
34dd6b75-47fd-48d6-995c-304a50336f61	t	Kinini-rusiga	301164a7-c391-4743-af33-c0cb316da2ca
c1b9035f-f831-47d5-8d04-b407a4ebca7d	t	Bitare	5947091c-cf91-4640-b13f-d79a9810d86d
09412c39-c94c-4220-a4dd-095697a46ab0	t	Nyakarama	5947091c-cf91-4640-b13f-d79a9810d86d
9276ccb6-6791-4ae7-8993-533e273a5bf2	t	Gatimba	fb309eb3-d949-4fef-a486-a122eb7e33f9
5ee766f7-ea73-4f98-86fc-d95c90bce610	t	Gatwa	fb309eb3-d949-4fef-a486-a122eb7e33f9
70199c2a-fefb-468d-bdb0-069217cdceba	t	Gisiza	fb309eb3-d949-4fef-a486-a122eb7e33f9
38ffb3a3-aba0-47e8-bd4d-eaa400e8e0bf	t	Kabaraza	fb309eb3-d949-4fef-a486-a122eb7e33f9
4d029df5-c4bd-4582-afbe-4f3ec1da0adb	t	Kiziranyenzi	fb309eb3-d949-4fef-a486-a122eb7e33f9
3d3b5cd6-3ad6-4819-b10f-8aa12d969b17	t	Nyarushinya	fb309eb3-d949-4fef-a486-a122eb7e33f9
b233e5aa-0e60-4789-a9f1-33a073e0b2c4	t	Gaseke	e9ee49da-346f-4747-a622-956696f42875
825df5c8-f11d-4be4-aac7-a2d7e93dc862	t	Kabagabaga	e9ee49da-346f-4747-a622-956696f42875
491b4918-0777-4279-b09c-96d17b1bedbf	t	Kivili	f251d8bb-aa76-42e1-88bd-cb7d59729f7d
f23b0a4f-fcdd-461f-b2cb-73fd6e784cb8	t	Muvumu	f251d8bb-aa76-42e1-88bd-cb7d59729f7d
6ce4dbf9-c239-4330-b8e8-72e1980c9512	t	Rwahi	cd0169ad-c97f-4896-9bff-d5f68defc787
c1f05ef4-4890-4280-8bb8-024d43dc6f50	t	Bugarura	b018143f-1c3f-4d4f-8cd2-daefd38b786d
8b69827c-1920-4c9e-bc0c-2140b8eec20c	t	Mwagiro	b018143f-1c3f-4d4f-8cd2-daefd38b786d
f712606d-44b2-4356-914a-b69489060309	t	Ngendo	b018143f-1c3f-4d4f-8cd2-daefd38b786d
ee744096-ab5e-46e2-a51d-4b0ed7903acb	t	Nyabisindu	b018143f-1c3f-4d4f-8cd2-daefd38b786d
7fc38f9f-c3e9-4cf5-b37e-f60c1d847781	t	Nyabyondo	b018143f-1c3f-4d4f-8cd2-daefd38b786d
9648cc82-6007-4d6e-8dd3-a4116c60b394	t	Nyamirembe	b018143f-1c3f-4d4f-8cd2-daefd38b786d
023c0500-157c-4e4d-aff5-fbebb520dba5	t	Rweya	b018143f-1c3f-4d4f-8cd2-daefd38b786d
5ee01fe8-a081-418c-af26-962ece408069	t	Gaseke	fca17902-d0bb-452d-8a54-08607be6e612
f9b67a82-2b0c-4b72-9774-e4e02a6a66d3	t	Karambi	fca17902-d0bb-452d-8a54-08607be6e612
79932730-0b23-4918-b238-ed1a46fa4ac3	t	Rukore	fca17902-d0bb-452d-8a54-08607be6e612
dd741651-526a-4469-be71-cb949a069d17	t	Mafene	e6d81045-9f37-4fff-ba6b-ee8b727803c9
8de5e10f-9458-475c-b5a8-63ff9ea0ab36	t	Kanaba	91f3ab4e-6f0f-43d0-be14-c1e3bb5d6fb4
04339dbd-17ff-48a3-b83d-d4377a5fbe14	t	Misezero	91f3ab4e-6f0f-43d0-be14-c1e3bb5d6fb4
6fdcb343-7cd5-457d-b3a1-0cba50e3b4b8	t	Bukinga	e38b8b7d-81fe-4b06-b3e9-e5f3715c3f8e
8443437c-6077-4d9e-8291-9aae6a01a84d	t	Murambi	e38b8b7d-81fe-4b06-b3e9-e5f3715c3f8e
9cd0b12a-4d8c-4b47-8cc4-99b45d038b24	t	Kamuragi	b8bf52a0-9837-4f77-9df3-0f002583f651
6d59b29c-0062-4e5c-9080-bd74ce947c74	t	Nyirambuga	b8bf52a0-9837-4f77-9df3-0f002583f651
5f6a223e-a7b0-48be-ad65-4a4b8cb5c65e	t	Ruvumba	b8bf52a0-9837-4f77-9df3-0f002583f651
\.


--
-- Data for Name: wishlist_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wishlist_items (id, created_at, created_by, updated_at, updated_by, product_id, user_id) FROM stdin;
\.


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cells cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cells
    ADD CONSTRAINT cells_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chat_sessions chat_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_sessions
    ADD CONSTRAINT chat_sessions_pkey PRIMARY KEY (id);


--
-- Name: communication_logs communication_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communication_logs
    ADD CONSTRAINT communication_logs_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: customer_addresses customer_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_addresses
    ADD CONSTRAINT customer_addresses_pkey PRIMARY KEY (id);


--
-- Name: customer_metrics customer_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_metrics
    ADD CONSTRAINT customer_metrics_pkey PRIMARY KEY (id);


--
-- Name: customer_profiles customer_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_profiles
    ADD CONSTRAINT customer_profiles_pkey PRIMARY KEY (id);


--
-- Name: customer_segments customer_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_segments
    ADD CONSTRAINT customer_segments_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: faq_articles faq_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_articles
    ADD CONSTRAINT faq_articles_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: financial_reports financial_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financial_reports
    ADD CONSTRAINT financial_reports_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_orders fulfillment_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_orders
    ADD CONSTRAINT fulfillment_orders_pkey PRIMARY KEY (id);


--
-- Name: inventory_items inventory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_items
    ADD CONSTRAINT inventory_items_pkey PRIMARY KEY (id);


--
-- Name: kpi_records kpi_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kpi_records
    ADD CONSTRAINT kpi_records_pkey PRIMARY KEY (id);


--
-- Name: login_attempts login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_attempts
    ADD CONSTRAINT login_attempts_pkey PRIMARY KEY (id);


--
-- Name: mfa_otps mfa_otps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mfa_otps
    ADD CONSTRAINT mfa_otps_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: order_tracking_events order_tracking_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_tracking_events
    ADD CONSTRAINT order_tracking_events_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- Name: procurement_orders procurement_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procurement_orders
    ADD CONSTRAINT procurement_orders_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: return_requests return_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_requests
    ADD CONSTRAINT return_requests_pkey PRIMARY KEY (id);


--
-- Name: revenues revenues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revenues
    ADD CONSTRAINT revenues_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sales_reports sales_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_reports
    ADD CONSTRAINT sales_reports_pkey PRIMARY KEY (id);


--
-- Name: satisfaction_surveys satisfaction_surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.satisfaction_surveys
    ADD CONSTRAINT satisfaction_surveys_pkey PRIMARY KEY (id);


--
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: security_settings security_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_settings
    ADD CONSTRAINT security_settings_pkey PRIMARY KEY (id);


--
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: support_messages support_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_messages
    ADD CONSTRAINT support_messages_pkey PRIMARY KEY (id);


--
-- Name: support_tickets support_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT support_tickets_pkey PRIMARY KEY (id);


--
-- Name: system_backups system_backups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_backups
    ADD CONSTRAINT system_backups_pkey PRIMARY KEY (id);


--
-- Name: system_configurations system_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_configurations
    ADD CONSTRAINT system_configurations_pkey PRIMARY KEY (id);


--
-- Name: tax_rates tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: tax_records tax_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_records
    ADD CONSTRAINT tax_records_pkey PRIMARY KEY (id);


--
-- Name: products uk61hq67yr3nuuwvx80rbr95r4s; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT uk61hq67yr3nuuwvx80rbr95r4s UNIQUE (inventory_item_id);


--
-- Name: carts uk64t7ox312pqal3p7fg9o503c2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT uk64t7ox312pqal3p7fg9o503c2 UNIQUE (user_id);


--
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: password_reset_tokens uk71lqwbwtklmljk3qlsugr1mig; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT uk71lqwbwtklmljk3qlsugr1mig UNIQUE (token);


--
-- Name: refresh_tokens uk7tdcd6ab5wsgoudnvj7xf1b7l; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT uk7tdcd6ab5wsgoudnvj7xf1b7l UNIQUE (user_id);


--
-- Name: system_configurations uk867jsfttn43kaegq3c6c24b7r; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_configurations
    ADD CONSTRAINT uk867jsfttn43kaegq3c6c24b7r UNIQUE (config_key);


--
-- Name: tax_rates uk88nhapcsosjsuypf5wedngqgk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rates
    ADD CONSTRAINT uk88nhapcsosjsuypf5wedngqgk UNIQUE (code);


--
-- Name: customer_segments uk9v933bm211015c3i1vh4qg1iq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_segments
    ADD CONSTRAINT uk9v933bm211015c3i1vh4qg1iq UNIQUE (name);


--
-- Name: cells uk_cell_sector_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cells
    ADD CONSTRAINT uk_cell_sector_name UNIQUE (sector_id, name);


--
-- Name: districts uk_district_province_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT uk_district_province_name UNIQUE (province_id, name);


--
-- Name: sectors uk_sector_district_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT uk_sector_district_name UNIQUE (district_id, name);


--
-- Name: villages uk_village_cell_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villages
    ADD CONSTRAINT uk_village_cell_name UNIQUE (cell_id, name);


--
-- Name: coupons ukeplt0kkm9yf2of2lnx6c1oy9b; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT ukeplt0kkm9yf2of2lnx6c1oy9b UNIQUE (code);


--
-- Name: refresh_tokens ukghpmfn23vmxfu3spu3lfg4r2d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT ukghpmfn23vmxfu3spu3lfg4r2d UNIQUE (token);


--
-- Name: shipments ukhrhy2yghr8dampg1jtecuekvp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT ukhrhy2yghr8dampg1jtecuekvp UNIQUE (order_id);


--
-- Name: customer_metrics ukhuf800pbo311daueruwtpgd4w; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_metrics
    ADD CONSTRAINT ukhuf800pbo311daueruwtpgd4w UNIQUE (customer_id);


--
-- Name: mfa_otps ukicfpxf4f0hvk8up1epwolbe29; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mfa_otps
    ADD CONSTRAINT ukicfpxf4f0hvk8up1epwolbe29 UNIQUE (mfa_token);


--
-- Name: customer_profiles ukjoftwv6r96fq3bdnu7q00hq1w; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_profiles
    ADD CONSTRAINT ukjoftwv6r96fq3bdnu7q00hq1w UNIQUE (customer_id);


--
-- Name: provinces ukl256wnwfdobq071mcq7rckr9y; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT ukl256wnwfdobq071mcq7rckr9y UNIQUE (name);


--
-- Name: return_requests ukmlyu5yxuty6xy4bndr5rrnfr0; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_requests
    ADD CONSTRAINT ukmlyu5yxuty6xy4bndr5rrnfr0 UNIQUE (order_id);


--
-- Name: fulfillment_orders ukng3qc69pwbil0dalh7vkmueod; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_orders
    ADD CONSTRAINT ukng3qc69pwbil0dalh7vkmueod UNIQUE (order_id);


--
-- Name: orders uknthkiu7pgmnqnu86i2jyoe2v7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT uknthkiu7pgmnqnu86i2jyoe2v7 UNIQUE (order_number);


--
-- Name: roles ukofx66keruapi6vyqpv6f2or37; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT ukofx66keruapi6vyqpv6f2or37 UNIQUE (name);


--
-- Name: inventory_items ukp0mih1lkha7t38jh46r3uu0eg; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_items
    ADD CONSTRAINT ukp0mih1lkha7t38jh46r3uu0eg UNIQUE (sku);


--
-- Name: satisfaction_surveys ukpv41e93d5s8qmc9eq8ws0hawj; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.satisfaction_surveys
    ADD CONSTRAINT ukpv41e93d5s8qmc9eq8ws0hawj UNIQUE (ticket_id);


--
-- Name: fulfillment_orders ukrkhys3qm94etm6t863ifw77t0; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_orders
    ADD CONSTRAINT ukrkhys3qm94etm6t863ifw77t0 UNIQUE (shipment_id);


--
-- Name: categories ukt8o6pivur7nn124jehx7cygw5; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT ukt8o6pivur7nn124jehx7cygw5 UNIQUE (name);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: villages villages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villages
    ADD CONSTRAINT villages_pkey PRIMARY KEY (id);


--
-- Name: wishlist_items wishlist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT wishlist_items_pkey PRIMARY KEY (id);


--
-- Name: idx_cell_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cell_name ON public.cells USING btree (name);


--
-- Name: idx_cell_sector; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cell_sector ON public.cells USING btree (sector_id);


--
-- Name: idx_district_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_district_name ON public.districts USING btree (name);


--
-- Name: idx_district_province; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_district_province ON public.districts USING btree (province_id);


--
-- Name: idx_province_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_province_name ON public.provinces USING btree (name);


--
-- Name: idx_sector_district; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sector_district ON public.sectors USING btree (district_id);


--
-- Name: idx_sector_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sector_name ON public.sectors USING btree (name);


--
-- Name: idx_village_cell; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_village_cell ON public.villages USING btree (cell_id);


--
-- Name: idx_village_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_village_name ON public.villages USING btree (name);


--
-- Name: refresh_tokens fk1lih5y2npsf8u5o3vhdb9y0os; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT fk1lih5y2npsf8u5o3vhdb9y0os FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: cart_items fk1re40cjegsfvw58xrkdp6bac6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk1re40cjegsfvw58xrkdp6bac6 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: support_tickets fk1tmbsselat6ceyejefrvdeis9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT fk1tmbsselat6ceyejefrvdeis9 FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: product_reviews fk35kxxqe2g9r4mww80w9e3tnw9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk35kxxqe2g9r4mww80w9e3tnw9 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: chat_messages fk3cpkdtwdxndrjhrx3gt9q5ux9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT fk3cpkdtwdxndrjhrx3gt9q5ux9 FOREIGN KEY (session_id) REFERENCES public.chat_sessions(id);


--
-- Name: cells fk3dykl3bvacycgrefqn0kwl7kx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cells
    ADD CONSTRAINT fk3dykl3bvacycgrefqn0kwl7kx FOREIGN KEY (sector_id) REFERENCES public.sectors(id);


--
-- Name: products fk4b4af0ov0jw6r9xtq3tabt5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk4b4af0ov0jw6r9xtq3tabt5a FOREIGN KEY (tax_rate_id) REFERENCES public.tax_rates(id);


--
-- Name: product_reviews fk58i39bhws2hss3tbcvdmrm60f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk58i39bhws2hss3tbcvdmrm60f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk5cyj7v7fvm60i2ubciqfo2wxm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk5cyj7v7fvm60i2ubciqfo2wxm FOREIGN KEY (discount_id) REFERENCES public.discounts(id);


--
-- Name: products fk5u9vbactm63h16y9fj00t798f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk5u9vbactm63h16y9fj00t798f FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_items(id);


--
-- Name: chat_sessions fk6acn2awn3clx0yvpn8htd70be; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_sessions
    ADD CONSTRAINT fk6acn2awn3clx0yvpn8htd70be FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: communication_logs fk81wbm56ml5kl04lda12gxhrxs; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communication_logs
    ADD CONSTRAINT fk81wbm56ml5kl04lda12gxhrxs FOREIGN KEY (handled_by_id) REFERENCES public.users(id);


--
-- Name: districts fk82doq1t64jhly7a546lpvnu2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT fk82doq1t64jhly7a546lpvnu2c FOREIGN KEY (province_id) REFERENCES public.provinces(id);


--
-- Name: feedbacks fk8kw5agn6ypgg4lkjrbc54wk0c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk8kw5agn6ypgg4lkjrbc54wk0c FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: customer_profiles fk9b8jyctrw1rowxsyiwmvh3gae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_profiles
    ADD CONSTRAINT fk9b8jyctrw1rowxsyiwmvh3gae FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: fulfillment_orders fk9r0ufkesaxvhurv9q8fch75ka; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_orders
    ADD CONSTRAINT fk9r0ufkesaxvhurv9q8fch75ka FOREIGN KEY (shipment_id) REFERENCES public.shipments(id);


--
-- Name: customer_profiles fk9u9qbkn57pxecpxjstd68deti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_profiles
    ADD CONSTRAINT fk9u9qbkn57pxecpxjstd68deti FOREIGN KEY (segment_id) REFERENCES public.customer_segments(id);


--
-- Name: notifications fk9y21adhxn0ayjhfocscqox7bh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk9y21adhxn0ayjhfocscqox7bh FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: villages fkancrfdwvkb9r5d743uydn9ocf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villages
    ADD CONSTRAINT fkancrfdwvkb9r5d743uydn9ocf FOREIGN KEY (cell_id) REFERENCES public.cells(id);


--
-- Name: chat_sessions fkao4yreakip07aurht94h7lo6r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_sessions
    ADD CONSTRAINT fkao4yreakip07aurht94h7lo6r FOREIGN KEY (agent_id) REFERENCES public.users(id);


--
-- Name: carts fkb5o626f86h46m4s7ms6ginnop; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fkb5o626f86h46m4s7ms6ginnop FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_items fkbioxgbv59vetrxe0ejfubep1w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkbioxgbv59vetrxe0ejfubep1w FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: return_requests fkbski88d6kewx0cbj5pk7nes01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_requests
    ADD CONSTRAINT fkbski88d6kewx0cbj5pk7nes01 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: procurement_orders fkbvdwa0a0j4xip16ocu2twj4bk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procurement_orders
    ADD CONSTRAINT fkbvdwa0a0j4xip16ocu2twj4bk FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_items(id);


--
-- Name: procurement_orders fke1ykrunqgqpagtdqorh0ea8l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procurement_orders
    ADD CONSTRAINT fke1ykrunqgqpagtdqorh0ea8l FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: support_messages fkejv4umpsfsqv4amvnjrmni3xi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_messages
    ADD CONSTRAINT fkejv4umpsfsqv4amvnjrmni3xi FOREIGN KEY (ticket_id) REFERENCES public.support_tickets(id);


--
-- Name: orders fkg3485uyc54ym22haggn1lwumx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkg3485uyc54ym22haggn1lwumx FOREIGN KEY (shipping_address_id) REFERENCES public.customer_addresses(id);


--
-- Name: chat_messages fkgiqeap8ays4lf684x7m0r2729; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT fkgiqeap8ays4lf684x7m0r2729 FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: communication_logs fkgk9474pf5rnu0c37mekk9gap9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communication_logs
    ADD CONSTRAINT fkgk9474pf5rnu0c37mekk9gap9 FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: password_reset_tokens fkk3ndxg5xp6v7wd4gjyusp15gq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT fkk3ndxg5xp6v7wd4gjyusp15gq FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sectors fklj3sbd4y976qcn545xkiptog6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT fklj3sbd4y976qcn545xkiptog6 FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- Name: fulfillment_orders fklqmme8l6wu2wdx6m5pdg5kvc6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_orders
    ADD CONSTRAINT fklqmme8l6wu2wdx6m5pdg5kvc6 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: mfa_otps fkm4pfhtf6c4ov8if1v97yfrpy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mfa_otps
    ADD CONSTRAINT fkm4pfhtf6c4ov8if1v97yfrpy FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fkmb88e3a35geg9rxiefr1qma88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkmb88e3a35geg9rxiefr1qma88 FOREIGN KEY (cashier_id) REFERENCES public.users(id);


--
-- Name: wishlist_items fkmmj2k1i459yu449k3h1vx5abp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT fkmmj2k1i459yu449k3h1vx5abp FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payment_transactions fknsous9qyrjv5ss8que6o6617; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT fknsous9qyrjv5ss8que6o6617 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: support_tickets fko9o82krkf7cg9ic4r5froc83v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT fko9o82krkf7cg9ic4r5froc83v FOREIGN KEY (assigned_agent_id) REFERENCES public.users(id);


--
-- Name: order_items fkocimc7dtr037rh4ls4l95nlfi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkocimc7dtr037rh4ls4l95nlfi FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products fkog2rp4qthbtt2lfyhfo32lsw9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkog2rp4qthbtt2lfyhfo32lsw9 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: cart_items fkpcttvuq4mxppo8sxggjtn5i2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fkpcttvuq4mxppo8sxggjtn5i2c FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: order_tracking_events fkpiysrnkv9a30xirabwtyd0poj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_tracking_events
    ADD CONSTRAINT fkpiysrnkv9a30xirabwtyd0poj FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: customer_metrics fkqj2ewu7pf91h6a56jvd05l6s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_metrics
    ADD CONSTRAINT fkqj2ewu7pf91h6a56jvd05l6s FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: product_images fkqnq71xsohugpqwf3c9gxmsuy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fkqnq71xsohugpqwf3c9gxmsuy FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: customer_addresses fkqptcrpu3x8qle4pawfritva6o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_addresses
    ADD CONSTRAINT fkqptcrpu3x8qle4pawfritva6o FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: wishlist_items fkqxj7lncd242b59fb78rqegyxj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT fkqxj7lncd242b59fb78rqegyxj FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: satisfaction_surveys fkrivxx8qmqpjxdli4nwquxol58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.satisfaction_surveys
    ADD CONSTRAINT fkrivxx8qmqpjxdli4nwquxol58 FOREIGN KEY (ticket_id) REFERENCES public.support_tickets(id);


--
-- Name: shipments fkrnt4wht95lxxplspltrg9681s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT fkrnt4wht95lxxplspltrg9681s FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: categories fksaok720gsu4u2wrgbk10b5n8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fksaok720gsu4u2wrgbk10b5n8d FOREIGN KEY (parent_id) REFERENCES public.categories(id);


--
-- Name: stock_movements fksf8xqne4s20910sgk48jvyx4u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT fksf8xqne4s20910sgk48jvyx4u FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_items(id);


--
-- Name: orders fksjfs85qf6vmcurlx43cnc16gy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fksjfs85qf6vmcurlx43cnc16gy FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: support_messages fkt3x5f2qc7d89medr0xxslx982; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.support_messages
    ADD CONSTRAINT fkt3x5f2qc7d89medr0xxslx982 FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: procurement_orders fkthjya06tx4ktno1tw72q1vogf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procurement_orders
    ADD CONSTRAINT fkthjya06tx4ktno1tw72q1vogf FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- PostgreSQL database dump complete
--

