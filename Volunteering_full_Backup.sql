PGDMP  :            
    	    |           volunteering_db #   16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)    16.4     Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    24588    volunteering_db    DATABASE     w   CREATE DATABASE volunteering_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE volunteering_db;
                postgres    false            �            1259    25207    voluntering_for    TABLE     �   CREATE TABLE public.voluntering_for (
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
       public          postgres    false    223            ^           0    0    voluntering_for_org_vol_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.voluntering_for_org_vol_id_seq OWNED BY public.voluntering_for.org_vol_id;
          public          postgres    false    221            �            1259    25206     voluntering_for_volunteer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.voluntering_for_volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.voluntering_for_volunteer_id_seq;
       public          postgres    false    223            _           0    0     voluntering_for_volunteer_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.voluntering_for_volunteer_id_seq OWNED BY public.voluntering_for.volunteer_id;
          public          postgres    false    222            W          0    25207    voluntering_for 
   TABLE DATA           c   COPY public.voluntering_for (org_vol_id, volunteer_id, org_name, start_date, end_date) FROM stdin;
    public          postgres    false    223   �       `           0    0    voluntering_for_org_vol_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.voluntering_for_org_vol_id_seq', 6, true);
          public          postgres    false    221            a           0    0     voluntering_for_volunteer_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.voluntering_for_volunteer_id_seq', 1, false);
          public          postgres    false    222            �           2606    25213 $   voluntering_for voluntering_for_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.voluntering_for
    ADD CONSTRAINT voluntering_for_pkey PRIMARY KEY (org_vol_id);
 N   ALTER TABLE ONLY public.voluntering_for DROP CONSTRAINT voluntering_for_pkey;
       public            postgres    false    223            �           2606    25234 -   voluntering_for voluntering_for_org_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voluntering_for
    ADD CONSTRAINT voluntering_for_org_name_fkey FOREIGN KEY (org_name) REFERENCES public."Organization"(name) NOT VALID;
 W   ALTER TABLE ONLY public.voluntering_for DROP CONSTRAINT voluntering_for_org_name_fkey;
       public          postgres    false    223            �           2606    25239 1   voluntering_for voluntering_for_volunteer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voluntering_for
    ADD CONSTRAINT voluntering_for_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteer(id) NOT VALID;
 [   ALTER TABLE ONLY public.voluntering_for DROP CONSTRAINT voluntering_for_volunteer_id_fkey;
       public          postgres    false    223            W   \   x�3��t��t�4202�54"���2A�7���`�!�)P>,?�4�$5��X!�$i �46@h1�2�4D�4�� �4������ ��~     