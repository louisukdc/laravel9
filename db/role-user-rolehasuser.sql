CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `role` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'karyawan', NULL, NULL),
(3, 'kasir', NULL, NULL),
(4, 'direksi', NULL, NULL);

ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`role`);

ALTER TABLE `role` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` varchar(255) DEFAULT 'Admin',
  `no_rekening` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `atas_nama_bank` text DEFAULT NULL,
  `ttd` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `user` ADD PRIMARY KEY (`id`);

ALTER TABLE `user` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

CREATE TABLE `role_has_user` (
  `id` bigint(20) NOT NULL,
  `fk_user` bigint(20) DEFAULT NULL,
  `fk_role` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

ALTER TABLE `role_has_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role` (`fk_role`),
  ADD KEY `fk_user` (`fk_user`);
ALTER TABLE `role_has_user` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `role_has_user`
  ADD CONSTRAINT `fk_role_has_user` FOREIGN KEY (`fk_role`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `fk_user_has_role` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`);