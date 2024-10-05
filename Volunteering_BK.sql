PGDMP  2                	    |           volunteering_db #   16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)    16.4 /    ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24588    volunteering_db    DATABASE     w   CREATE DATABASE volunteering_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE volunteering_db;
                postgres    false            �            1259    25173    Organization    TABLE     �   CREATE TABLE public."Organization" (
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    country character varying(100) NOT NULL,
    reg_date date NOT NULL
);
 "   DROP TABLE public."Organization";
       public         heap    postgres    false            �            1259    25194    event    TABLE     �   CREATE TABLE public.event (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    location character varying(2048)
);
    DROP TABLE public.event;
       public         heap    postgres    false            �            1259    25193    event_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.event_id_seq;
       public          postgres    false    219            �           0    0    event_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;
          public          postgres    false    218            �            1259    25214    event_volunteer    TABLE     j   CREATE TABLE public.event_volunteer (
    volunteer_id integer NOT NULL,
    event_id integer NOT NULL
);
 #   DROP TABLE public.event_volunteer;
       public         heap    postgres    false            �            1259    25202 	   org_event    TABLE     o   CREATE TABLE public.org_event (
    org_name character varying(255) NOT NULL,
    event_id integer NOT NULL
);
    DROP TABLE public.org_event;
       public         heap    postgres    false            �            1259    25183 	   volunteer    TABLE       CREATE TABLE public.volunteer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    birth_date date,
    organization character varying(255) NOT NULL
);
    DROP TABLE public.volunteer;
       public         heap    postgres    false            �            1259    25182    volunteer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.volunteer_id_seq;
       public          postgres    false    217            �           0    0    volunteer_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.volunteer_id_seq OWNED BY public.volunteer.id;
          public          postgres    false    216            �            1259    25207    voluntering_for    TABLE     �   CREATE TABLE public.voluntering_for (
    org_vol_id integer NOT NULL,
    volunteer_id integer NOT NULL,
    org_name character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);
 #   DROP TABLE public.voluntering_for;
       public         heap    postgres    false            �            1259    25205    voluntering_for_org_vol_id_seq    SEQUENCE     �   CREATE SEQUENCE public.voluntering_for_org_vol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.voluntering_for_org_vol_id_seq;
       public          postgres    false    223            �           0    0    voluntering_for_org_vol_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.voluntering_for_org_vol_id_seq OWNED BY public.voluntering_for.org_vol_id;
          public          postgres    false    221            �            1259    25206     voluntering_for_volunteer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.voluntering_for_volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.voluntering_for_volunteer_id_seq;
       public          postgres    false    223            �           0    0     voluntering_for_volunteer_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.voluntering_for_volunteer_id_seq OWNED BY public.voluntering_for.volunteer_id;
          public          postgres    false    222            �           2604    25197    event id    DEFAULT     d   ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);
 7   ALTER TABLE public.event ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    25186    volunteer id    DEFAULT     l   ALTER TABLE ONLY public.volunteer ALTER COLUMN id SET DEFAULT nextval('public.volunteer_id_seq'::regclass);
 ;   ALTER TABLE public.volunteer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    25210    voluntering_for org_vol_id    DEFAULT     �   ALTER TABLE ONLY public.voluntering_for ALTER COLUMN org_vol_id SET DEFAULT nextval('public.voluntering_for_org_vol_id_seq'::regclass);
 I   ALTER TABLE public.voluntering_for ALTER COLUMN org_vol_id DROP DEFAULT;
       public          postgres    false    223    221    223            �           2604    25211    voluntering_for volunteer_id    DEFAULT     �   ALTER TABLE ONLY public.voluntering_for ALTER COLUMN volunteer_id SET DEFAULT nextval('public.voluntering_for_volunteer_id_seq'::regclass);
 K   ALTER TABLE public.voluntering_for ALTER COLUMN volunteer_id DROP DEFAULT;
       public          postgres    false    222    223    223            r          0    25173    Organization 
   TABLE DATA           H   COPY public."Organization" (name, email, country, reg_date) FROM stdin;
    public          postgres    false    215   9       v          0    25194    event 
   TABLE DATA           I   COPY public.event (id, name, start_date, end_date, location) FROM stdin;
    public          postgres    false    219   j9       {          0    25214    event_volunteer 
   TABLE DATA           A   COPY public.event_volunteer (volunteer_id, event_id) FROM stdin;
    public          postgres    false    224   ;:       w          0    25202 	   org_event 
   TABLE DATA           7   COPY public.org_event (org_name, event_id) FROM stdin;
    public          postgres    false    220   n:       t          0    25183 	   volunteer 
   TABLE DATA           W   COPY public.volunteer (id, name, surname, email, birth_date, organization) FROM stdin;
    public          postgres    false    217   �:       z          0    25207    voluntering_for 
   TABLE DATA           c   COPY public.voluntering_for (org_vol_id, volunteer_id, org_name, start_date, end_date) FROM stdin;
    public          postgres    false    223   3;       �           0    0    event_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.event_id_seq', 4, true);
          public          postgres    false    218            �           0    0    volunteer_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.volunteer_id_seq', 9, true);
          public          postgres    false    216            �           0    0    voluntering_for_org_vol_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.voluntering_for_org_vol_id_seq', 6, true);
          public          postgres    false    221            �           0    0     voluntering_for_volunteer_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.voluntering_for_volunteer_id_seq', 1, false);
          public          postgres    false    222            �           2606    25179    Organization Organization_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Organization"
    ADD CONSTRAINT "Organization_pkey" PRIMARY KEY (name);
 L   ALTER TABLE ONLY public."Organization" DROP CONSTRAINT "Organization_pkey";
       public            postgres    false    215            �           2606    25181    Organization email 
   CONSTRAINT     P   ALTER TABLE ONLY public."Organization"
    ADD CONSTRAINT email UNIQUE (email);
 >   ALTER TABLE ONLY public."Organization" DROP CONSTRAINT email;
       public            postgres    false    215            �           2606    25201    event event_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.event DROP CONSTRAINT event_pkey;
       public            postgres    false    219            �           2606    25218 $   event_volunteer event_volunteer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.event_volunteer
    ADD CONSTRAINT event_volunteer_pkey PRIMARY KEY (volunteer_id, event_id);
 N   ALTER TABLE ONLY public.event_volunteer DROP CONSTRAINT event_volunteer_pkey;
       public            postgres    false    224    224            �           2606    25268    org_event org_event_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.org_event
    ADD CONSTRAINT org_event_pkey PRIMARY KEY (org_name, event_id);
 B   ALTER TABLE ONLY public.org_event DROP CONSTRAINT org_event_pkey;
       public            postgres    false    220    220            �           2606    25192    volunteer volunteer_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.volunteer DROP CONSTRAINT volunteer_email_key;
       public            postgres    false    217            �           2606    25190    volunteer volunteer_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.volunteer DROP CONSTRAINT volunteer_pkey;
       public            postgres    false    217            �           2606    25213 $   voluntering_for voluntering_for_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.voluntering_for
    ADD CONSTRAINT voluntering_for_pkey PRIMARY KEY (org_vol_id);
 N   ALTER TABLE ONLY public.voluntering_for DROP CONSTRAINT voluntering_for_pkey;
       public            postgres    false    223            �           2606    25249 -   event_volunteer event_volunteer_event_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_volunteer
    ADD CONSTRAINT event_volunteer_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id) NOT VALID;
 W   ALTER TABLE ONLY public.event_volunteer DROP CONSTRAINT event_volunteer_event_id_fkey;
       public          postgres    false    219    3285    224            �           2606    25244 1   event_volunteer event_volunteer_volunteer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_volunteer
    ADD CONSTRAINT event_volunteer_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteer(id) NOT VALID;
 [   ALTER TABLE ONLY public.event_volunteer DROP CONSTRAINT event_volunteer_volunteer_id_fkey;
       public          postgres    false    224    217    3283            �           2606    25229 !   org_event org_event_event_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.org_event
    ADD CONSTRAINT org_event_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id) NOT VALID;
 K   ALTER TABLE ONLY public.org_event DROP CONSTRAINT org_event_event_id_fkey;
       public          postgres    false    220    219    3285            �           2606    25224 !   org_event org_event_org_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.org_event
    ADD CONSTRAINT org_event_org_name_fkey FOREIGN KEY (org_name) REFERENCES public."Organization"(name) NOT VALID;
 K   ALTER TABLE ONLY public.org_event DROP CONSTRAINT org_event_org_name_fkey;
       public          postgres    false    220    215    3277            �           2606    25219 %   volunteer volunteer_organization_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_organization_fkey FOREIGN KEY (organization) REFERENCES public."Organization"(name) NOT VALID;
 O   ALTER TABLE ONLY public.volunteer DROP CONSTRAINT volunteer_organization_fkey;
       public          postgres    false    217    215    3277            �           2606    25234 -   voluntering_for voluntering_for_org_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voluntering_for
    ADD CONSTRAINT voluntering_for_org_name_fkey FOREIGN KEY (org_name) REFERENCES public."Organization"(name) NOT VALID;
 W   ALTER TABLE ONLY public.voluntering_for DROP CONSTRAINT voluntering_for_org_name_fkey;
       public          postgres    false    3277    215    223            �           2606    25239 1   voluntering_for voluntering_for_volunteer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voluntering_for
    ADD CONSTRAINT voluntering_for_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteer(id) NOT VALID;
 [   ALTER TABLE ONLY public.voluntering_for DROP CONSTRAINT voluntering_for_volunteer_id_fkey;
       public          postgres    false    3283    223    217            r   K   x���)�+IM-*Vu�LL���s(���&r��,t�t�L�}=����s3���RK9]�AJL�Jb���� �-T      v   �   x�m��
�0���S�>��Ս�΁���"�[��J�o�*)�����Fnֵ��h��}�f�ڎp�iĸ/`<�!9��k`���򭤓����`M������h�Z0Ɇ觀~/�<�̀
¡�gj7�_�;�흳��]�.4!�u2p��t����W��+�-��II�u�t>��]1�bJ��LW�      {   #   x�3�4�2�4�2bKNc ��6�M�b���� D"�      w   /   x�s��t�4�r��\a�9�y%��E�
����h|#�:#�=... r%      t   v   x�3��H����I-.�LLLtHJJ�KNN�4200�54�52�t��t�2���+��K��r ��� �4����)�+IM-*Vu���]�\���S՚XV�$�3�jx� �(�      z   \   x�3��t��t�4202�54"���2A�7���`�!�)P>,?�4�$5��X!�$i �46@h1�2�4D�4�� �4������ ��~     